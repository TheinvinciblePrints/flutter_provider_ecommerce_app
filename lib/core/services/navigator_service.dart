import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateWithoutBack(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
        routeName, ModalRoute.withName(RoutePaths.Auth));
  }

  goBack() {
    return navigatorKey.currentState.pop();
  }
}
