import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  // 登入狀態 = 1
  // 未登入狀態 = 0
  // 設定變數表示狀態
  int _state = 0;

  // 獲得當下 state 值
  int get state => _state;

  // 當呼叫方法時就會判斷是否處於登入狀態
  void loginState(bool item) {
    if (item == true) {
      _state = 1;
    } else {
      _state = 0;
    }
    notifyListeners();
  }
}
