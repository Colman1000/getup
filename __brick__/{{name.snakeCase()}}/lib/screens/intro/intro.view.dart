import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'intro.controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  static String get name => '/intro';

  @override
  Widget build(BuildContext context) {
    return const Container( color: Colors.blue);
  }
}
