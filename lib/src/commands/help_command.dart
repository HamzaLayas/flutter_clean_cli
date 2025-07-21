import 'package:mason/mason.dart';

/// Handles the `help` command, which displays usage information.
class HelpCommand {
  /// Executes the `help` command.
  static void execute(Logger logger) {
    logger.info('''
Flutter Blueprint CLI (flutter_blueprint_cli)

A modern CLI tool for generating Flutter projects with a clean architecture.

Usage:
  flutterclean <command> [arguments]

Commands:
  create <name>         Create a new Flutter project with a clean architecture.
    --no-dep            Skip dependency installation.

  add <name>            Add a new feature to the project.
    --model             Add only a model file.
    --data              Add data source and repository files.

  upgrade               Update the CLI to the latest version.
  help                  Show this help message.
''');
  }
}
