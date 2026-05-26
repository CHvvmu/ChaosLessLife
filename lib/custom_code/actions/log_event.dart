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

Future<void> logEvent(
  String type,
  String? sessionId,
  String? taskId,
  String? title,
  String? status,
  String source,
) async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null || uid.isEmpty) return;

  final payload = <String, dynamic>{};
  if (taskId != null && taskId.isNotEmpty) payload['taskId'] = taskId;
  if (title != null && title.isNotEmpty) payload['title'] = title;
  if (status != null && status.isNotEmpty) payload['status'] = status;

  // Fire-and-forget: do NOT await. Swallow all errors silently.
  FirebaseFirestore.instance.collection('events').add({
    'userId': uid,
    'sessionId': (sessionId != null && sessionId.isNotEmpty) ? sessionId : null,
    'type': type,
    'payload': payload,
    'source': source.isEmpty ? 'ui' : source,
    'timestamp': FieldValue.serverTimestamp(),
  }).catchError((_) {});
}
