import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPageOne extends StatelessWidget {
  final String assetName = Assets.pageOneSvg;

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
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image(
                      image: AssetImage(Assets.iconSplash),
                      width: 180.0,
                      height: 65.0,
                    ),
                  ],
                ),
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
                    _bodyContent(
                        'Enjoy our massive discounts!', Assets.iconDiscount),
                    _bodyContent('Freebies voucher codes!', Assets.iconLoyalty),
                    _bodyContent(
                        'Awesome slashed prices!', Assets.iconPriceCut),
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
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10, left: 20),
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
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(bottom: 40, right: 40),
      child: Image(
        image: AssetImage(Assets.pageOneImage),
        width: 103.0,
        height: 176.0,
      ),
    );
  }
}
