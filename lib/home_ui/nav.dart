import 'package:flutter/material.dart';
import 'package:sports/core/constant.dart';
import 'package:sports/home_ui/buddies_screen/buddies.dart';
import 'package:sports/home_ui/discover_screen/discover.dart';
import 'package:sports/home_ui/profile_screen/profile.dart';
import 'package:sports/home_ui/settings_screen/settings.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int index = 0;
  var currentIndex;
  var Kscreens = <Widget>[

    Profile(),
    Buddies(),
    Discover(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Kscreens[index],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Palette.textColor),
          fixedColor: Palette.textColor,
          showSelectedLabels: true,
          currentIndex: index,
          onTap: (currentIndex) {
            setState(() {
              index = currentIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_rounded),
              label: 'Buddies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
