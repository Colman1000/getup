{{#firebase}}
import 'package:firebase_core/firebase_core.dart';
{{/firebase}}
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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


firebase_core
firebase_analytics
firebase_crashlytics
firebase_auth

get_storage
package_info_plus
