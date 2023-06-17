import 'package:get/get.dart';
import 'intro.controller.dart';
import 'intro.view.dart';

final intro = GetPage(
  name: IntroView.name,
  page: () => const IntroView(),
  binding: BindingsBuilder.put(() => IntroController()),
);
