import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/color_constants.dart';

class Indicators extends StatelessWidget {
  final int currentIndex;
  final int length;
  const Indicators({super.key, required this.currentIndex, required this.length});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 10,
          width: currentIndex == index ? 20 : 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: currentIndex == index
                ? LinearGradient(
                colors: [
                  currentTheme.lightBlue,
                  currentTheme.tealAccent
                ],)
                : LinearGradient(
                colors: [
                currentTheme.white,
            currentTheme.white,
            ],)
          ),
        ),
      ),
    );
  }
}