import 'dart:io';

import 'package:args/args.dart';
import 'package:mason/mason.dart';
import 'package:flutterclean/src/bundles/clean_feature_bundle.dart';
import 'package:flutterclean/src/utils/generator_helper.dart';
import 'package:flutterclean/src/utils/project_validator.dart';

/// Handles the `add` command, which adds a new feature to the project.
class AddCommand {
  /// The argument parser for the `add` command.
  static final ArgParser parser = ArgParser()
    ..addFlag(
      'model',
      abbr: 'm',
      help: 'Add only a model file',
      negatable: false,
    )
    ..addFlag(
      'data',
      abbr: 'd',
      help: 'Add data source and repository',
      negatable: false,
    );

  /// Executes the `add` command.
  static Future<void> execute(ArgResults result, Logger logger) async {
    if (!ProjectValidator.ensureFlutterProject()) {
      logger
        ..err('❌ Error: This is not a Flutter project directory.')
        ..info('Please run this command from the root of a Flutter project.');
      exit(1);
    }

    if (result.rest.isEmpty) {
      logger
        ..err('❌ Please specify a name for the feature.')
        ..info('\nUsage: flutterclean add <name> [--model] [--data]');
      exit(1);
    }

    final name = result.rest.first;
    // Always use the project root (where pubspec.yaml is) as destination.
    final projectRoot = Directory(Directory.current.path);
    final generator = await MasonGenerator.fromBundle(cleanFeatureBundle);
    final vars = <String, dynamic>{'name': name};

    final onlyModel = result['model'] as bool;
    final onlyData = result['data'] as bool;

    if (onlyModel) {
      final progress = logger.progress('Generating model for "$name"...');
      final filesGenerated = await GeneratorHelper.generate(
        generator: generator,
        destination: projectRoot,
        vars: vars,
        logger: logger,
      );
      progress.complete(
        '✅ Successfully added model for "$name" ($filesGenerated files)',
      );
    } else if (onlyData) {
      final progress = logger
          .progress('Generating data source and repository for "$name"...');
      final filesGenerated = await GeneratorHelper.generate(
        generator: generator,
        destination: projectRoot,
        vars: vars,
        logger: logger,
      );
      progress.complete(
        '✅ Successfully added data source and repository for "$name" ($filesGenerated files)',
      );
    } else {
      final progress =
          logger.progress('Generating feature "$name" in all layers...');
      final filesGenerated = await GeneratorHelper.generate(
        generator: generator,
        destination: projectRoot,
        vars: vars,
        logger: logger,
      );
      progress.complete(
        '✅ Successfully added "$name" to all layers ($filesGenerated files)',
      );
    }
  }
}
