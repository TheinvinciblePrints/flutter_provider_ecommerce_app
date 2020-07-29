import 'package:ecommerceapp/ui/views/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('My Cart'),
          ),
        ),
        body: Center(
          child: Text('Cart View'),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    var bottomProvider = context.read<BottomNavigationBarProvider>();
    bottomProvider.currentIndex = 0;
  }
}
