import 'package:flutter/material.dart';

class AddressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 45),
          child: Center(
            child: Text('Address'),
          ),
        ),
      ),
    );
  }
}
