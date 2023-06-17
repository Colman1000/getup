import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qserve/config/assets.dart';
import 'package:qserve/screens/intro/widgets/page_indicator.intro.dart';
import 'package:qserve/widgets/app_button.dart';
import 'package:qserve/widgets/app_scaffold.dart';
import 'package:qserve/widgets/app_text.dart';

import 'intro.controller.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  static String get name => '/intro';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: PageView(
                    pageSnapping: true,
                    onPageChanged: controller.selectedPage,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox.square(
                              dimension: Get.width,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: SvgPicture.asset(
                                  Assets.svgIntro1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const AppText(
                            'You order, we pick up',
                            type: AppTextType.subSemi,
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: AppText(
                              'Get fast delivery on orders you make, From food to package delivery.',
                              align: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox.square(
                              dimension: Get.width,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: SvgPicture.asset(
                                  Assets.svgIntro2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const AppText(
                            'Order for services',
                            type: AppTextType.subSemi,
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: AppText(
                              'Request for services like gas refill, laundry and many more',
                              align: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => PageIndicator(
                            pages: 2,
                            selectedPage: controller.selectedPage.value,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 100),
          AppButton(
            'Get Started',
            onPressed: () {},
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
