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

Future<void> clearStaleScheduledTasksForDate() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) return;

  final now = DateTime.now();
  final planDate =
      '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

  final db = FirebaseFirestore.instance;

  final schedulesSnap = await db
      .collection('Schedules')
      .where('userId', isEqualTo: uid)
      .where('planDate', isEqualTo: planDate)
      .orderBy('createdAt', descending: true)
      .get();

  if (schedulesSnap.docs.length <= 1) return;

  // First (latest) document = the newly applied schedule.
  final currentId = schedulesSnap.docs.first.id;
  final currentItemsSnap =
      await db.collection('Schedules').doc(currentId).collection('items').get();
  final currentTaskIds = currentItemsSnap.docs
      .map((d) => d.data()['taskId'] as String?)
      .whereType<String>()
      .toSet();

  final batch = db.batch();
  for (int i = 1; i < schedulesSnap.docs.length; i++) {
    final oldSched = schedulesSnap.docs[i];
    final oldItemsSnap = await oldSched.reference.collection('items').get();
    for (final item in oldItemsSnap.docs) {
      final tid = item.data()['taskId'] as String?;
      if (tid != null && !currentTaskIds.contains(tid)) {
        batch.update(db.collection('Tasks').doc(tid), {
          'scheduledStart': FieldValue.delete(),
          'scheduledEnd': FieldValue.delete(),
        });
      }
    }
  }
  await batch.commit();
}
