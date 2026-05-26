import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> jsonToList(String jsonString) {
  try {
    if (jsonString.trim().isEmpty) return [];
    final decoded = jsonDecode(jsonString);
    return decoded is List ? decoded : [];
  } catch (_) {
    return [];
  }
}

DateTime calculateEndTime(
  DateTime? start,
  int durationMinutes,
) {
  final safeStart = start ?? DateTime.now();
  return safeStart.add(Duration(minutes: durationMinutes));
}

String toUtcString(DateTime dt) {
  return dt.toUtc().toIso8601String();
}

String updateItemInList(
  String itemsJson,
  String itemId,
  DateTime newStart,
  int duration,
  bool locked,
) {
  final List list = jsonDecode(itemsJson);

  final updatedList = list.map((item) {
    if (item["id"] == itemId) {
      return {
        "id": item["id"],
        "title": item["title"],
        "start": newStart.toUtc().toIso8601String(),
        "durationMin": duration,
        "locked": locked,
        "end": item["end"], // сохраняем если был
      };
    }
    return item;
  }).toList();

  return jsonEncode(updatedList);
}

String recalculateScheduleJson(
  String itemsJson,
  String workStartIso,
) {
  if (itemsJson.isEmpty || workStartIso.isEmpty) {
    return itemsJson;
  }

  final List list = jsonDecode(itemsJson);

  list.sort((a, b) =>
      DateTime.parse(a["start"]).compareTo(DateTime.parse(b["start"])));

  DateTime current = DateTime.parse(workStartIso).toUtc();

  final List updated = [];

  for (var item in list) {
    final int duration = item["durationMin"] is int
        ? item["durationMin"]
        : int.tryParse(item["durationMin"].toString()) ?? 60;

    final bool locked = item["locked"] == true;

    if (locked) {
      final start = DateTime.tryParse(item["start"] ?? "") ?? current;
      final end = DateTime.tryParse(item["end"] ?? "") ??
          start.add(Duration(minutes: duration));

      updated.add({
        "id": item["id"],
        "title": item["title"],
        "start": start.toUtc().toIso8601String(),
        "end": end.toUtc().toIso8601String(),
        "durationMin": duration, // ✅ сохраняем
        "locked": true, // ✅ сохраняем
      });

      current = end.toUtc();
      continue;
    }

    final start = current;
    final end = start.add(Duration(minutes: duration));

    updated.add({
      "id": item["id"],
      "title": item["title"],
      "start": start.toUtc().toIso8601String(),
      "end": end.toUtc().toIso8601String(),
      "durationMin": duration, // ✅ сохраняем
      "locked": false, // ✅ сохраняем
    });

    current = end;
  }

  return jsonEncode(updated);
}

String? buildWorkStart(
  DateTime? selectedDay,
  int? workStartHour,
) {
  final day = selectedDay ?? DateTime.now();
  final hour = workStartHour ?? 8;
  final dt = DateTime(day.year, day.month, day.day, hour, 0, 0);
  return dt.toUtc().toIso8601String();
}

/// Selects the primary Today item: current first, else next upcoming, else
/// first unfinished.
ItemsRecord? selectPrimaryTodayItem(
  List<ItemsRecord>? items,
  DateTime? now,
) {
  if (items == null || items.isEmpty) {
    return null;
  }

  final effectiveNow = now ?? DateTime.now();

  for (final item in items) {
    final start = item.start;
    final end = item.end;
    if (start != null && end != null) {
      if (!start.isAfter(effectiveNow) && end.isAfter(effectiveNow)) {
        return item;
      }
    }
  }

  ItemsRecord? nextItem;
  DateTime? nextStart;
  for (final item in items) {
    final start = item.start;
    if (start != null && start.isAfter(effectiveNow)) {
      if (nextStart == null || start.isBefore(nextStart)) {
        nextItem = item;
        nextStart = start;
      }
    }
  }
  if (nextItem != null) {
    return nextItem;
  }

  for (final item in items) {
    if (item.status != 'completed') {
      return item;
    }
  }

  return items.first;
}

/// Shifts a selected Plan Board date by the provided day offset.
DateTime? planBoardAddDays(
  DateTime? baseDate,
  int? days,
) {
  final source = baseDate ?? DateTime.now();
  final dayOffset = days ?? 0;
  return source.add(Duration(days: dayOffset));
}

/// Formats the Plan Board month header in Russian.
String? planBoardMonthYear(DateTime? selectedDate) {
  const months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];
  final date = selectedDate ?? DateTime.now();
  return '${months[date.month - 1]} ${date.year}';
}

/// Formats the Plan Board selected day headline in Russian.
String? planBoardDayHeadline(DateTime? selectedDate) {
  const weekdays = [
    'Понедельник',
    'Вторник',
    'Среда',
    'Четверг',
    'Пятница',
    'Суббота',
    'Воскресенье',
  ];
  final date = selectedDate ?? DateTime.now();
  return '${weekdays[date.weekday - 1]}, ${date.day}-е';
}

/// Formats a short weekday label for a Plan Board date.
String? planBoardWeekdayShort(DateTime? selectedDate) {
  const weekdays = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  final date = selectedDate ?? DateTime.now();
  return weekdays[date.weekday - 1];
}

