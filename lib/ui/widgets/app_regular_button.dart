import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRegularButton extends StatelessWidget {
  const AppRegularButton(
      {@required this.buttonText,
      @required this.buttonWidth,
      @required this.buttonColor,
      @required this.fontFamily,
      @required this.buttonTextColor,
      @required this.onPressed});

  final GestureTapCallback onPressed;
  final Color buttonColor;
  final Color buttonTextColor;
  final String fontFamily;
  final String buttonText;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: buttonWidth,
      height: 40,
      color: buttonColor,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          buttonText,
          maxLines: 1,
          style: TextStyle(
              color: buttonTextColor, fontFamily: 'Rubik-Medium', fontSize: 16),
        ),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
