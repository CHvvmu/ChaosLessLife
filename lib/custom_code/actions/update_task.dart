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

Future<void> updateTask(
  String? taskId,
  String? title,
  String? description,
  String? priority,
  DateTime? dueDate,
  DateTime? scheduledStart,
  String? sessionId,
) async {
  if (taskId == null || taskId.isEmpty) return;

  final updates = <String, dynamic>{};
  if (title != null) updates['title'] = title;
  if (description != null) updates['description'] = description;
  if (priority != null) updates['priority'] = priority;
  if (dueDate != null) updates['dueDate'] = Timestamp.fromDate(dueDate);
  if (scheduledStart != null) {
    updates['scheduledStart'] = Timestamp.fromDate(scheduledStart);
  }
  if (updates.isEmpty) return;

  final db = FirebaseFirestore.instance;
  const denormFields = ['title', 'description', 'status'];
  final denormUpdate = Map<String, dynamic>.fromEntries(
    denormFields
        .where((f) => updates.containsKey(f))
        .map((f) => MapEntry(f, updates[f])),
  );

  List<QueryDocumentSnapshot<Map<String, dynamic>>> itemDocs = [];
  if (denormUpdate.isNotEmpty) {
    try {
      final snap = await db
          .collectionGroup('items')
          .where('taskId', isEqualTo: taskId)
          .get();
      itemDocs = snap.docs;
    } catch (_) {}
  }

  final batch = db.batch();
  batch.update(db.collection('Tasks').doc(taskId), {
    ...updates,
    'updatedAt': FieldValue.serverTimestamp(),
  });
  for (final doc in itemDocs) {
    batch.update(doc.reference, denormUpdate);
  }
  await batch.commit();

  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid != null) {
    db.collection('events').add({
      'userId': uid,
      'sessionId': sessionId,
      'type': 'task_updated',
      'payload': {
        'taskId': taskId,
        if (updates['title'] is String) 'title': updates['title'] as String,
        if (updates['status'] is String) 'status': updates['status'] as String,
      },
      'source': 'ui',
      'timestamp': FieldValue.serverTimestamp(),
    }).catchError((_) {});
  }
}
