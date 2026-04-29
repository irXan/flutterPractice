import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier{
  bool isDark = false;

  toggle(){
    isDark = !isDark;
    notifyListeners();
  }
}