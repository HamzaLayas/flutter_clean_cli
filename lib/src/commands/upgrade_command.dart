import 'package:args/args.dart';
import 'package:mason/mason.dart';
import 'package:flutter_blueprint_cli/flutter_blueprint_cli.dart';

/// Handles the `upgrade` command, which updates the CLI tool.
class UpgradeCommand {
  /// The argument parser for the `upgrade` command.
  static final ArgParser parser = ArgParser();

  /// Executes the `upgrade` command.
  static Future<void> execute(Logger logger) async {
    await ensureCliDartVersionMatchesFlutter(logger);
  }
}
