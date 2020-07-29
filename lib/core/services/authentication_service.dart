import 'dart:async';

import 'package:ecommerceapp/core/models/user.dart';
import 'package:ecommerceapp/core/services/api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({Api api}) : _api = api;

  Future<User> login(String email, String password) async {
    var fetchedUser = await _api.getUserProfile(1);

    if (fetchedUser != null) {
      return fetchedUser;
    } else {
      return null;
    }
  }
}
