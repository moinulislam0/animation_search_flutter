import 'package:animation_widgets/controller/bottombar_controller.dart';
import 'package:animation_widgets/screen/animation.dart';
import 'package:animation_widgets/screen/dateTImePicker.dart';
import 'package:animation_widgets/screen/home.dart';
import 'package:animation_widgets/screen/pages.dart';
import 'package:animation_widgets/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarWidgets extends StatefulWidget {
  const BottomBarWidgets({super.key});

  @override
  State<BottomBarWidgets> createState() => _BottomBarWidgetsState();
}

class _BottomBarWidgetsState extends State<BottomBarWidgets> {
  List<Widget> screen = [
    HomeWidgets(),
    SearchPage(),
    PagesWidgets(),
    AnimationWidgets(),
    DateTimeWidgets()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          GetBuilder<BottombarController>(builder: (controller) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.SelectedIndex,
            onTap: (value) {
              controller.changeIndex(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.pages), label: "Pages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.animation), label: "Animation"),
              BottomNavigationBarItem(icon:Icon(Icons.date_range),label: "Date")
            ]);
      }),
      body: GetBuilder<BottombarController>(builder: (controller) {
        return screen[controller.SelectedIndex];
      }),
    );
  }
}
