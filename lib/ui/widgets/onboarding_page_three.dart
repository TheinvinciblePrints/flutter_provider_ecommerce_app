import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/onboarding_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/widgets/app_regular_button.dart';
import 'package:ecommerceapp/ui/widgets/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OnBoardingPageThree extends StatelessWidget {
  final String assetName = Assets.pageThreeSvg;
  final String assetWelcome = Assets.pageThreeVoucher;

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
                image: AssetImage(Assets.pageThreeBanner),
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
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Enter this voucher code to enjoy \nRM20 Off for your first purchase.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Image(
                        image: AssetImage(assetWelcome),
                      ),
                    ),
                  ],
                ),
              ),
              _bottomContent(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bottomContent(BuildContext _context) {
    var navigationService = _context.watch<NavigationService>();
    return BaseWidget<OnBoardingViewModel>(
      model: OnBoardingViewModel(
        storageService: _context.watch<LocalStorageService>(),
      ),
      builder: (_context, model, child) => Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 50),
        child: AppRegularButton(
          fontFamily: 'Rubik-Medium',
          buttonWidth: 256,
          buttonTextColor: primaryColor,
          buttonColor: Colors.white,
          buttonText: 'Get Started',
          onPressed: () async {
            model.setFinishedOnBoarding(true);
            navigationService.navigateWithoutBack(RoutePaths.Auth);
          },
        ),
      ),
    );
  }
}
