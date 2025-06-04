import 'package:animation_widgets/controller/bottombar_controller.dart';
import 'package:animation_widgets/screen/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(BottombarController());
  runApp(MyApps());
}

class MyApps extends StatefulWidget {
  const MyApps({super.key});

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animation Wedgets",
      home: BottomBarWidgets(),
    );
  }
}