/// Formats a day-of-month label for a Plan Board date.
String? planBoardDayNumber(DateTime? selectedDate) {
  final date = selectedDate ?? DateTime.now();
  return date.day.toString();
}

/// Extracts reordered schedule item IDs from the drag list callback payload.
List<String>? scheduleReorderOrderedIds(String? itemsJson) {
  try {
    if (itemsJson == null || itemsJson.trim().isEmpty) return <String>[];
    final decoded = jsonDecode(itemsJson);
    if (decoded is! List) return <String>[];

    return decoded
        .map((item) {
          if (item is Map && item['id'] != null) {
            return item['id'].toString();
          }
          return null;
        })
        .whereType<String>()
        .toList();
  } catch (_) {
    return <String>[];
  }
}

/// Formats a human-friendly task time label from scheduled or due dates.
String? taskTimeLabel(
  DateTime? scheduledStart,
  DateTime? dueDate,
) {
  final source = scheduledStart ?? dueDate;
  if (source == null) return 'Без срока';

  final parsed =
      source is DateTime ? source : DateTime.tryParse(source.toString());
  if (parsed == null) return 'Без срока';

  const months = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря',
  ];
  String twoDigits(int v) => v.toString().padLeft(2, '0');
  final time = '${twoDigits(parsed.hour)}:${twoDigits(parsed.minute)}';
  final date = '${parsed.day} ${months[parsed.month - 1]} ${parsed.year}';
  return '$time, $date';
}

/// Maps raw task statuses to readable Russian labels.
String? taskStatusLabel(String? status) {
  switch ((status ?? '').toLowerCase().trim()) {
    case 'done':
    case 'completed':
      return 'Завершена';
    case 'in_progress':
    case 'active':
      return 'В работе';
    case 'planned':
      return 'Запланирована';
    case 'overdue':
      return 'Просрочена';
    default:
      return 'Открыта';
  }
}

/// Returns the local start of the selected Plan Board day.
DateTime? planBoardDayStart(DateTime? selectedDate) {
  final source = selectedDate ?? DateTime.now();
  return DateTime(source.year, source.month, source.day);
}

/// Returns the local start of the day after the selected Plan Board day.
DateTime? planBoardNextDayStart(DateTime? selectedDate) {
  final source = selectedDate ?? DateTime.now();
  final start = DateTime(source.year, source.month, source.day);
  return start.add(const Duration(days: 1));
}

/// Checks whether a Plan Board day query found a schedule.
bool? planBoardHasSchedules(List<SchedulesRecord>? schedules) {
  return schedules != null && schedules.isNotEmpty;
}

/// Returns the first schedule document reference for a Plan Board day.
DocumentReference? planBoardFirstScheduleRef(List<SchedulesRecord>? schedules) {
  if (schedules == null || schedules.isEmpty) {
    return null;
  }
  return schedules.first.reference;
}

/// Checks whether a selected Plan Board schedule has visible items.
bool? planBoardHasItems(List<ItemsRecord>? items) {
  return items != null && items.isNotEmpty;
}

/// Returns the selected schedule document ID for Plan Board updates.
String? planBoardScheduleId(DocumentReference? scheduleRef) {
  return scheduleRef?.id ?? '';
}

/// Returns today's date as a YYYY-MM-DD string for generateDailyPlan.
String? todayAsYMD() {
  final now = DateTime.now();
  final mm = now.month.toString().padLeft(2, '0');
  final dd = now.day.toString().padLeft(2, '0');
  return '${now.year}-$mm-$dd';
}

/// Returns true when a task matches the active filter chip.
bool? taskMatchesFilter(
  String? status,
  String? filter,
  DateTime? dueDate,
  DateTime? scheduledStart,
) {
  final f = (filter ?? 'all').toLowerCase().trim();
  if (f == 'all') return true;
  final s = (status ?? '').toLowerCase().trim();
  final now = DateTime.now();
  switch (f) {
    case 'today':
      final src = scheduledStart ?? dueDate;
      if (src == null) return false;
      return src.year == now.year &&
          src.month == now.month &&
          src.day == now.day;
    case 'planned':
      return scheduledStart != null && (s == 'pending' || s == 'active');
    case 'overdue':
      final due = dueDate;
      if (due == null) return false;
      return due.isBefore(now) && s != 'completed' && s != 'done';
    case 'done':
      return s == 'completed' || s == 'done';
    default:
      return true;
  }
}

/// Форматирует строку статуса для TodayPage на русском языке.
String? todayStatusLine(String? status) {
  final s = (status ?? '').toLowerCase().trim();
  switch (s) {
    case 'done':
    case 'completed':
      return 'Статус: Завершена';
    case 'in_progress':
    case 'active':
      return 'Статус: В работе';
    case 'planned':
      return 'Статус: Запланирована';
    case 'snoozed':
      return 'Статус: Отложена';
    case 'needs_reschedule':
      return 'Статус: На перепланировании';
    case 'overdue':
      return 'Статус: Просрочена';
    default:
      return 'Статус: Открыта';
  }
}

