import 'dart:async';

import 'package:ecommerceapp/ui/shared/validators.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class FormController with Validators, ChangeNotifier {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();

//  ValueNotifier<bool> _showPassword = ValueNotifier<bool>(false);
  bool _showPassword = false;
  bool _showConfirmPassword = false;

//  ValueNotifier<bool> get showPassword => _showPassword;
  bool get showPassword => _showPassword;

  bool get showConfirmPassword => _showConfirmPassword;

  /*------------------- Login Validation -----------------------*/

  //Set
  Function(String) get onEmailChanged => _emailController.sink.add;

  Function(String) get onPasswordChanged => _passwordController.sink.add;

  Function(String) get onRetypePasswordChanged =>
      _passwordConfirmController.sink.add;

  //Get
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<String> get confirmPassword => _passwordConfirmController.stream
          .transform(validatePassword)
          .doOnData((String c) {
        // If the password is accepted (after validation of the rules)
        // we need to ensure both password and retyped password match
        if (0 != _passwordController.value.compareTo(c)) {
          // If they do not match, add an error
          _passwordConfirmController.addError("Password does not match");
        }
      });

  Stream<bool> get loginValid =>
      Rx.combineLatest2(email, password, (email, password) => true);

  Stream<bool> get registerValid => Rx.combineLatest3(email, password,
      confirmPassword, (email, password, confirmPassword) => true);

  void togglePassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    _showConfirmPassword = !_showConfirmPassword;
    notifyListeners();
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _passwordConfirmController.close();
    super.dispose();
  }
}
