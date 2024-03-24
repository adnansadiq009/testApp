import 'package:flutter/material.dart';
import '../main.dart';

class CustomText extends StatelessWidget {
  final FontWeight? weight;
  final String text;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overFlow;
  final int? lines;
  const CustomText({
    super.key,
    required this.text,
    this.weight,
    this.size,
    this.color,
    this.overFlow,
    this.textAlign,
    this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: lines ?? 1,
      style: TextStyle(
          fontFamily: 'urbanist',
          fontWeight: weight ?? FontWeight.w400,
          fontSize: size ?? 16,
          color: color ?? currentTheme.black),
          overflow: overFlow ?? TextOverflow.ellipsis,
    );
  }
}
