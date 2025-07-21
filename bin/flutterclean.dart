#!/usr/bin/env dart

import 'dart:io';

import 'package:args/args.dart';
import 'package:flutterclean/src/commands/add_command.dart';
import 'package:flutterclean/src/commands/create_command.dart';
import 'package:flutterclean/src/commands/help_command.dart';
import 'package:flutterclean/src/commands/upgrade_command.dart';
import 'package:flutterclean/src/utils/dependency_handler.dart';
import 'package:mason/mason.dart';

Future<void> main(List<String> args) async {
  final logger = Logger();

  if (args.isEmpty ||
      args.first == 'help' ||
      args.first == '--help' ||
      args.first == '-h') {
    HelpCommand.execute(logger);
    exit(0);
  } else if (args.first == 'upgrade') {
    await UpgradeCommand.execute(logger);
    exit(0);
  }

  await ensureCliDartVersionMatchesFlutter(logger);

  final parser = ArgParser()
    ..addCommand('create', CreateCommand.parser)
    ..addCommand('add', AddCommand.parser);

  try {
    final result = parser.parse(args);
    final command = result.command;

    if (command == null || command.name!.isEmpty) {
      logger
        ..info('Usage: flutterclean <command> [options]')
        ..info(parser.usage);
      exit(1);
    }

    switch (command.name) {
      case 'create':
        if (command.rest.isEmpty) {
          logger.err('Usage: flutterclean create <name> [--no-dep]');
          exit(1);
        }
        await CreateCommand.execute(command, logger);
        break;
      case 'add':
        final isModel = command['model'] as bool;
        final isData = command['data'] as bool;
        if ((!isModel && !isData) ||
            (isModel && isData) ||
            command.rest.isEmpty) {
          logger.err('Usage: flutterclean add --model <name> | --data <name>');
          exit(1);
        }
        await AddCommand.execute(command, logger);
        break;
      default:
        logger.err('Invalid command: ${command.name}');
        exit(1);
    }
  } catch (e, st) {
    logger
      ..err('Error: $e\n$st')
      ..err('\n${parser.usage}');
    exit(1);
  }
}
