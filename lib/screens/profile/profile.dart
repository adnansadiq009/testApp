import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_test/widgets/custom_text.dart';

import '../../main.dart';
import '../../providers/them_provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
        return Scaffold(
          backgroundColor: currentTheme.backgroundColor,
          appBar: AppBar(
            backgroundColor: currentTheme.backgroundColor,
            centerTitle: true,
            title: CustomText(
              text: 'Profile',
              weight: FontWeight.w600,
              size: 24,
              color: currentTheme.white,
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CustomText(text: 'Theme',
                  size: 18,
                    weight: FontWeight.w600,
                  color: currentTheme.white,),
                  const Spacer(),
                  Switch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    activeColor: currentTheme.paleYellow,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
