import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_clean_cli/src/bundles/clean_feature_bundle.dart';
import 'package:flutter_clean_cli/src/bundles/project_setup_bundle.dart';
import 'package:flutter_clean_cli/src/utils/dependency_handler.dart';
import 'package:flutter_clean_cli/src/utils/generator_helper.dart';
import 'package:flutter_clean_cli/src/utils/project_validator.dart';
import 'package:mason/mason.dart';

/// Handles the `create` command, which generates a new Flutter project.
class CreateCommand {
  /// The argument parser for the `create` command.
  static final ArgParser parser = ArgParser()
    ..addFlag(
      'no-dep',
      help: 'Skips dependency installation.',
      defaultsTo: false,
    );

  /// Executes the `create` command.
  static Future<void> execute(ArgResults result, Logger logger) async {
    if (result.rest.isEmpty) {
      logger
        ..err('❌ Missing project name.')
        ..info('Usage: flutterclean create <project_name> [--no-dep]');
      exit(1);
    }

    if (ProjectValidator.ensureFlutterProject()) {
      final answer = logger.confirm(
        '⚠️ You are in a Flutter project. This may overwrite files. Continue?',
        defaultValue: false,
      );
      if (!answer) {
        logger.info('Aborted by user.');
        exit(0);
      }
    }

    final projectName = result.rest.first;
    final projectDir = Directory(projectName);

    if (projectDir.existsSync()) {
      final answer = logger.confirm(
        '⚠️ Directory "$projectName" already exists. Overwrite?',
        defaultValue: true,
      );
      if (!answer) {
        logger.info('Aborted by user.');
        exit(0);
      }
      logger.info('🗑️ Deleting existing directory...');
      projectDir.deleteSync(recursive: true);
    }

    final installDeps = !(result['no-dep'] as bool);
    await _runFlutterCreate(projectName, logger);

    if (installDeps) {
      await DependencyHandler.installDependencies(projectName, logger);
    }

    await _generateProjectStructure(projectDir, projectName, logger);
    await _generateUserFeature(projectDir, logger);

    logger.success('✅ Successfully created project: $projectName');
  }

  /// Runs `flutter create` to generate a new project.
  static Future<void> _runFlutterCreate(
    String projectName,
    Logger logger,
  ) async {
    final progress = logger.progress(
      'Running "flutter create $projectName"...',
    );
    final result = await Process.run('flutter', [
      'create',
      projectName,
    ], runInShell: true);
    if (result.exitCode != 0) {
      progress.fail('❌ Failed to create Flutter project.');
      logger.err(result.stderr);
      exit(1);
    }
    progress.complete('✅ Flutter project created.');
  }

  /// Generates the clean architecture structure using the project_setup brick.
  static Future<void> _generateProjectStructure(
    Directory projectDir,
    String projectName,
    Logger logger,
  ) async {
    final progress = logger.progress('Generating project structure...');
    final generator = await MasonGenerator.fromBundle(projectSetupBundle);
    final vars = <String, dynamic>{'project_name': projectName};
    final filesGenerated = await GeneratorHelper.generate(
      generator: generator,
      destination: projectDir,
      vars: vars,
      logger: logger,
    );
    progress.complete('✅ Project structure generated! ($filesGenerated files)');
  }

  /// Generates the `user` feature using the clean_feature brick.
  static Future<void> _generateUserFeature(
    Directory projectDir,
    Logger logger,
  ) async {
    final progress = logger.progress('Generating user feature...');
    final generator = await MasonGenerator.fromBundle(cleanFeatureBundle);
    final vars = <String, dynamic>{'name': 'user'};
    final filesGenerated = await GeneratorHelper.generate(
      generator: generator,
      destination: projectDir,
      vars: vars,
      logger: logger,
    );
    progress.complete('✅ User feature generated! ($filesGenerated files)');
  }
}
