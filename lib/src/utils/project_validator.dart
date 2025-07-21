import 'dart:io';

import 'package:path/path.dart' as p;

/// A utility class for validating the project structure.
class ProjectValidator {
  /// Ensures the current directory is a Flutter project.
  ///
  /// A directory is considered a Flutter project if it contains:
  /// - `pubspec.yaml`
  /// - `lib/main.dart`
  /// - a `flutter:` section in `pubspec.yaml`
  static bool ensureFlutterProject() {
    final currentDir = Directory.current;
    final pubspec = File(p.join(currentDir.path, 'pubspec.yaml'));
    final mainDart = File(p.join(currentDir.path, 'lib', 'main.dart'));

    if (!pubspec.existsSync() || !mainDart.existsSync()) {
      return false;
    }

    final content = pubspec.readAsStringSync();
    return RegExp(r'^flutter:', multiLine: true).hasMatch(content);
  }
}
