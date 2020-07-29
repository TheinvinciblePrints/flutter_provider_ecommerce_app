import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (emailValid) {
      sink.add(email);
    } else {
      sink.addError('Please enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password);
    } else {
      sink.addError('Please enter a valid password');
    }
  });

  final validateCode =
      StreamTransformer<String, String>.fromHandlers(handleData: (code, sink) {
    if (code.length >= 6) {
      sink.add(code);
    } else {
      sink.addError('Please enter a valid password');
    }
  });
}
