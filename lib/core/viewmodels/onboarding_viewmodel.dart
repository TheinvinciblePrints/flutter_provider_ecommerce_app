import 'package:ecommerceapp/core/enums/auth_states.dart';
import 'package:ecommerceapp/core/models/user.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';

class OnBoardingViewModel with ChangeNotifier {
  LocalStorageService _storageService;

  AuthStatus _status = AuthStatus.Uninitialized;
  String _token;
  User _user;
  bool _finishedOnBoarding = false;

  bool get finishedOnBoarding => _finishedOnBoarding;

  AuthStatus get status => _status;

  User get user => _user;

  String get token => _token;

  OnBoardingViewModel({
    @required LocalStorageService storageService,
  }) : _storageService = storageService;

  Future getAppState() async {
    _finishedOnBoarding = await _storageService.getFinishedOnBoarding();
    _token = await _storageService.getToken();
    _user = await _storageService.getUser();

    if (finishedOnBoarding) {
      _status = AuthStatus.OnBoardingFinished;
      if (user != null) {
        _user = user;
        _token = token;
        _status = AuthStatus.Authenticated;
      } else {
        _status = AuthStatus.Unauthenticated;
      }
    } else {
      _status = AuthStatus.Uninitialized;
    }

    notifyListeners();
  }

  Future<bool> setFinishedOnBoarding(bool value) async {
    _finishedOnBoarding = await _storageService.setFinishedOnBoarding(value);
    return _finishedOnBoarding;
  }
}
