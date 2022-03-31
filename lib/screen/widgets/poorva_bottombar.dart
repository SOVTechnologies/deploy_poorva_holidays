import 'package:flutter/material.dart';
import 'package:poorvaholiday/constant/color_constant.dart';

class PoorvaBottomBar extends StatelessWidget {
  const PoorvaBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorConstant.blueColor,
      fixedColor: ColorConstant.blueColor,
      unselectedItemColor: ColorConstant.orangeColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.card_travel),
          label: 'Tour',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
    );
  }
}
