import 'package:flutter/material.dart';

class AnimationWidgets extends StatefulWidget {
  const AnimationWidgets({super.key});

  @override
  State<AnimationWidgets> createState() => _AnimationWidgetsState();
}

class _AnimationWidgetsState extends State<AnimationWidgets>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation = AnimationController(duration: Duration(seconds: 2), vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: RotationTransition(
          turns: animation,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    );
  }
}
