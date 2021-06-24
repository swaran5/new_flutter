
import 'package:flutter/foundation.dart';

class TimerViewmodel extends ChangeNotifier
{
  int remainingTime = 60;

  int getremainingtime() => remainingTime;

  updateremaingtime(){
    remainingTime--;
    notifyListeners();
  }
}