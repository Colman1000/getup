import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await cleanupFiles(context);

  await installDependencies(context);
  await updatePubspec(context);

  context.logger.success('Successfully created {{name.snakeCase()}}!');
  context.logger.info('Run the following commands to get started: ');
  context.logger.info('  cd {{name.snakeCase()}}');
  context.logger.info('  flutter run');
}

Future<void> cleanupFiles(HookContext context) async {
  final progress = context.logger.progress('Cleaning up directory ...');
  await Directory('./{{name.snakeCase()}}/')
      .list(recursive: true)
      .where((element) => element.toString().contains('.gitkeep'))
      .listen((file) {
    file.delete();
  });
  progress.complete('Removed .gitkeep files');
}

installDependencies(HookContext context) async {
  final progress = context.logger.progress('Installing dependencies ...');

  await Process.run(
    'flutter',
    [
      'pub',
      'add',
      'get '
          '${context.vars['get_storage'] == true ? 'get_storage' : ''} '
          '${context.vars['firebase'] == true ? 'firebase_core' : ''} '
          '${context.vars['firebase_analytics'] == true ? 'firebase_analytics' : ''} '
          '${context.vars['firebase_crashlytics'] == true ? 'firebase_crashlytics' : ''} '
          '${context.vars['firebase_auth'] == true ? 'firebase_auth' : ''} '
    ],
    workingDirectory: './{{name.snakeCase()}}',
    runInShell: true,
  );
  progress.complete('Installed dependencies');
}

updatePubspec(HookContext context) async {
  final progress = context.logger.progress('Updating pubspec ...');
  var pubspec = await File('./{{name.snakeCase()}}/pubspec.yaml');
  var sink = pubspec.openWrite(mode: FileMode.append);
  sink.write('  assets:\n    - assets/icons/\n    - assets/images/\n');
  await sink.close();
  progress.complete('Updated pubspec');

  final firebase = context.vars['firebase'] ?? false;

  if (firebase) {
    context.logger.info(
      'Run `flutterfire configure` to complete firebase setup',
    );
  }
}
