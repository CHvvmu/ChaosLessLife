import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/firebase_auth/auth_util.dart';

import '../flutter_flow/flutter_flow_util.dart';
import 'schema/util/firestore_util.dart';

import 'schema/users_record.dart';
import 'schema/tasks_record.dart';
import 'schema/a_i_sessions_record.dart';
import 'schema/messages_record.dart';
import 'schema/calls_record.dart';
import 'schema/analytics_daily_record.dart';
import 'schema/a_i_memory_short_record.dart';
import 'schema/a_i_memory_long_record.dart';
import 'schema/life_events_record.dart';
import 'schema/integrations_record.dart';
import 'schema/call_raw_transcripts_record.dart';
import 'schema/tasks_sub_record.dart';
import 'schema/schedule_proposals_record.dart';
import 'schema/history_schedules_record.dart';
import 'schema/schedules_record.dart';
import 'schema/items_record.dart';
import 'schema/capture_sessions_record.dart';
import 'schema/inbox_items_record.dart';
import 'schema/ai_recommendations_record.dart';
import 'schema/events_record.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart' hide Order;
export 'package:firebase_core/firebase_core.dart';
export 'schema/index.dart';
export 'schema/util/firestore_util.dart';
export 'schema/util/schema_util.dart';

export 'schema/users_record.dart';
export 'schema/tasks_record.dart';
export 'schema/a_i_sessions_record.dart';
export 'schema/messages_record.dart';
export 'schema/calls_record.dart';
export 'schema/analytics_daily_record.dart';
export 'schema/a_i_memory_short_record.dart';
export 'schema/a_i_memory_long_record.dart';
export 'schema/life_events_record.dart';
export 'schema/integrations_record.dart';
export 'schema/call_raw_transcripts_record.dart';
export 'schema/tasks_sub_record.dart';
export 'schema/schedule_proposals_record.dart';
export 'schema/history_schedules_record.dart';
export 'schema/schedules_record.dart';
export 'schema/items_record.dart';
export 'schema/capture_sessions_record.dart';
export 'schema/inbox_items_record.dart';
export 'schema/ai_recommendations_record.dart';
export 'schema/events_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Future<int> queryUsersRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      UsersRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TasksRecords (as a Stream and as a Future).
Future<int> queryTasksRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TasksRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TasksRecord>> queryTasksRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TasksRecord.collection,
      TasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TasksRecord>> queryTasksRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TasksRecord.collection,
      TasksRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AISessionsRecords (as a Stream and as a Future).
Future<int> queryAISessionsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AISessionsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AISessionsRecord>> queryAISessionsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AISessionsRecord.collection,
      AISessionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AISessionsRecord>> queryAISessionsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AISessionsRecord.collection,
      AISessionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query MessagesRecords (as a Stream and as a Future).
Future<int> queryMessagesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      MessagesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<MessagesRecord>> queryMessagesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      MessagesRecord.collection,
      MessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<MessagesRecord>> queryMessagesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      MessagesRecord.collection,
      MessagesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CallsRecords (as a Stream and as a Future).
Future<int> queryCallsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CallsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CallsRecord>> queryCallsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CallsRecord.collection,
      CallsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CallsRecord>> queryCallsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CallsRecord.collection,
      CallsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AnalyticsDailyRecords (as a Stream and as a Future).
Future<int> queryAnalyticsDailyRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AnalyticsDailyRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AnalyticsDailyRecord>> queryAnalyticsDailyRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AnalyticsDailyRecord.collection,
      AnalyticsDailyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AnalyticsDailyRecord>> queryAnalyticsDailyRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AnalyticsDailyRecord.collection,
      AnalyticsDailyRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AIMemoryShortRecords (as a Stream and as a Future).
Future<int> queryAIMemoryShortRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AIMemoryShortRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AIMemoryShortRecord>> queryAIMemoryShortRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AIMemoryShortRecord.collection,
      AIMemoryShortRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AIMemoryShortRecord>> queryAIMemoryShortRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AIMemoryShortRecord.collection,
      AIMemoryShortRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AIMemoryLongRecords (as a Stream and as a Future).
Future<int> queryAIMemoryLongRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AIMemoryLongRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AIMemoryLongRecord>> queryAIMemoryLongRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AIMemoryLongRecord.collection,
      AIMemoryLongRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AIMemoryLongRecord>> queryAIMemoryLongRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AIMemoryLongRecord.collection,
      AIMemoryLongRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query LifeEventsRecords (as a Stream and as a Future).
Future<int> queryLifeEventsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      LifeEventsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<LifeEventsRecord>> queryLifeEventsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      LifeEventsRecord.collection,
      LifeEventsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<LifeEventsRecord>> queryLifeEventsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      LifeEventsRecord.collection,
      LifeEventsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query IntegrationsRecords (as a Stream and as a Future).
Future<int> queryIntegrationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      IntegrationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<IntegrationsRecord>> queryIntegrationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      IntegrationsRecord.collection,
      IntegrationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<IntegrationsRecord>> queryIntegrationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      IntegrationsRecord.collection,
      IntegrationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CallRawTranscriptsRecords (as a Stream and as a Future).
Future<int> queryCallRawTranscriptsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CallRawTranscriptsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CallRawTranscriptsRecord>> queryCallRawTranscriptsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CallRawTranscriptsRecord.collection,
      CallRawTranscriptsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CallRawTranscriptsRecord>> queryCallRawTranscriptsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CallRawTranscriptsRecord.collection,
      CallRawTranscriptsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query TasksSubRecords (as a Stream and as a Future).
