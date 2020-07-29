import 'dart:convert';

import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/enums/view_states.dart';
import 'package:ecommerceapp/core/services/authentication_service.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/base_model.dart';
import 'package:flutter/widgets.dart';

class AuthViewModel extends BaseModel {
  AuthenticationService _authenticationService;
  LocalStorageService _storageService;
  NavigationService _navigationService;

  String _error;

  String get error => _error;

  AuthViewModel({
    @required AuthenticationService authenticationService,
    @required LocalStorageService storageService,
    @required NavigationService navigationService,
  })  : _authenticationService = authenticationService,
        _storageService = storageService,
        _navigationService = navigationService;

  Future login(String email, String password) async {
    //setBusy(true);
    setState(ViewState.Busy);
//    var success = await _authenticationService.login(email, password);
    var userResponse = await _authenticationService.login(email, password);

    if (userResponse != null) {
      _storageService.setToken('value');
      String user = jsonEncode(userResponse);
      _storageService.setUser(user);
      _navigationService.navigateWithoutBack(RoutePaths.Landing);
    } else {
      _storageService.setToken(null);
      setState(ViewState.Error);
    }

    setState(ViewState.Idle);
  }

  Future logout() async {
    _storageService.logOut();
    notifyListeners();
  }
}
