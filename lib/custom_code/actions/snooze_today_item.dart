// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> snoozeTodayItem(String? itemPath) async {
  if (itemPath == null || itemPath.isEmpty) return;
  final db = FirebaseFirestore.instance;
  final itemDoc = await db.doc(itemPath).get();
  if (!itemDoc.exists) return;
  final data = itemDoc.data()!;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) return;

  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final tomorrowTs = Timestamp.fromDate(tomorrow.toUtc());

  final schedSnap = await db
      .collection('Schedules')
      .where('userId', isEqualTo: userId)
      .where('date', isEqualTo: tomorrowTs)
      .limit(1)
      .get();

  final isNewSchedule = schedSnap.docs.isEmpty;
  final scheduleRef = isNewSchedule
      ? db.collection('Schedules').doc()
      : schedSnap.docs.first.reference;

  final existingCount =
      (await scheduleRef.collection('items').get()).docs.length;

  Timestamp? shift(Timestamp? orig) {
    if (orig == null) return null;
    final local = orig.toDate().toLocal();
    return Timestamp.fromDate(
      DateTime(tomorrow.year, tomorrow.month, tomorrow.day, local.hour,
              local.minute)
          .toUtc(),
    );
  }

  final batch = db.batch();
  batch.update(db.doc(itemPath), {'status': 'snoozed'});
  if (isNewSchedule) {
    batch.set(scheduleRef, {
      'userId': userId,
      'date': tomorrowTs,
      'status': 'active',
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  } else {
    batch.update(scheduleRef, {'updatedAt': FieldValue.serverTimestamp()});
  }
  batch.set(scheduleRef.collection('items').doc(), {
    'taskId': data['taskId'],
    'title': data['title'],
    'description': data['description'],
    'start': shift(data['start'] as Timestamp?),
    'end': shift(data['end'] as Timestamp?),
    'durationMin': data['durationMin'],
    'order': existingCount,
    'status': 'active',
    'locked': false,
    'source': 'snoozed',
    'createdAt': FieldValue.serverTimestamp(),
  });
  await batch.commit();

  db.collection('events').add({
    'userId': userId,
    'sessionId': null,
    'type': 'task_snoozed',
    'payload': {
      if (data['taskId'] is String) 'taskId': data['taskId'] as String,
      if (data['title'] is String) 'title': data['title'] as String,
      'status': 'snoozed',
    },
    'source': 'ui',
    'timestamp': FieldValue.serverTimestamp(),
  }).catchError((_) {});
}
