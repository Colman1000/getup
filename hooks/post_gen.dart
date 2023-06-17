import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await cleanupFiles(context);

  await installDependencies(context);
  await updatePubspec(context);

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
  final progress = context.logger.progress('Installing dependencies ...');
  final name = context.vars['name']?.toString().snakeCase;
  if (name == null) {
    throw Exception('Invalid name : ${name}');
  }

  final packages = 'get '
      '${context.vars['get_storage'] == true ? 'get_storage' : ''} '
      '${context.vars['firebase'] == true ? 'firebase_core' : ''} '
      '${context.vars['firebase_analytics'] == true ? 'firebase_analytics' : ''} '
      '${context.vars['firebase_crashlytics'] == true ? 'firebase_crashlytics' : ''} '
      '${context.vars['firebase_auth'] == true ? 'firebase_auth' : ''} ';

  await Process.run(
    'flutter',
    ['pub', 'add', packages.trim()],
    workingDirectory: name,
    runInShell: true,
  );
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
