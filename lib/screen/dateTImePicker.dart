import 'package:flutter/material.dart';

class DateTimeWidgets extends StatefulWidget {
  const DateTimeWidgets({super.key});

  @override
  State<DateTimeWidgets> createState() => _DateTimeWidgetsState();
}

class _DateTimeWidgetsState extends State<DateTimeWidgets> {
  String selectedIndex = '';
  Future<void> _picker() async {
    DateTime? showDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      initialDate: DateTime.now(),
      lastDate: DateTime(2031, 12, 15),
    );
    if (showDate != null) {
      setState(() {
        selectedIndex = "${showDate.day}-${showDate.month}-${showDate.year}";
        _dbController.text = selectedIndex;
      });
    }
  }

  final TextEditingController _dbController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Pickers"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _dbController,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Picker Date",
                suffixIcon: IconButton(
                    onPressed: _picker, icon: Icon(Icons.date_range)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
