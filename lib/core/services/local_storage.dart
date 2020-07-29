import 'dart:convert';

import 'package:ecommerceapp/core/constants/constants.dart' as Constants;
import 'package:ecommerceapp/core/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences _preferences;
  bool _finishedOnBoarding = false;

  Future<bool> setFinishedOnBoarding(bool value) async {
    _preferences = await SharedPreferences.getInstance();
    _finishedOnBoarding =
        await _preferences.setBool(Constants.FINISHED_ON_BOARDING, value);
    return _finishedOnBoarding;
  }

  Future<bool> getFinishedOnBoarding() async {
    _preferences = await SharedPreferences.getInstance();
    _finishedOnBoarding =
        _preferences.getBool(Constants.FINISHED_ON_BOARDING) ?? false;

    return _finishedOnBoarding;
  }

  storeUserToken(String token) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(Constants.TOKEN, token);
  }

  storeUser(String user) async {
    _preferences = await SharedPreferences.getInstance();
    await _preferences.setString(Constants.USER, user);
  }

  Future<User> getUser() async {
    User user;
    _preferences = await SharedPreferences.getInstance();
    String userPref = _preferences.getString(Constants.USER);
    if (userPref != null) {
      Map userMap = jsonDecode(_preferences.getString(Constants.USER));
      user = User.fromJson(userMap);
    }

    return user;
  }

  Future<String> getToken() async {
    _preferences = await SharedPreferences.getInstance();
    String token = _preferences.getString(Constants.TOKEN);
    return token;
  }

//  clear() async {
//    _preferences = await SharedPreferences.getInstance();
//    await _preferences.clear();
//  }
}
