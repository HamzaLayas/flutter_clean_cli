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
    // Regular packages (no special flags)
    final regularPackages = [
      'flutter_bloc',
      'hydrated_bloc',
      'path_provider',
      'permission_handler',
      'equatable',
      'get_it',
      'cached_network_image',
      'flutter_svg',
      'flutter_screenutil',
      'dio',
      'pretty_dio_logger',
      'flutter_dotenv',
      'intl',
      'flutter_offline',
      'flutter_local_notifications',
      'firebase_messaging',
      'firebase_core',
      'shared_preferences',
      'go_router',
      'url_launcher',
      'fpdart',
      'skeletonizer',
    ];

    // Packages that require --sdk=flutter flag
    final sdkPackages = [
      'flutter_web_plugins',
      'flutter_localizations',
    ];

    logger.info('📦 Installing dependencies...');

    // Install SDK packages with special flag
    for (final package in sdkPackages) {
      final progress = logger.progress('📦 Installing $package with SDK flag');
      final result = await Process.run(
        'flutter',
        ['pub', 'add', package, '--sdk=flutter'],
        workingDirectory: projectName,
        runInShell: true,
      );
      if (result.exitCode != 0) {
        progress.fail('🚫 Failed to install $package with SDK flag');
        logger.err(result.stderr);
        exit(1);
      }

      progress.complete('📦 $package installed successfully');
    }

    // Install regular packages
    for (final package in regularPackages) {
      final progress = logger.progress('📦 Installing $package');
      final result = await Process.run(
        'flutter',
        ['pub', 'add', package],
        workingDirectory: projectName,
        runInShell: true,
      );
      if (result.exitCode != 0) {
        progress.fail('🚫 Failed to install $package');
        logger.err(result.stderr);
        exit(1);
      }
      progress.complete('📦 $package installed successfully');
    }
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
  if (dartVersion == null) {
    logger.warn('⚠️ Could not parse Dart SDK version.');
    return;
  }

  final dartMajor = int.parse(dartVersion.split('.').first);
  final newConstraint = "'>=$dartMajor.0.0 <${dartMajor + 1}.0.0'";

  final pubspecFile = File(p.join(Directory.current.path, 'pubspec.yaml'));
  if (!pubspecFile.existsSync()) {
    logger.err('🚫 pubspec.yaml not found.');
    return;
  }

  final lines = pubspecFile.readAsLinesSync();
  bool updated = false;
  final newLines = <String>[];
  bool envFound = false, sdkFound = false;

  for (final line in lines) {
    if (line.trim().startsWith('environment:')) envFound = true;
    if (line.trim().startsWith('sdk:')) {
      sdkFound = true;
      final current = line.split(':').last.trim();
      if (current != newConstraint) {
        newLines.add("  sdk: $newConstraint");
        updated = true;
        continue;
      }
    }
    newLines.add(line);
  }

  // If sdk: was not found, add it (and environment: if needed) at the end
  if (!sdkFound) {
    if (!envFound) newLines.add('environment:');
    newLines.add("  sdk: $newConstraint");
    updated = true;
  }

  if (updated) {
    pubspecFile.writeAsStringSync(newLines.join('\n'));
    logger.info(
        '✏️ Updated CLI Dart SDK version in pubspec.yaml to $newConstraint');
    final pubGet = await Process.run('dart', ['pub', 'get'], runInShell: true);
    if (pubGet.exitCode == 0) {
      logger.info('✅ CLI dependencies updated.');
    } else {
      logger.err(
          '🚫 Failed to update CLI dependencies. Please run "dart pub get" manually.');
    }
  } else {
    logger.info('✅ Dart SDK constraint already up to date.');
  }
}
