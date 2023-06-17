import 'package:get/get.dart';
import 'package:qserve/screens/intro/intro.controller.dart';
import 'package:qserve/screens/intro/intro.view.dart';

final intro = GetPage(
  name: IntroView.name,
  page: () => const IntroView(),
  binding: BindingsBuilder.put(() => IntroController()),
);
