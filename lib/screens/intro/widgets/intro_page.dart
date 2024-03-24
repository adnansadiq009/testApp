import 'package:flutter/material.dart';
import 'package:social_media_test/widgets/custom_text.dart';
import 'package:social_media_test/screens/dashboard/dashboard.dart';
import 'package:social_media_test/screens/intro/widgets/intro_dot_indicators.dart';
import 'package:social_media_test/utils/utils.dart';

import '../../../main.dart';

class IntroPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final PageController pageController;
  final int currentIndex;
  const IntroPage({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.pageController,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getHeight(context) * 0.56,
          child: Center(
            child: Image.asset(image),
          ),
        ),
        Container(
          height: getHeight(context) * 0.44,
          width: getWidth(context),
          color: currentTheme.darkBlue,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: getHeight(context) * 0.02,
              ),
              SizedBox(
                height: getHeight(context)*0.07,
                child: FittedBox(
                  child: CustomText(
                    text: title,
                    weight: FontWeight.w700,
                    size: 32,
                    color: currentTheme.white,
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(context)* 0.15,
                child: CustomText(
                  text: description,
                  weight: FontWeight.w400,
                  lines: 4,
                  size: 16,
                  color: currentTheme.white,
                  textAlign: TextAlign.center,
                ),
              ),
             SizedBox(
                height: getHeight(context)* 0.03,
              ),
              SizedBox(
                height: getHeight(context)* 0.02,
                child: IntoDotIndicators(
                  length: 3,
                  currentIndex: currentIndex,
                ),
              ),
              SizedBox(
                height: getHeight(context)* 0.03,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const Dashboard();
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: getHeight(context)*0.09,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: currentTheme.white,),
                        child: Center(
                          child: CustomText(
                            text: 'Skip',
                            weight: FontWeight.w700,
                            size: 16,
                            color: currentTheme.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (currentIndex < 2) {
                          pageController.animateToPage(
                            currentIndex + 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Dashboard();
                              },
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: getHeight(context)*0.09,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          gradient:  LinearGradient(
                            colors: [currentTheme.lightBlue, currentTheme.tealAccent],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Next',
                            weight: FontWeight.w700,
                            size: 16,
                            color: currentTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
