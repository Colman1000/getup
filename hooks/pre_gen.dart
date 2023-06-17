import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Generating base flutter app ...');
  await Process.run(
    'flutter',
    [
      'create',
      '{{name.snakeCase()}}',
      '--description',
      context.vars['description'],
      '--org',
      context.vars['org']
    ],
    runInShell: true,
  );
  progress.update('Cleaning up base app ...');
  await File('./{{name.snakeCase()}}/lib/main.dart').delete();
  await File('./{{name.snakeCase()}}/test/widget_test.dart').delete();
  progress.complete('Generated base flutter app');

  const possibleAddons = <String>[
    'get_storage',
    'firebase_analytics',
    'firebase_auth',
    'firebase_crashlytics',
  ];

  const firebaseKey = 'firebase';

  final addons = context.logger.chooseAny<String>(
    'Select add-on packages 📚',
    choices: possibleAddons,
    display: (choice) => choice.titleCase,
  );

  for (final a in addons) {
    context.vars[a] = true;
  }

  context.vars[firebaseKey] =
      addons.any((addon) => addon.startsWith(firebaseKey));
}
