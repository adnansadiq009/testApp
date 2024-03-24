import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_test/providers/dashboard_provider.dart';
import 'package:social_media_test/providers/home_provider.dart';
import 'package:social_media_test/providers/intro_provider.dart';
import 'package:social_media_test/providers/them_provider.dart';
import 'package:social_media_test/providers/video_player_provider.dart';
import 'package:social_media_test/screens/intro/intro.dart';
import 'package:social_media_test/utils/color_constants.dart';

late ColorsConstant currentTheme;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dark darkTheme = Dark();
    Light lightTheme = Light();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VideoPlayerProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => IntroProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, _) {
            currentTheme = themeProvider.isDarkMode ? darkTheme : lightTheme;
          return MaterialApp(
            title: 'Social Media Test',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
            ),
            home: const IntroScreen()
          );
        }
      ),
    );
  }
}
