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

Future<void> completeTodayItem(String? itemPath) async {
  if (itemPath == null || itemPath.isEmpty) return;
  final db = FirebaseFirestore.instance;
  final itemDoc = await db.doc(itemPath).get();
  if (!itemDoc.exists) return;
  final data = itemDoc.data()!;
  final taskId = data['taskId'] as String?;
  final title = data['title'] as String?;

  final batch = db.batch();
  batch.update(db.doc(itemPath), {'status': 'completed'});
  if (taskId != null && taskId.isNotEmpty) {
    batch.update(db.collection('Tasks').doc(taskId), {
      'status': 'completed',
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
  await batch.commit();

  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid != null) {
    db.collection('events').add({
      'userId': uid,
      'sessionId': null,
      'type': 'task_completed',
      'payload': {
        if (taskId != null && taskId.isNotEmpty) 'taskId': taskId,
        if (title != null && title.isNotEmpty) 'title': title,
        'status': 'completed',
      },
      'source': 'ui',
      'timestamp': FieldValue.serverTimestamp(),
    }).catchError((_) {});
  }
}
