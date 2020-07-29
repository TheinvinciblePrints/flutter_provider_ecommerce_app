import 'package:flutter/material.dart';

class DialogService {
  //Function which shows Alert Dialog
  alertDialog(BuildContext context) {
    // This is the ok button
    Widget ok = FlatButton(
      child: Text("Okay"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // show the alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("I am Here!"),
          content: Text("I appeared because you pressed the button!"),
          actions: [
            ok,
          ],
          elevation: 5,
        );
      },
    );
  }
}
