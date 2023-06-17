import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await cleanupFiles(context);

  await updatePubspec(context);
  await installDependencies(context);

  final name = context.vars['name']?.toString().snakeCase;
  if (name == null) {
    throw Exception('Invalid name : ${name}');
  }

  context.logger.success('Successfully created ${name}!');
  context.logger.info('Run the following commands to get started: ');
  context.logger.info('  cd ${name}');
  context.logger.info('  flutter run \n\n');

  final firebase = context.vars['firebase'] ?? false;

  if (firebase) {
    context.logger.warn(
      'Run `flutterfire configure` to complete firebase setup',
    );
  }
}

Future<void> cleanupFiles(HookContext context) async {
  final progress = context.logger.progress('Cleaning up directory ...');
  final name = context.vars['name']?.toString().snakeCase;
  if (name == null) {
    throw Exception('Invalid name : ${name}');
  }
  final files = await Directory(name)
      .listSync(recursive: true)
      .where((element) => element.toString().contains('.gitkeep'));

  files.forEach((f) => f.delete(recursive: false));
  progress.complete('Removed .gitkeep files');
}

installDependencies(HookContext context) async {
  final vars = <String>['get'];

  for (final v in context.vars.entries) {
    if (v.value == true && v.key != 'firebase') {
      vars.add(v.key.toString());
    }
  }

  context.logger.info('Installing :${vars.join(', ')}');
  final name = context.vars['name']?.toString().snakeCase;
  if (name == null) {
    throw Exception('Invalid name : ${name}');
  }

  final progress = context.logger.progress('Installing dependencies ...');

  final result = await Process.run(
    'flutter',
    ['pub', 'add', '${vars.join(' ').trim()}'],
    workingDirectory: name,
    runInShell: true,
  );

  final res = await Future.wait(
    vars.map(
      (p) => Process.run(
        'flutter',
        ['pub', 'add', p],
        workingDirectory: name,
        runInShell: true,
      ),
    ),
  );

  final errs = res.where((r) => r.exitCode != 0);

  if (errs.isNotEmpty) {
    final error = await errs.first.stderr.toString();
    progress.fail(error);
  }

  progress.complete('Installed dependencies');
}

updatePubspec(HookContext context) async {
  final progress = context.logger.progress('Updating pubspec ...');
  final name = context.vars['name']?.toString().snakeCase;
  if (name == null) {
    throw Exception('Invalid name : ${name}');
  }
  var pubspec = await File('${name}/pubspec.yaml');
  var sink = pubspec.openWrite(mode: FileMode.append);
  sink.write('  assets:\n    - assets/icons/\n    - assets/images/\n');
  await sink.close();
  progress.complete('Updated pubspec');
}
