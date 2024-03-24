import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_test/providers/intro_provider.dart';
import 'package:social_media_test/screens/intro/widgets/intro_page.dart';

import '../../main.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Consumer<IntroProvider>(
        builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: currentTheme.backgroundColor,
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
                provider.setIndex = index;
            },
            children: [
              IntroPage(
                  title: 'Discover Great Deals',
                  image: 'assets/images/intro1.png',
                  description:
                      "Have something to sell? Just snap, upload,"
                      " and price your items. We've made the process simple and quick."
                      " Get your items in front of buyers in no time!",
                  pageController: _pageController,
                  currentIndex: provider.currentIndex,),
              IntroPage(
                  title: 'Effortless Selling',
                  image: 'assets/images/intro2.png',
                  description:
                      "Have something to sell? Just snap, upload,"
                      " and price your items. We've made the process simple and quick."
                      " Get your items in front of buyers in no time!",
                  pageController: _pageController,
                  currentIndex: provider.currentIndex,),
              IntroPage(
                  title: 'Promote Your Business',
                  image: 'assets/images/intro3.png',
                  description:
                      "Our platform is a powerful tool for businesses as well!"
                      " Advertise your products or services to a large and"
                      " engaged audience,",
                  pageController: _pageController,
                  currentIndex: provider.currentIndex,),

            ],
          ),
        );
      }
    );
  }
}
