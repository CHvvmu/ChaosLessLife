// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import '/flutter_flow/custom_functions.dart' as functions;

class ScheduleDragList extends StatefulWidget {
  const ScheduleDragList({
    Key? key,
    this.width,
    this.height,
    required this.itemsJson,
    required this.workStartIso,
    this.isLoading = false,
    required this.onReorder,
    this.onItemTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String itemsJson;
  final String workStartIso;
  final bool isLoading;
  final Future Function(String itemsJson) onReorder;
  final Future Function(String itemId)? onItemTap;

  @override
  State<ScheduleDragList> createState() => _ScheduleDragListState();
}

class _ScheduleDragListState extends State<ScheduleDragList> {
  List<_Item> items = [];
  bool hasParsedPayload = false;

  @override
  void initState() {
    super.initState();
    _parseItems();
  }

  @override
  void didUpdateWidget(covariant ScheduleDragList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.itemsJson != widget.itemsJson ||
        oldWidget.workStartIso != widget.workStartIso) {
      _parseItems();
    }
  }

  void _parseItems() {
    hasParsedPayload = true;
    try {
      if (widget.itemsJson.trim().isEmpty) {
        items = [];
        return;
      }

      final decoded = jsonDecode(widget.itemsJson);
      if (decoded is! List) {
        items = [];
        return;
      }

      items = decoded.map<_Item>((e) {
        final start =
            DateTime.tryParse((e['start'] ?? '').toString()) ?? DateTime.now();
        final end = DateTime.tryParse((e['end'] ?? '').toString());
        return _Item(
          id: (e['id'] ?? '').toString(),
          title: (e['title'] ?? '').toString(),
          start: start,
          end: end,
          duration: e['durationMin'] is int
              ? e['durationMin'] as int
              : int.tryParse('${e['durationMin']}') ?? 60,
          locked: e['locked'] == true,
        );
      }).toList();

      items.sort((a, b) => a.start.compareTo(b.start));

      // Р¤РёР»СЊС‚СЂСѓРµРј РїРѕ РІС‹Р±СЂР°РЅРЅРѕР№ РґР°С‚Рµ: workStartIso СЃРѕРґРµСЂР¶РёС‚ РЅР°С‡Р°Р»Рѕ СЂР°Р±РѕС‡РµРіРѕ РґРЅСЏ
      // РґР»СЏ selectedDate РІ UTC. РљРѕРЅРІРµСЂС‚РёСЂСѓРµРј РІ Р»РѕРєР°Р»СЊРЅРѕРµ РІСЂРµРјСЏ РґР»СЏ СЃСЂР°РІРЅРµРЅРёСЏ РґР°С‚.
      final workStart = DateTime.tryParse(widget.workStartIso)?.toLocal();
      if (workStart != null) {
        items = items.where((item) {
          final localStart =
              item.start.isUtc ? item.start.toLocal() : item.start;
          return localStart.year == workStart.year &&
              localStart.month == workStart.month &&
              localStart.day == workStart.day;
        }).toList();
      }
    } catch (_) {
      items = [];
    }
  }

  Future<void> _recalculateSchedule() async {
    final payload = items.map((e) {
      final endTime = e.end ?? e.start.add(Duration(minutes: e.duration));
      return {
        'id': e.id,
        'title': e.title,
        'start': e.start.toIso8601String(),
        'end': endTime.toIso8601String(),
        'durationMin': e.duration,
        'locked': e.locked,
      };
    }).toList();

    final recalculated = functions.recalculateScheduleJson(
      jsonEncode(payload),
      widget.workStartIso,
    );
    await widget.onReorder(recalculated);
  }

  Future<void> _onReorder(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) newIndex -= 1;
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    setState(() {});
    await _recalculateSchedule();
  }

  String _formatTime(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    if (widget.isLoading) {
      return Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: theme.primary,
          ),
        ),
      );
    }

    if (!hasParsedPayload) {
      return Center(
        child: SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            color: theme.primary,
          ),
        ),
      );
    }

    if (items.isEmpty) {
      return Center(
        child: Text(
          '\u041d\u0430 \u044d\u0442\u043e\u0442 \u0434\u0435\u043d\u044c \u0437\u0430\u0434\u0430\u0447 \u043d\u0435\u0442',
          style: TextStyle(color: theme.secondaryText),
        ),
      );
    }

    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: ReorderableListView.builder(
        buildDefaultDragHandles: false,
        itemCount: items.length,
        onReorder: _onReorder,
        itemBuilder: (context, index) {
          final item = items[index];
          final endTime =
              item.end ?? item.start.add(Duration(minutes: item.duration));
          final cardColor =
              item.locked ? theme.alternate : theme.secondaryBackground;

          return ReorderableDragStartListener(
            key: ValueKey(item.id),
            index: index,
            child: GestureDetector(
              onTap: () async {
                if (widget.onItemTap != null) {
                  await widget.onItemTap!(item.id);
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.drag_indicator, color: theme.secondaryText),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: theme.primaryText,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${_formatTime(item.start)} - ${_formatTime(endTime)}',
                            style: TextStyle(color: theme.primaryText),
                          ),
                          Text(
                            '\u0414\u043b\u0438\u0442\u0435\u043b\u044c\u043d\u043e\u0441\u0442\u044c: ${item.duration} \u043c\u0438\u043d',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (item.locked)
                      Icon(Icons.lock, size: 18, color: theme.secondaryText),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Item {
  _Item({
    required this.id,
    required this.title,
    required this.start,
    required this.duration,
    required this.locked,
    this.end,
  });

  String id;
  String title;
  DateTime start;
  DateTime? end;
  int duration;
  bool locked;
}
