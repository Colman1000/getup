import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:{{name}}/app_bindings.dart';
import 'package:{{name}}/config/colors.dart';
import 'package:{{name}}/config/constants.dart';
import 'package:{{name}}/config/routes.dart';
import 'package:{{name}}/config/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: {{name}},
      popGesture: true,
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme,
      initialBinding: AppBindings(),
      initialRoute: Routes.initialRoute,
      getPages: Routes.all,
      debugShowCheckedModeBanner: false,
      color: AppColors.primary(context),
      enableLog: true,
      navigatorObservers: [
        FirebaseAnalyticsObserver(
          analytics: FirebaseAnalytics.instance,
          nameExtractor: (s) {
            final name = s.name ?? '';
            return name.startsWith('/') ? name.substring(1) : name;
          },
        )
      ],
      scaffoldMessengerKey: Constants.scaffoldMsgKey,
    );
  }
}
