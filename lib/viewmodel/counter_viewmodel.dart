
import 'package:stacked/stacked.dart';

class CounterViewModel extends BaseViewModel{

  CounterViewModel(){
    var some2 = true;
  }

  int _counter = 0;
  int get getCounter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

  void decrement(){
    _counter--;
    notifyListeners();
  }
}