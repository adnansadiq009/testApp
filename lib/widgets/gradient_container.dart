import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media_test/utils/app_sizes.dart';
import '../main.dart';
import '../utils/color_constants.dart';
import 'custom_text.dart';

class GradientContainer extends StatelessWidget {
  final bool? isDot;
  final String imagePath;
  final String title;
  const GradientContainer({super.key, this.isDot, required this.imagePath, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [currentTheme.lightBlue, currentTheme.tealAccent],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isDot ?? false ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentTheme.yellow),
                  ),
                  gapW4,
                  Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentTheme.yellow),
                  )
                ],
              ) : const SizedBox.shrink(),
              gapH4,
              SvgPicture.asset(imagePath, height: 25, width: 25,),
            ],
          ),
        ),
        gapH10,
        CustomText(text: title, size: 14, weight: FontWeight.w600, color: currentTheme.white,)
      ],
    );
  }
}
