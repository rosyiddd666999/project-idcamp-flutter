import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_id_camp/dashboard/pages/favorite.dart';
import 'package:project_id_camp/dashboard/pages/home.dart';
import 'package:project_id_camp/dashboard/pages/profile.dart';
import 'package:project_id_camp/themes/colors.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int _selectedIndex = 0;

  List<Widget> _getWidgetOptions() {
    return [
      const Home(),
      const Favorite(),
      const Profile(),
    ];
  }

  static const List<String> _iconsEnable = [
    "assets/vectors/home_enable.svg",
    "assets/vectors/heart_enable.svg",
    "assets/vectors/profile_enable.svg",
  ];
  static const List<String> _iconsDisable = [
    "assets/vectors/home_disable.svg",
    "assets/vectors/heart_disable.svg",
    "assets/vectors/profile_disable.svg",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getWidgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                _iconsDisable[0],
              ),
              activeIcon: SvgPicture.asset(
                _iconsEnable[0],
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _iconsDisable[1],
            ),
            activeIcon: SvgPicture.asset(
              _iconsEnable[1],
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              _iconsDisable[2],
            ),
            activeIcon: SvgPicture.asset(
              _iconsEnable[2],
            ),
            label: "Profile",
          ),
        ],
        selectedItemColor: AppColors.tertary,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
