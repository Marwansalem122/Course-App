import 'package:flutter/material.dart';

import '../../common/values/colors.dart';

Widget buildpage(int index) {
  List<Widget> widget = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Courses"),
    ),
    const Center(
      child: Text("chat"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  return widget[index];
}

List<BottomNavigationBarItem> bottomtabs = [
  const BottomNavigationBarItem(
    activeIcon: Icon(
      Icons.home,
      color: AppColors.primaryElement,
    ),
    label: "home",
    icon: Icon(
      Icons.home,
    ),
  ),
  const BottomNavigationBarItem(
    activeIcon: Icon(
      Icons.search,
      color: AppColors.primaryElement,
    ),
    label: "Search",
    icon: Icon(
      Icons.search,
      //  color: AppColors.primaryFourElementText,
    ),
  ),
  const BottomNavigationBarItem(
    activeIcon: Icon(
      Icons.play_arrow,
      color: AppColors.primaryElement,
    ),
    label: "Course",
    icon: Icon(
      Icons.watch,
      //  color: AppColors.primaryFourElementText,
    ),
  ),
  const BottomNavigationBarItem(
    activeIcon: Icon(
      Icons.chat,
      color: AppColors.primaryElement,
    ),
    label: "Chat",
    icon: Icon(
      Icons.chat,

      // color: AppColors.primaryFourElementText,
    ),
  ),
  const BottomNavigationBarItem(
    activeIcon: Icon(
      Icons.person,
      color: AppColors.primaryElement,
    ),
    label: "Profile",
    icon: Icon(
      Icons.person,
      //   color: AppColors.primaryFourElementText,
    ),
  ),
];
