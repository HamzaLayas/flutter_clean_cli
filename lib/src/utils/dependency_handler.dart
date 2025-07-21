import 'dart:convert';
import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

/// A utility class for handling project dependencies.
class DependencyHandler {
  /// Installs the project dependencies.
  static Future<void> installDependencies(
    String projectName,
    Logger logger,
  ) async {
    const packages = [
      'flutter_bloc',
      'hydrated_bloc',
      'path_provider',
      'equatable',
      'get_it',
      'cached_network_image',
      'flutter_svg',
      'flutter_screenutil',
      'dio',
      'pretty_dio_logger',
      'flutter_dotenv',
      'intl',
    ];

    final progress = logger.progress('📦 Installing dependencies...');
    for (final package in packages) {
      final result = await Process.run(
        'flutter',
        ['pub', 'add', package],
        workingDirectory: projectName,
        runInShell: true,
      );
      if (result.exitCode != 0) {
        progress.fail('❌ Failed to install dependencies.');
        logger.err(result.stderr);
        exit(1);
      }
    }
    progress.complete('✅ Dependencies installed.');
  }
}

/// Ensures the CLI's Dart version matches the user's Flutter Dart version.
Future<void> ensureCliDartVersionMatchesFlutter(Logger logger) async {
  final flutterVersionResult = await Process.run(
    'flutter',
    ['--version', '--machine'],
    runInShell: true,
  );

  if (flutterVersionResult.exitCode != 0) {
    logger.warn('⚠️ Could not detect Dart version from Flutter.');
    return;
  }

  final versionJson = json.decode(flutterVersionResult.stdout as String);
  final dartVersion = versionJson['dartSdkVersion'] as String?;
  if (dartVersion == null) return;

  final dartMajor = int.parse(dartVersion.split('.').first);
  final newConstraint = "'>=$dartMajor.0.0 <${dartMajor + 1}.0.0'";

  final pubspecFile = File(p.join(Directory.current.path, 'pubspec.yaml'));
  if (!pubspecFile.existsSync()) return;

  final lines = pubspecFile.readAsLinesSync();
  final newLines = <String>[];
  var inEnv = false;
  var updated = false;

  for (final line in lines) {
    if (line.trim().startsWith('environment:')) {
      inEnv = true;
      newLines.add(line);
      continue;
    }
    if (inEnv && line.trim().startsWith('sdk:')) {
      final currentConstraint = line.split(':').last.trim();
      if (currentConstraint != newConstraint) {
        newLines.add("  sdk: $newConstraint");
        updated = true;
      } else {
        newLines.add(line);
      }
      inEnv = false;
      continue;
    }
    newLines.add(line);
  }

  if (updated) {
    try {
      pubspecFile.writeAsStringSync(newLines.join('\n'));
      logger.info(
        '✏️ Updated CLI Dart SDK version in pubspec.yaml to $newConstraint',
      );
      final pubGet =
          await Process.run('dart', ['pub', 'get'], runInShell: true);
      if (pubGet.exitCode == 0) {
        logger.info('✅ CLI dependencies updated.');
      } else {
        logger.err(
          '❌ Failed to update CLI dependencies. Please run "dart pub get" manually.',
        );
      }
    } catch (e) {
      logger.err('❌ Failed to update CLI Dart SDK constraint: $e');
    }
  }
}
