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
import 'dart:async';

Future<String> watchCaptureSession(String? sessionId) async {
  if (sessionId == null || sessionId.isEmpty || sessionId.startsWith('ERROR:'))
    return 'error';

  final completer = Completer<String>();

  final sub = FirebaseFirestore.instance
      .collection('capture_sessions')
      .doc(sessionId)
      .snapshots()
      .listen((snap) {
    if (!snap.exists || completer.isCompleted) return;
    final status = snap.data()?['status'] as String? ?? '';
    if (status == 'processed') completer.complete('ready');
    if (status == 'error') completer.complete('error');
  });

  // Р—Р°С‰РёС‚Р°: Р·Р°РІРµСЂС€РёС‚СЊ С‡РµСЂРµР· 3 РјРёРЅСѓС‚С‹ РµСЃР»Рё Cloud Functions РЅРµ РѕС‚РІРµС‚РёР»Рё
  Future.delayed(const Duration(minutes: 3), () {
    if (!completer.isCompleted) completer.complete('timeout');
  });

  final result = await completer.future;
  await sub.cancel();
  return result;
}
