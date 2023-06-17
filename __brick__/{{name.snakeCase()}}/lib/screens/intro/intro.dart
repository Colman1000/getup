import 'package:get/get.dart';
import 'package:{{name.snakeCase()}}/screens/intro/intro.controller.dart';
import 'package:{{name.snakeCase()}}/screens/intro/intro.view.dart';

final intro = GetPage(
  name: IntroView.name,
  page: () => const IntroView(),
  binding: BindingsBuilder.put(() => IntroController()),
);
