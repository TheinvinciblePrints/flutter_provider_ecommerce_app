import 'dart:async';

import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashView extends StatefulWidget {
  @override
  State createState() {
    return SplashViewState();
  }
}

class SplashViewState extends State<SplashView> {
  AssetImage _assetImage = AssetImage(Assets.iconSplash);

  startTimeout() {
    return Timer(Duration(seconds: 2), route);
  }

  Future route() async =>
      Navigator.pushReplacementNamed(context, RoutePaths.OnBoarding);

//  Future hasFinishedOnBoarding() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    bool finishedOnBoarding =
//        (prefs.getBool(Constants.FINISHED_ON_BOARDING) ?? false);
//
//    if (finishedOnBoarding) {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      String token = prefs.getString(Constants.TOKEN);
//      if (token != null) {
//        pushReplacement(context, new LandingView());
//      } else {
//        pushReplacement(context, new AuthView());
//      }
//    } else {
//      pushReplacement(context, new OnBoardingView());
//    }
//  }

  /// Did Change Dependencies
  @override
  void didChangeDependencies() {
    precacheImage(_assetImage, context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: accentColor,
          statusBarIconBrightness: Brightness.dark),
    );
    return SplashViewBody();
  }
}

class SplashViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: accentColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(Assets.iconSplash),
              width: 180.0,
              height: 65.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
              child: Text(
                'Copyright © 2019 i-Serve Online Mall Sdn. Bhd.\nAll rights reserved.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: splashTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
