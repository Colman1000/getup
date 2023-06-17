import 'package:flutter/material.dart';
{{#firebase}}
import 'package:firebase_core/firebase_core.dart';
{{/firebase}}
{{#get_storage}}
import 'package:get_storage/get_storage.dart';
{{/get_storage}}
import 'package:{{name.snakeCase()}}/app.dart';
import 'package:{{name.snakeCase()}}/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  {{#firebase}}
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  {{/firebase}}

  runApp(const App());
}
