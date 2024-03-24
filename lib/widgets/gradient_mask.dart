import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/color_constants.dart';

class GradientMask extends StatelessWidget {
  final Widget child;
  const GradientMask({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: [currentTheme.lightBlue, currentTheme.tealAccent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
