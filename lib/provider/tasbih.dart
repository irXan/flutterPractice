import 'package:flutter/material.dart';

class TasbihProvider extends ChangeNotifier{
  int count = 0;
  int tasbihCount = 0;

  inc(){
    count++;
    if (count == 99){
      tasbihCount++;
      count = 0;
    }
    notifyListeners();
  }

  reset(){
    tasbihCount = 0;
    count = 0;

    notifyListeners();
  }
}