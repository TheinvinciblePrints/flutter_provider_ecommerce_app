import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'By creating an account, you agree to Walau’s',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontFamily: 'Rubik-Regular'),
        ),
        RichText(
          text: TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Privacy Policy ',
                style: TextStyle(fontFamily: 'Rubik-Medium'),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print('privacy click'),
              ),
              TextSpan(text: '& '),
              TextSpan(
                text: 'Terms of Use',
                style: TextStyle(fontFamily: 'Rubik-Medium'),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => print('terms click'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
