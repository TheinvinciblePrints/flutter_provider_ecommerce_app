import 'package:ecommerceapp/core/enums/view_states.dart';
import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }
}
