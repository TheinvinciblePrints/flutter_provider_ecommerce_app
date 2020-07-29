import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback action;
  final String message;

  ErrorView({@required this.action, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          message,
          style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            child: Icon(
              Icons.refresh,
              size: 30,
              color: Colors.white,
            ),
            onPressed: action,
          ),
        ),
      ],
    );
  }
}
