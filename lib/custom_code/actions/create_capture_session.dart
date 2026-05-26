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

Future<String> createCaptureSession(String? audioUrl) async {
  if (audioUrl == null || audioUrl.isEmpty || audioUrl.startsWith('ERROR:')) {
    return 'ERROR:no_url';
  }
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return 'ERROR:not_authenticated';
  final ref = FirebaseFirestore.instance.collection('capture_sessions').doc();
  await ref.set({
    'userId': user.uid,
    'audioUrl': audioUrl,
    'sourceType': 'voice',
    'status': 'pending',
    'createdAt': FieldValue.serverTimestamp(),
  });
  return ref.id;
}
