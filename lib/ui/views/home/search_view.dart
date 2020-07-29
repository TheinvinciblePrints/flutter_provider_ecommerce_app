import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 35,
          padding: EdgeInsets.only(left: 10, bottom: 3, right: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              )),
          child: TextField(
            style: TextStyle(
              fontSize: 17,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 15),
              width: 75,
              height: 30,
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
