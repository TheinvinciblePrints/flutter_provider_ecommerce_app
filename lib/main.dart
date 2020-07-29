import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/provider_setup.dart';
import 'package:ecommerceapp/ui/router.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: primaryColor,
          elevation: 0,
        ),
        fontFamily: 'Rubik-Regular',
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
      navigatorKey: Provider.of<NavigationService>(context).navigatorKey,
      home: SplashView(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
