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

Future<String> ensureActiveSession() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;
  if (uid == null) return '';

  const col = 'sessions';

  // Reuse existing active session — no event fired on reuse.
  final existing = await FirebaseFirestore.instance
      .collection(col)
      .where('userId', isEqualTo: uid)
      .where('status', isEqualTo: 'active')
      .limit(1)
      .get();
  if (existing.docs.isNotEmpty) return existing.docs.first.id;

  // Create new session.
  final ref = await FirebaseFirestore.instance.collection(col).add({
    'userId': uid,
    'startTime': FieldValue.serverTimestamp(),
    'endTime': null,
    'status': 'active',
    'context': 'focus',
    'createdAt': FieldValue.serverTimestamp(),
  });
  final newSessionId = ref.id;

  // Non-blocking session_started event — only for NEW sessions.
  FirebaseFirestore.instance.collection('events').add({
    'userId': uid,
    'sessionId': newSessionId,
    'type': 'session_started',
    'payload': {'sessionId': newSessionId},
    'source': 'system',
    'timestamp': FieldValue.serverTimestamp(),
  }).catchError((_) {});

  return newSessionId;
}
