import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/views/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var navigationService = context.watch<NavigationService>();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10),
              color: primaryColor,
              height: 56,
              width: MediaQuery.of(context).size.width,
              child: AppBar(
                leading: IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () =>
                      navigationService.navigateTo(RoutePaths.Search),
                ),
                actions: <Widget>[
                  Icon(
                    Icons.notifications,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15, left: 15),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      // Circle shape
                      shape: BoxShape.circle,
                      color: Colors.white,
                      // The border you want
                      border: Border.all(
                        width: 1,
                        color: yellowColor,
                      ),
                    ),
                    child: Material(
                      shape: CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      color: Colors.transparent,
                      child: Ink.image(
                        image: AssetImage(Assets.iconProfileDefault),
                        width: 25,
                        height: 25,
                        child: InkWell(
                          onTap: () {
                            var bottomProvider =
                                context.read<BottomNavigationBarProvider>();
                            bottomProvider.currentIndex = 3;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              'Are you sure you want to close this application?',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