/// Форматирует временной диапазон для TodayPage.
String? todayTimeLine(
  DateTime? start,
  DateTime? end,
) {
  if (start == null) return 'Время не задано';
  String fmt(DateTime dt) {
    final local = dt.isUtc ? dt.toLocal() : dt;
    return '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
  }

  if (end == null) return 'С ${fmt(start)}';
  return '⏰ ${fmt(start)} – ${fmt(end)}';
}

/// Возвращает путь документа items в Firestore.
String? todayItemRefPath(ItemsRecord? item) {
  return item?.reference.path ?? "";
}

/// Returns the date of the first schedule in a list, or DateTime.now() when
/// the list is empty.
DateTime? planBoardFirstScheduleDate(List<SchedulesRecord>? schedules) {
  final first = schedules?.firstOrNull;
  return first?.date ?? DateTime.now();
}

/// Finds the schedule item starting right after the current/primary active
/// item.
ItemsRecord? selectNextTodayItem(
  List<ItemsRecord>? items,
  DateTime? now,
) {
  if (items == null || items.isEmpty) return null;
  final effectiveNow = now ?? DateTime.now();

  ItemsRecord? primaryItem;
  for (final item in items) {
    final s = item.start;
    final e = item.end;
    if (s != null &&
        e != null &&
        !s.isAfter(effectiveNow) &&
        e.isAfter(effectiveNow)) {
      primaryItem = item;
      break;
    }
  }
  if (primaryItem == null) {
    DateTime? earliest;
    for (final item in items) {
      final s = item.start;
      if (s != null && s.isAfter(effectiveNow)) {
        if (earliest == null || s.isBefore(earliest)) {
          primaryItem = item;
          earliest = s;
        }
      }
    }
  }
  if (primaryItem == null) return null;

  final primaryStart = primaryItem.start;
  if (primaryStart == null) return null;
  ItemsRecord? nextItem;
  DateTime? nextStart;
  for (final item in items) {
    if (item.reference == primaryItem.reference) continue;
    final s = item.start;
    if (s != null && s.isAfter(primaryStart)) {
      if (nextStart == null || s.isBefore(nextStart)) {
        nextItem = item;
        nextStart = s;
      }
    }
  }
  return nextItem;
}

/// Formats the "Следующий блок" header as "HH:mm  Title" for the HomePage
/// widget.
String? homeNextBlockLabel(
  DateTime? start,
  String? title,
) {
  if (start == null && (title == null || title.isEmpty))
    return 'Нет следующего блока';
  if (start == null) return title ?? '';
  final h = start.hour.toString().padLeft(2, '0');
  final m = start.minute.toString().padLeft(2, '0');
  final t = title ?? '';
  return t.isNotEmpty ? '$h:$m  $t' : '$h:$m';
}

/// Returns true when a nullable items document is non-null.
bool? homeItemPresent(ItemsRecord? item) {
  return item != null;
}

/// Null-safe getter for items document field.
String? homeItemTitle(ItemsRecord? item) {
  return item?.title ?? '';
}

/// Null-safe getter for items document field.
String? homeItemDesc(ItemsRecord? item) {
  return item?.description ?? '';
}

/// Maps event type string to Russian label.
String? eventTypeLabel(String? type) {
  switch ((type ?? '').toLowerCase().trim()) {
    case 'task_completed':
      return 'Задача завершена';
    case 'task_snoozed':
      return 'Задача отложена';
    case 'task_created':
      return 'Задача создана';
    case 'task_updated':
      return 'Задача обновлена';
    case 'session_started':
      return 'Сессия начата';
    case 'session_closed':
      return 'Сессия закрыта';
    default:
      return type ?? 'Событие';
  }
}

/// Returns "Сегодня", "Вчера", or a formatted date string.
String? eventDateLabel(DateTime? timestamp) {
  if (timestamp == null) return '';
  final local = timestamp.isUtc ? timestamp.toLocal() : timestamp;
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final dt = DateTime(local.year, local.month, local.day);
  if (dt == today) return 'Сегодня';
  if (dt == yesterday) return 'Вчера';
  const months = [
    'янв',
    'фев',
    'мар',
    'апр',
    'май',
    'июн',
    'июл',
    'авг',
    'сен',
    'окт',
    'ноя',
    'дек'
  ];
  return '${local.day} ${months[local.month - 1]} ${local.year}';
}

/// Formats event timestamp as HH:mm.
String? eventRelativeTime(DateTime? timestamp) {
  if (timestamp == null) return '';
  final local = timestamp.isUtc ? timestamp.toLocal() : timestamp;
  return '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
}

/// Serializes items into schedule JSON.
String itemsToJson(List<ItemsRecord> items) {
  return jsonEncode(items.map((item) {
    final startIso =
        DateTime.tryParse(item.start.toString())?.toIso8601String() ??
            DateTime.now().toUtc().toIso8601String();
    final endIso = DateTime.tryParse(item.end.toString())?.toIso8601String();

    return {
      "id": item.reference.id,
      "title": item.title,
      "start": startIso,
      "end": endIso,
      "durationMin": item.durationMin,
      "locked": item.locked,
    };
  }).toList());
}
