import 'package:get/get.dart';

class BottombarController extends GetxController {
  int _selectedIndex = 0;

  int get SelectedIndex => _selectedIndex;

  void changeIndex(int value) {
    _selectedIndex = value;
    update();
  }
}
