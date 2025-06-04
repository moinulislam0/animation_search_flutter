import 'package:flutter/material.dart';

class HomeWidgets extends StatefulWidget {
  const HomeWidgets({super.key});

  @override
  State<HomeWidgets> createState() => _HomeWidgetsState();
}

class _HomeWidgetsState extends State<HomeWidgets> {
  String changeSizes = '';
  List<String> sizes = ['s', 'm', 'x', 'xl', 'xll'];
  Color changeColors = Colors.red;
  List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.deepPurple
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Colors"),
          SizedBox(
            height: 10,
          ),
          Row(
            children: colors.map((color) {
              return InkWell(
                onTap: () {
                  changeColors = color;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: color,
                    child: Visibility(
                        visible: changeColors == color,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        )),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Size"),
          SizedBox(
            height: 10,
          ),
          Row(
            children: sizes.map((size) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    changeSizes = size;
                    setState(() {});
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(4),
                        color: changeSizes == size ? Colors.blue : null),
                    child: Visibility(
                        visible: true, child: Center(child: Text(size))),
                  ),
                ),
              );
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
