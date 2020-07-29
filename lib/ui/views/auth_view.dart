import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/widgets/app_outline_button.dart';
import 'package:ecommerceapp/ui/widgets/app_regular_button.dart';
import 'package:ecommerceapp/ui/widgets/terms_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light));
    print("authView: build");
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage(Assets.iconAuthImage),
                  ),
                  Positioned(
                    top: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 80),
                          child: Image(
                            image: AssetImage(Assets.iconAuthBag),
                            width: 55.0,
                            height: 54.0,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                right: 10,
                              ),
                              child: Image(
                                image: AssetImage(Assets.iconAuthLeftImage),
                                width: 106.0,
                                height: 113.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              child: Image(
                                image: AssetImage(Assets.iconAuthRightImage),
                                width: 64.0,
                                height: 107.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  color: Colors.white),
              height: 202,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 24, right: 16, left: 16),
                child: Column(
                  children: <Widget>[
                    AppRegularButton(
                      buttonWidth: 343,
                      buttonTextColor: Colors.white,
                      buttonText: 'Login',
                      buttonColor: primaryColor,
                      fontFamily: 'Rubik-Regular',
                      onPressed: () {
                        Navigator.of(context).pushNamed(RoutePaths.Login);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppOutlineButton(
                      buttonText: 'Create An Account',
                      buttonTextColor: primaryColor,
                      buttonWidth: 343,
                      borderSideColor: primaryColor,
                      fontFamily: 'Rubik-Regular',
                      onPressed: () {
                        Navigator.of(context).pushNamed(RoutePaths.Register);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TermsWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
