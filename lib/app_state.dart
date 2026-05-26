import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _TestDragDrop = prefs
              .getStringList('ff_TestDragDrop')
              ?.map((x) {
                try {
                  return TestStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _TestDragDrop;
    });
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  /// Текущая Аудио Запись
  String _recordedAudioFile = '';
  String get recordedAudioFile => _recordedAudioFile;
  set recordedAudioFile(String value) {
    _recordedAudioFile = value;
  }

  String _proposalId = '';
  String get proposalId => _proposalId;
  set proposalId(String value) {
    _proposalId = value;
  }

  String _scheduleId = '';
  String get scheduleId => _scheduleId;
  set scheduleId(String value) {
    _scheduleId = value;
  }

  List<TestStruct> _TestDragDrop = [
    TestStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"name\":\"Название 1\",\"photo\":\"https://picsum.photos/seed/912/600\"}')),
    TestStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"Название 2\",\"photo\":\"https://rickandmortyapi.com/api/character/avatar/46.jpeg\"}')),
    TestStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"name\":\"Название 3\",\"photo\":\"https://picsum.photos/seed/355/600\"}'))
  ];
  List<TestStruct> get TestDragDrop => _TestDragDrop;
  set TestDragDrop(List<TestStruct> value) {
    _TestDragDrop = value;
    prefs.setStringList(
        'ff_TestDragDrop', value.map((x) => x.serialize()).toList());
  }

  void addToTestDragDrop(TestStruct value) {
    TestDragDrop.add(value);
    prefs.setStringList(
        'ff_TestDragDrop', _TestDragDrop.map((x) => x.serialize()).toList());
  }

  void removeFromTestDragDrop(TestStruct value) {
    TestDragDrop.remove(value);
    prefs.setStringList(
        'ff_TestDragDrop', _TestDragDrop.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTestDragDrop(int index) {
    TestDragDrop.removeAt(index);
    prefs.setStringList(
        'ff_TestDragDrop', _TestDragDrop.map((x) => x.serialize()).toList());
  }

  void updateTestDragDropAtIndex(
    int index,
    TestStruct Function(TestStruct) updateFn,
  ) {
    TestDragDrop[index] = updateFn(_TestDragDrop[index]);
    prefs.setStringList(
        'ff_TestDragDrop', _TestDragDrop.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTestDragDrop(int index, TestStruct value) {
    TestDragDrop.insert(index, value);
    prefs.setStringList(
        'ff_TestDragDrop', _TestDragDrop.map((x) => x.serialize()).toList());
  }

  DocumentReference? _newTaskRef;
  DocumentReference? get newTaskRef => _newTaskRef;
  set newTaskRef(DocumentReference? value) {
    _newTaskRef = value;
  }

  /// Текущая стадия обработки голосовой записи
  /// (uploading/transcribing/analysis/ready/error)
  String _activeCaptureStage = '';
  String get activeCaptureStage => _activeCaptureStage;
  set activeCaptureStage(String value) {
    _activeCaptureStage = value;
  }

  /// True when dark mode is active; persisted across sessions.
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  /// DSL app state activeSessionId
  String _activeSessionId = '';
  String get activeSessionId => _activeSessionId;
  set activeSessionId(String value) {
    _activeSessionId = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
