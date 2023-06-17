import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Generating base flutter app ...');
  final name = context.vars['name']?.toString().snakeCase;
  if (name == null) {
    throw Exception('Invalid name : ${name}');
  }

  await Process.run(
    'flutter',
    [
      'create',
      '${name}',
      '--description',
      context.vars['description'],
      '--org',
      context.vars['org']
    ],
    runInShell: true,
  );
  progress.update('Cleaning up base app ...');
  await File('./${name}/lib/main.dart').delete();
  await File('./${name}/test/widget_test.dart').delete();
  progress.complete('Generated base flutter app');

  const possibleAddons = <String>[
    'get_storage',
    'firebase_analytics',
    'firebase_auth',
    'firebase_crashlytics',
  ];

  const firebaseKey = 'firebase';

  final addons = context.logger.chooseAny<String>(
    'Select add-on packages 📚:',
    choices: possibleAddons,
    display: (choice) => choice.titleCase,
  );

  for (final addon in possibleAddons) {
    context.vars[addon] = addons.contains(addon);
  }

  context.vars[firebaseKey] =
      addons.any((addon) => addon.startsWith(firebaseKey));
}
