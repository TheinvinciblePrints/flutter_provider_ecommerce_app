import 'package:flutter/material.dart';

class MyRatingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 45),
          child: Center(
            child: Text('My Rating'),
          ),
        ),
      ),
    );
  }
}
