import 'package:mason/mason.dart';

import '../utils/dependency_handler.dart';

/// Handles the `upgrade` command, which updates the CLI's Dart SDK constraint.
class UpgradeCommand {
  /// Executes the `upgrade` command.
  static Future<void> execute(Logger logger) async {
    await ensureCliDartVersionMatchesFlutter(logger);
  }
}
