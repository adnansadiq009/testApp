import 'package:flutter/material.dart';
import 'package:social_media_test/main.dart';
import 'package:social_media_test/widgets/unicorn_outline_button.dart';
import '../utils/app_sizes.dart';
import 'custom_text.dart';

class BorderedContainer extends StatelessWidget {
  final Widget child;
  final String title;
  const BorderedContainer({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UnicornOutlineButton(
          strokeWidth: 2,
          radius: 25,
          gradient: LinearGradient(
            colors: [currentTheme.lightBlue, currentTheme.tealAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          child: child,
          onPressed: () {},
        ),
        gapH10,
        CustomText(text: title, size: 12, weight: FontWeight.w500, color: currentTheme.white,)
      ],
    );
  }
}
