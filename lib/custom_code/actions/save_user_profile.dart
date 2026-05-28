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

Future<void> saveUserProfile(String? displayName, String? phoneNumber) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;
  if (displayName != null && displayName.isNotEmpty) {
    await user.updateDisplayName(displayName);
  }
  final fields = <String, dynamic>{};
  if (displayName != null) fields['display_name'] = displayName;
  if (phoneNumber != null) fields['phone_number'] = phoneNumber;
  if (fields.isNotEmpty) {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .update(fields);
  }
}
