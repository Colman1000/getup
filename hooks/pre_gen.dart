import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Generating base flutter app ...');
  await Process.run(
    'flutter',
    [
      'create',
      '{{name}}',
      '--description',
      context.vars['description'],
      '--org',
      context.vars['org']
    ],
    runInShell: true,
  );
  progress.update('Cleaning up base app ...');
  await File('./{{name}}/lib/main.dart').delete();
  await File('./{{name}}/test/widget_test.dart').delete();
  progress.complete('Generated base flutter app');
}