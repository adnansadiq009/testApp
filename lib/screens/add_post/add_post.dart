import 'package:flutter/material.dart';
import 'package:social_media_test/widgets/custom_text.dart';

import '../../main.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: currentTheme.backgroundColor,
        centerTitle: true,
        title: CustomText(
          text: 'Add Post',
          weight: FontWeight.w600,
          size: 24,
          color: currentTheme.white,
        ),
      ),
      body: Center(
        child: CustomText(
          text: 'Add Post Screen',
          weight: FontWeight.w600,
          size: 32,
          color: currentTheme.white,
        ),
      ),
    );
  }
}
