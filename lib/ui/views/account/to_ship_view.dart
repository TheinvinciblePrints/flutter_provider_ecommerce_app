import 'package:flutter/material.dart';

class ToShipView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 55),
          child: Center(
            child: Text('To Ship'),
          ),
        ),
      ),
    );
  }
}
