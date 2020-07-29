import 'package:ecommerceapp/core/models/user.dart';
import 'package:ecommerceapp/core/services/local_storage.dart';

class LocalStorageService {
  final LocalStorage _storage;

  LocalStorageService({LocalStorage storage}) : _storage = storage;

  Future<bool> setFinishedOnBoarding(bool value) async {
    var _finishedOnBoarding = await _storage.setFinishedOnBoarding(value);
    return _finishedOnBoarding;
  }

  Future<bool> getFinishedOnBoarding() async {
    var _finishedOnBoarding = await _storage.getFinishedOnBoarding();
    return _finishedOnBoarding;
  }

  Future<bool> setToken(String value) async {
    var _token = await _storage.storeUserToken(value);
    return _token;
  }

  Future<String> getToken() async {
    var _token = _storage.getToken();
    return _token;
  }

  Future<bool> setUser(String user) async {
    var _token = await _storage.storeUser(user);
    return _token;
  }

  Future<User> getUser() async {
    var _user = _storage.getUser();
    return _user;
  }

  logOut() async {
    setFinishedOnBoarding(true);
    setUser(null);
  }
}
