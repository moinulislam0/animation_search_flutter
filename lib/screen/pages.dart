import 'package:flutter/material.dart';

class PagesWidgets extends StatefulWidget {
  const PagesWidgets({super.key});

  @override
  State<PagesWidgets> createState() => _PagesWidgetsState();
}

class _PagesWidgetsState extends State<PagesWidgets> {
  bool animation = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        animation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Pages"),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 200 + (index * 410)),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(animation ? 0 : -200, 0, 0),
              child: Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text("Page Title"),
                  subtitle: Text("Here we can show the many pages"),
                  trailing: Icon(Icons.settings),
                ),
              ),
            );
          }),
    );
  }
}
