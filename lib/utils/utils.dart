import 'package:flutter/material.dart';

double getWidth(BuildContext context) {
  return MediaQuery.sizeOf(context).width;
}

double getHeight(BuildContext context) {
  double screenHeight = MediaQuery.sizeOf(context).height;
  return screenHeight;
}