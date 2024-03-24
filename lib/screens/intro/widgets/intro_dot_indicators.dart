import 'package:flutter/material.dart';
import '../../../main.dart';

class IntoDotIndicators extends StatelessWidget {
 final int currentIndex;
 final int length;
 const IntoDotIndicators({super.key, required this.currentIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: currentIndex == index
            ? currentTheme.tealAccent
            : currentTheme.darkGray,
      ),
    ),
      ),
    );
  }
}