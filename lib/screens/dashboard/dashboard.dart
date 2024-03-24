import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_test/providers/dashboard_provider.dart';
import 'package:social_media_test/screens/add_post/add_post.dart';
import 'package:social_media_test/screens/dashboard/bottom_navbar.dart';
import 'package:social_media_test/screens/deals/deals.dart';
import 'package:social_media_test/screens/profile/profile.dart';

import '../../main.dart';
import '../home/home.dart';
import '../search/search.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final List<Widget> _screens = [
    const HomeScreen(),
    const Search(),
    const AddPost(),
    const Deals(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
        builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: currentTheme.backgroundColor,
          body: _screens[provider.selectedIndex],
          bottomNavigationBar: BottomNavBar(
            selectedIndex: provider.selectedIndex,
            onItemTapped: (index) {
              provider.setIndex = index;
            },
          ),
        );
      }
    );
  }
}


