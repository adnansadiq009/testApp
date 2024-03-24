import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:social_media_test/utils/app_sizes.dart';
import 'package:social_media_test/widgets/gradient_mask.dart';

import '../../main.dart';
import '../../providers/them_provider.dart';

class BottomNavBar extends StatefulWidget {
   final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const BottomNavBar({super.key,
   required this.selectedIndex,
    required this.onItemTapped,
    });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
        return BottomNavigationBar(
          backgroundColor: currentTheme.backgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: widget.selectedIndex == 0
                  ? GradientMask(
                      child: SvgPicture.asset(
                        'assets/images/home.svg',
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/images/home.svg',
                      colorFilter: ColorFilter.mode(
                        currentTheme.gray,
                        BlendMode.srcIn,
                      ),
                    ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: widget.selectedIndex == 1
                  ? GradientMask(
                      child: SvgPicture.asset(
                        'assets/images/search.svg',
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/images/search.svg',
                      colorFilter: ColorFilter.mode(
                        currentTheme.gray,
                        BlendMode.srcIn,
                      ),
                    ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  gapH16,
                  Container(
                    width: 55,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [currentTheme.lightBlue, currentTheme.tealAccent],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: currentTheme.white,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: widget.selectedIndex == 3
                  ? GradientMask(
                      child: SvgPicture.asset(
                        'assets/images/deals.svg',
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/images/deals.svg',
                      colorFilter: ColorFilter.mode(
                        currentTheme.gray,
                        BlendMode.srcIn,
                      ),
                    ),
              label: 'Deals',
            ),
            BottomNavigationBarItem(
              icon: widget.selectedIndex == 4
                  ? GradientMask(
                      child: SvgPicture.asset(
                        'assets/images/profile.svg',
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/images/profile.svg',
                      colorFilter: ColorFilter.mode(
                        currentTheme.gray,
                        BlendMode.srcIn,
                      ),
                    ),
              label: 'Profile',
            ),
          ],
          currentIndex: widget.selectedIndex,
          iconSize: 24,
          selectedItemColor: currentTheme.tealAccent,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: currentTheme.gray,
          selectedLabelStyle: TextStyle(color: currentTheme.tealAccent),
          unselectedLabelStyle: TextStyle(color: currentTheme.gray),
          onTap: widget.onItemTapped,
          type: BottomNavigationBarType.fixed,
          elevation: 5,
        );
      }
    );

  }
}