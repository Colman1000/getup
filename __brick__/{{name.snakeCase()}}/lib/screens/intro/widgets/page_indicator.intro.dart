import 'package:flutter/material.dart';
import 'package:qserve/config/colors.dart';
import 'package:qserve/config/constants.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, this.pages = 2, this.selectedPage = 0});

  final int pages;
  final int selectedPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pages,
        (index) => AnimatedContainer(
          duration: Constants.duration,
          curve: Constants.curve,
          width: 8,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedPage == index ? AppColors.purple600 : AppColors.grey50,
          ),
        ),
      ),
    );
  }
}
