import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/ui/views/account/address_view.dart';
import 'package:ecommerceapp/ui/views/account/completed_view.dart';
import 'package:ecommerceapp/ui/views/account/help_center_view.dart';
import 'package:ecommerceapp/ui/views/account/profile_view.dart';
import 'package:ecommerceapp/ui/views/account/rating_view.dart';
import 'package:ecommerceapp/ui/views/account/recently_viewed_view.dart';
import 'package:ecommerceapp/ui/views/account/to_pay_view.dart';
import 'package:ecommerceapp/ui/views/account/to_receive_view.dart';
import 'package:ecommerceapp/ui/views/account/to_ship_view.dart';
import 'package:ecommerceapp/ui/views/account/wishlist_view.dart';
import 'package:ecommerceapp/ui/views/auth_view.dart';
import 'package:ecommerceapp/ui/views/forgot_password_view.dart';
import 'package:ecommerceapp/ui/views/home/search_view.dart';
import 'package:ecommerceapp/ui/views/landing_view.dart';
import 'package:ecommerceapp/ui/views/login_view.dart';
import 'package:ecommerceapp/ui/views/onboarding_view.dart';
import 'package:ecommerceapp/ui/views/settings/settings_view.dart';
import 'package:ecommerceapp/ui/views/signup_view.dart';
import 'package:ecommerceapp/ui/views/splash_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return MaterialPageRoute(builder: (context) => SplashView());
      case RoutePaths.OnBoarding:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.ForgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case RoutePaths.Register:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case RoutePaths.Auth:
        return MaterialPageRoute(builder: (_) => AuthView());
      case RoutePaths.Landing:
        return MaterialPageRoute(builder: (_) => LandingView());
      case RoutePaths.AccountProfile:
        return MaterialPageRoute(builder: (_) => ProfileView());
      case RoutePaths.Search:
        return MaterialPageRoute(builder: (_) => SearchView());
      case RoutePaths.Settings:
        return MaterialPageRoute(builder: (_) => SettingsView());
      case RoutePaths.AccountAddress:
        return MaterialPageRoute(builder: (_) => AddressView());
      case RoutePaths.WishList:
        return MaterialPageRoute(builder: (_) => WishListView());
      case RoutePaths.Rating:
        return MaterialPageRoute(builder: (_) => MyRatingView());
      case RoutePaths.RecentlyViewed:
        return MaterialPageRoute(builder: (_) => RecentlyViewedView());
      case RoutePaths.HelpCenter:
        return MaterialPageRoute(builder: (_) => HelpCenterView());
      case RoutePaths.ToPay:
        return MaterialPageRoute(builder: (_) => ToPayView());
      case RoutePaths.ToShip:
        return MaterialPageRoute(builder: (_) => ToShipView());
      case RoutePaths.ToReceive:
        return MaterialPageRoute(builder: (_) => ToReceiveView());
      case RoutePaths.Completed:
        return MaterialPageRoute(builder: (_) => CompletedView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined yet'),
                  ),
                ));
    }
  }
}
