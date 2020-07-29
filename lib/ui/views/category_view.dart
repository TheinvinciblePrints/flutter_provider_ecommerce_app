import 'package:ecommerceapp/ui/views/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Categories'),
          ),
        ),
        body: Center(
          child: Text('Category View'),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    var bottomProvider = context.read<BottomNavigationBarProvider>();
    bottomProvider.currentIndex = 0;
  }
}
