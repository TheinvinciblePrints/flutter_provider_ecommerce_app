import 'package:flutter/material.dart';

class ToPayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 55),
          child: Center(
            child: Text('To Pay'),
          ),
        ),
      ),
    );
  }
}
