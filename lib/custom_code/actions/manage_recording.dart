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

import 'package:record/record.dart';
import 'dart:io';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

AudioRecorder? _rec;

const _kStorageBucket = 'recipesai-251c4.firebasestorage.app';

Future<String> manageRecording(bool isStarting) async {
  if (kIsWeb) return 'ERROR:web_not_supported';
  if (isStarting) {
    _rec ??= AudioRecorder();
    if (!await _rec!.hasPermission()) return 'NO_PERMISSION';
    final path =
        '${Directory.systemTemp.path}/vc_${DateTime.now().millisecondsSinceEpoch}.m4a';
    await _rec!.start(
      const RecordConfig(
          encoder: AudioEncoder.aacLc, bitRate: 128000, sampleRate: 44100),
      path: path,
    );
    return '';
  } else {
    if (_rec == null) return '';
    try {
      final localPath = await _rec!.stop();
      _rec = null;
      if (localPath == null || localPath.isEmpty) return 'ERROR:no_recording';

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return 'ERROR:not_authenticated';
      final token = await user.getIdToken();
      if (token == null) return 'ERROR:no_token';

      final file = File(localPath);
      final bytes = await file.readAsBytes();
      final fileName =
          'voice_captures/${DateTime.now().millisecondsSinceEpoch}.m4a';

      final client = HttpClient();
      final req = await client.postUrl(
        Uri.parse(
          'https://firebasestorage.googleapis.com/v0/b/$_kStorageBucket/o'
          '?uploadType=media&name=${Uri.encodeComponent(fileName)}',
        ),
      );
      req.headers.set('Authorization', 'Bearer $token');
      req.headers.set('Content-Type', 'audio/m4a');
      req.contentLength = bytes.length;
      req.add(bytes);
      final response = await req.close();
      final body = await response.transform(utf8.decoder).join();
      client.close();

      if (response.statusCode != 200) {
        return 'ERROR:upload_failed_${response.statusCode}:$body';
      }

      final json = jsonDecode(body) as Map<String, dynamic>;
      final downloadToken = json['downloadTokens'] as String?;
      if (downloadToken == null) return 'ERROR:no_download_token';

      final downloadUrl =
          'https://firebasestorage.googleapis.com/v0/b/$_kStorageBucket/o'
          '/${Uri.encodeComponent(fileName)}?alt=media&token=$downloadToken';

      try {
        file.deleteSync();
      } catch (_) {}
      return downloadUrl;
    } catch (e) {
      _rec = null;
      return 'ERROR:$e';
    }
  }
}
