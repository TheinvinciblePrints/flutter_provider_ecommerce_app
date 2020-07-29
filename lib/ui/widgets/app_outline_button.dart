import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton(
      {@required this.buttonText,
      @required this.buttonWidth,
      @required this.borderSideColor,
      @required this.fontFamily,
      @required this.buttonTextColor,
      @required this.onPressed});

  final GestureTapCallback onPressed;
  final Color borderSideColor;
  final Color buttonTextColor;
  final String buttonText;
  final String fontFamily;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: buttonWidth,
      height: 40,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Text(
          buttonText,
          maxLines: 1,
          style: TextStyle(
            color: buttonTextColor,
            fontFamily: fontFamily,
            fontSize: 16,
          ),
        ),
      ),
      onPressed: onPressed,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderSideColor),
      ),
    );
  }
}
