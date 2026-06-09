import 'dart:io';

import 'package:test/test.dart';

/// TASK_ID: "FOURZHU-META-LAYER-BOUNDARY-TEST"
///
/// Scans lib/src for ui/logic/repository directories and enforces that
/// no layer directly imports another layer's models.
void main() {
  late List<File> uiFiles;
  late List<File> logicFiles;
  late List<File> repositoryFiles;

  setUpAll(() {
    final libSrc = Directory('lib/src');
    if (!libSrc.existsSync()) {
      fail('lib/src directory does not exist');
    }

    final allDartFiles = libSrc
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => f.path.endsWith('.dart'))
        .toList();

    uiFiles =
        allDartFiles.where((f) => f.path.contains('/ui/')).toList();
    logicFiles =
        allDartFiles.where((f) => f.path.contains('/logic/')).toList();
    repositoryFiles =
        allDartFiles.where((f) => f.path.contains('/repository/')).toList();
  });

  group('UI layer files', () {
    test('must not import /logic/ or /repository/ paths', () {
      for (final file in uiFiles) {
        final content = file.readAsStringSync();
        if (content.contains('/logic/')) {
          fail('${file.path} imports from /logic/');
        }
        if (content.contains('/repository/')) {
          fail('${file.path} imports from /repository/');
        }
      }
    });

    test('must not reference _logic_model.dart or _data_model.dart', () {
      for (final file in uiFiles) {
        final content = file.readAsStringSync();
        if (content.contains('_logic_model.dart')) {
          fail('${file.path} references _logic_model.dart');
        }
        if (content.contains('_data_model.dart')) {
          fail('${file.path} references _data_model.dart');
        }
      }
    });
  });

  group('Logic layer files', () {
    test('must not import /ui/ or /repository/ paths', () {
      for (final file in logicFiles) {
        final content = file.readAsStringSync();
        if (content.contains('/ui/')) {
          fail('${file.path} imports from /ui/');
        }
        if (content.contains('/repository/')) {
          fail('${file.path} imports from /repository/');
        }
      }
    });

    test('must not reference _ui_model.dart or _data_model.dart', () {
      for (final file in logicFiles) {
        final content = file.readAsStringSync();
        if (content.contains('_ui_model.dart')) {
          fail('${file.path} references _ui_model.dart');
        }
        if (content.contains('_data_model.dart')) {
          fail('${file.path} references _data_model.dart');
        }
      }
    });
  });

  group('Repository layer files', () {
    test('must not import /ui/ or /logic/ paths', () {
      for (final file in repositoryFiles) {
        final content = file.readAsStringSync();
        if (content.contains('/ui/')) {
          fail('${file.path} imports from /ui/');
        }
        if (content.contains('/logic/')) {
          fail('${file.path} imports from /logic/');
        }
      }
    });

    test('must not reference _ui_model.dart or _logic_model.dart', () {
      for (final file in repositoryFiles) {
        final content = file.readAsStringSync();
        if (content.contains('_ui_model.dart')) {
          fail('${file.path} references _ui_model.dart');
        }
        if (content.contains('_logic_model.dart')) {
          fail('${file.path} references _logic_model.dart');
        }
      }
    });
  });
}