Future<int> queryTasksSubRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      TasksSubRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<TasksSubRecord>> queryTasksSubRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      TasksSubRecord.collection(parent),
      TasksSubRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<TasksSubRecord>> queryTasksSubRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      TasksSubRecord.collection(parent),
      TasksSubRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ScheduleProposalsRecords (as a Stream and as a Future).
Future<int> queryScheduleProposalsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ScheduleProposalsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ScheduleProposalsRecord>> queryScheduleProposalsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ScheduleProposalsRecord.collection,
      ScheduleProposalsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ScheduleProposalsRecord>> queryScheduleProposalsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ScheduleProposalsRecord.collection,
      ScheduleProposalsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query HistorySchedulesRecords (as a Stream and as a Future).
Future<int> queryHistorySchedulesRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      HistorySchedulesRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<HistorySchedulesRecord>> queryHistorySchedulesRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      HistorySchedulesRecord.collection(parent),
      HistorySchedulesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<HistorySchedulesRecord>> queryHistorySchedulesRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      HistorySchedulesRecord.collection(parent),
      HistorySchedulesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query SchedulesRecords (as a Stream and as a Future).
Future<int> querySchedulesRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      SchedulesRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<SchedulesRecord>> querySchedulesRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      SchedulesRecord.collection,
      SchedulesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<SchedulesRecord>> querySchedulesRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      SchedulesRecord.collection,
      SchedulesRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query ItemsRecords (as a Stream and as a Future).
Future<int> queryItemsRecordCount({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      ItemsRecord.collection(parent),
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<ItemsRecord>> queryItemsRecord({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      ItemsRecord.collection(parent),
      ItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<ItemsRecord>> queryItemsRecordOnce({
  DocumentReference? parent,
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      ItemsRecord.collection(parent),
      ItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query CaptureSessionsRecords (as a Stream and as a Future).
Future<int> queryCaptureSessionsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      CaptureSessionsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<CaptureSessionsRecord>> queryCaptureSessionsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CaptureSessionsRecord.collection,
      CaptureSessionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CaptureSessionsRecord>> queryCaptureSessionsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CaptureSessionsRecord.collection,
      CaptureSessionsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query InboxItemsRecords (as a Stream and as a Future).
Future<int> queryInboxItemsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      InboxItemsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<InboxItemsRecord>> queryInboxItemsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      InboxItemsRecord.collection,
      InboxItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<InboxItemsRecord>> queryInboxItemsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      InboxItemsRecord.collection,
      InboxItemsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query AiRecommendationsRecords (as a Stream and as a Future).
Future<int> queryAiRecommendationsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      AiRecommendationsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<AiRecommendationsRecord>> queryAiRecommendationsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AiRecommendationsRecord.collection,
      AiRecommendationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AiRecommendationsRecord>> queryAiRecommendationsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AiRecommendationsRecord.collection,
      AiRecommendationsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

/// Functions to query EventsRecords (as a Stream and as a Future).
Future<int> queryEventsRecordCount({
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) =>
    queryCollectionCount(
      EventsRecord.collection,
      queryBuilder: queryBuilder,
      limit: limit,
    );

Stream<List<EventsRecord>> queryEventsRecord({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      EventsRecord.collection,
      EventsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<EventsRecord>> queryEventsRecordOnce({
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      EventsRecord.collection,
      EventsRecord.fromSnapshot,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<int> queryCollectionCount(
  Query collection, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0) {
    query = query.limit(limit);
  }

  return query.count().get().catchError((err) {
    print('Error querying $collection: $err');
  }).then((value) => value.count!);
}

Stream<List<T>> queryCollection<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList());
}

Filter filterIn(String field, List? list) => (list?.isEmpty ?? true)
    ? Filter(field, whereIn: null)
    : Filter(field, whereIn: list);

Filter filterArrayContainsAny(String field, List? list) =>
    (list?.isEmpty ?? true)
        ? Filter(field, arrayContainsAny: null)
        : Filter(field, arrayContainsAny: list);

extension QueryExtension on Query {
  Query whereIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereIn: null)
      : where(field, whereIn: list);

  Query whereNotIn(String field, List? list) => (list?.isEmpty ?? true)
      ? where(field, whereNotIn: null)
      : where(field, whereNotIn: list);

  Query whereArrayContainsAny(String field, List? list) =>
      (list?.isEmpty ?? true)
          ? where(field, arrayContainsAny: null)
          : where(field, arrayContainsAny: list);
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>>? dataStream;
  final QueryDocumentSnapshot? nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  RecordBuilder<T> recordBuilder, {
  Query Function(Query)? queryBuilder,
  DocumentSnapshot? nextPageMarker,
  required int pageSize,
  required bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot>? docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => recordBuilder(d),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .map((d) => d!)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    currentUserDocument = await UsersRecord.getDocumentOnce(userRecord);
    return;
  }

  final userData = createUsersRecordData(
    email: user.email ??
        FirebaseAuth.instance.currentUser?.email ??
        user.providerData.firstOrNull?.email,
    displayName:
        user.displayName ?? FirebaseAuth.instance.currentUser?.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
  currentUserDocument = UsersRecord.getDocumentFromData(userData, userRecord);
}

Future updateUserDocument({String? email}) async {
  await currentUserDocument?.reference
      .update(createUsersRecordData(email: email));
}
