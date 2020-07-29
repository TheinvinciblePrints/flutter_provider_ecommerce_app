import 'package:ecommerceapp/core/enums/auth_states.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/viewmodels/onboarding_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/views/auth_view.dart';
import 'package:ecommerceapp/ui/views/landing_view.dart';
import 'package:ecommerceapp/ui/widgets/base_widget.dart';
import 'package:ecommerceapp/ui/widgets/onboarding_page_one.dart';
import 'package:ecommerceapp/ui/widgets/onboarding_page_three.dart';
import 'package:ecommerceapp/ui/widgets/onboarding_page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:provider/provider.dart';

final _currentPageNotifier = ValueNotifier<int>(0);

final List<Widget> _pages = <Widget>[
  OnBoardingPageOne(),
  OnBoardingPageTwo(),
  OnBoardingPageThree(),
];

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  void initState() {
//    Provider.of<AuthViewModel>(context, listen: false).initAuthViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<OnBoardingViewModel>(
      model: OnBoardingViewModel(
          storageService: context.watch<LocalStorageService>()),
      onModelReady: (model) => model.getAppState(),
      builder: (context, model, child) {
        switch (model.status) {
          case AuthStatus.Uninitialized:
            return OnBoardingViewBody();
          case AuthStatus.OnBoardingFinished:
          case AuthStatus.Unauthenticated:
            return AuthView();
          case AuthStatus.Authenticated:
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                statusBarColor: primaryColor,
                statusBarIconBrightness: Brightness.light));
            return LandingView();
          default:
            return OnBoardingViewBody();
        }
      },
    );
  }
}

class OnBoardingViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: <Widget>[
          PageView(
            children: _pages,
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildCircleIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleIndicator() {
    return CirclePageIndicator(
      selectedDotColor: Colors.white,
      dotColor: Colors.white38,
      selectedSize: 8,
      size: 6.5,
      itemCount: _pages.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }
}
