import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier{
  // 登入狀態 = 1
  // 未登入狀態 = 0
  int _state = 0;

  int get state => _state;

  void loginState(bool item){
    if(item == true){
      _state = 1;
    }
    else{
      _state = 0;
    }
    notifyListeners();
  }
}