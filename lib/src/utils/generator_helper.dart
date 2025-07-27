import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;

/// A helper class to run a Mason generator and provide detailed logging.
class GeneratorHelper {
  /// Runs the generator and logs created files and directories.
  static Future<void> generate({
    required MasonGenerator generator,
    required Directory destination,
    required Map<String, dynamic> vars,
    required Logger logger,
  }) async {
    final target = DirectoryGeneratorTarget(
      destination,
    );
    final generatedFiles = await generator.generate(
      target,
      vars: vars,
      logger: logger,
      fileConflictResolution: FileConflictResolution.overwrite,
    );

    final createdDirs = <String>{};
    final createdFiles = <String>[];

    for (final file in generatedFiles) {
      final fileSystemPath = file.path.replaceAll('/', p.separator);
      final relPath = p.relative(fileSystemPath, from: destination.path);

      final dir = p.dirname(relPath);
      if (dir.isNotEmpty && dir != '.') {
        createdDirs.add(dir);
      }
      createdFiles.add(relPath);
    }

    final sortedDirs = createdDirs.toList()..sort();
    for (final dir in sortedDirs) {
      logger.info('📁 Created: ${p.normalize(dir)}');
    }

    final sortedFiles = createdFiles.toList()..sort();
    for (final file in sortedFiles) {
      logger.info('📄 Created: ${p.normalize(file)}');
    }
  }
}
