import 'dart:io';
import 'package:mason/mason.dart';
import 'package:path/path.dart' as p;
import 'package:test/test.dart';
import '../lib/src/utils/generator_helper.dart';

// Minimal, robust normalization for file content comparison
String normalize(String input) {
  return input
      .replaceAll('\r\n', '\n')
      .replaceAll('\r', '\n')
      .split('\n')
      .map((l) => l.trimRight())
      .join('\n')
      .trim();
}

void main() {
  group('File Generation', () {
    final testProjectDir = Directory('test/test_project');
    final exampleDir = Directory('example');

    test('project_setup + clean_feature generates files matching the example',
        () async {
      // Arrange: Clean up before test
      if (testProjectDir.existsSync()) {
        testProjectDir.deleteSync(recursive: true);
      }
      final logger = Logger();

      // 1. Generate base project
      final projectSetupBrick = Brick.path('bricks/project_setup');
      final projectSetupGenerator =
          await MasonGenerator.fromBrick(projectSetupBrick);
      final projectVars = <String, dynamic>{'project_name': 'test_project'};
      await GeneratorHelper.generate(
        generator: projectSetupGenerator,
        destination: testProjectDir,
        vars: projectVars,
        logger: logger,
      );

      // 2. Generate the 'sample' feature
      final cleanFeatureBrick = Brick.path('bricks/clean_feature');
      final cleanFeatureGenerator =
          await MasonGenerator.fromBrick(cleanFeatureBrick);
      final featureVars = <String, dynamic>{'name': 'sample'};
      await GeneratorHelper.generate(
        generator: cleanFeatureGenerator,
        destination: testProjectDir,
        vars: featureVars,
        logger: logger,
      );

      // Assert
      Map<String, File> collectFiles(Directory dir) {
        final files = <String, File>{};
        for (final entity in dir.listSync(recursive: true)) {
          if (entity is File) {
            // Exclude IDE/build files from comparison
            if (entity.path.contains('.idea') ||
                entity.path.contains('.dart_tool')) continue;
            final rel = p.relative(entity.path, from: dir.path);
            files[rel] = entity;
          }
        }
        return files;
      }

      final generated = collectFiles(testProjectDir);
      final example = collectFiles(exampleDir);

      expect(generated.keys.toSet(), example.keys.toSet(),
          reason: 'File list mismatch');

      for (final relPath in generated.keys) {
        final genContent = normalize(generated[relPath]!.readAsStringSync());
        final exContent = normalize(example[relPath]!.readAsStringSync());
        expect(genContent, exContent,
            reason: 'File content mismatch: $relPath');
      }
    });
  });
}
