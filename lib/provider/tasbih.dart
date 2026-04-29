import 'package:flutter/material.dart';

class TasbihProvider extends ChangeNotifier {
  int count = 0;
  int tasbihCount = 0;

  void inc() {
    count++;
    if (count == 100) {
      tasbihCount++;
      count = 0;
    }
    notifyListeners();
  }

  void reset() {
    tasbihCount = 0;
    count = 0;

    notifyListeners();
  }

  String get tasbihName {
    if (count < 34) {
      return 'SubhanAllah (سُبْحَانَ اللّٰه): "Glory be to Allah"';
    } else if (count < 67) {
      return 'Alhamdulillah (الْـحَمْـدُ للهِ): "All praise is due to Allah';
    } else {
      return 'Allahu Akbar (اللّٰهُ أَكْبَرُ): "Allah is the Greatest"';
    }
  }
}