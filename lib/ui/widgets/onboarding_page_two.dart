import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPageTwo extends StatefulWidget {
  @override
  _OnBoardingPageTwoState createState() => _OnBoardingPageTwoState();
}

class _OnBoardingPageTwoState extends State<OnBoardingPageTwo> {
  final String assetName = Assets.pageTwoSvg;

  /// Did Change Dependencies
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(Assets.iconSplash), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            SvgPicture.asset(
              assetName,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Positioned(
              top: 40,
              left: 40,
              child: Image(
                image: AssetImage(Assets.pageTwoBanner),
                width: 300.0,
                height: 158.0,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    _bodyContent('Exclusive offers', Assets.iconVip),
                    _bodyContent('Newest Arrivals', Assets.iconNewLabel),
                    _bodyContent('Updated Trends', Assets.iconStock),
                  ],
                ),
              ),
              _bottomContent(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bodyContent(String text, String icon) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Image(
              image: AssetImage(icon),
              width: 36.0,
              height: 40.0,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontFamily: 'Rubik-Medium', fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(bottom: 40, left: 30),
      child: Image(
        image: AssetImage(Assets.pageTwoImage),
        width: 170.0,
        height: 175.0,
      ),
    );
  }
}
