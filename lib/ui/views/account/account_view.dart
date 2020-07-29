import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/onboarding_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/shared/ui_spacing_helper.dart';
import 'package:ecommerceapp/ui/views/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  var navigationService;

  @override
  Widget build(BuildContext context) {
    navigationService = context.watch<NavigationService>();
//    var onboarding = context.watch<OnBoardingViewModel>();
    final name = context.select((OnBoardingViewModel p) => p.user.name);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 45),
            child: Center(
              child: Text('My Account'),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  navigationService.navigateTo(RoutePaths.Settings);
                },
                child: Icon(Icons.settings),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 5, right: 15, left: 15),
          child: ListView(
            children: <Widget>[
              _headerContent(name, navigationService),
              Divider(
                thickness: 1.3,
              ),
              UIDimensions.vertical_dimen12,
              Text(
                'My Orders',
                style: TextStyle(color: primaryColor, fontSize: 16),
              ),
              UIDimensions.vertical_dimen12,
              _myOrderContent(navigationService),
              UIDimensions.vertical_dimen26,
              _menuContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerContent(String name, NavigationService navigationService) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Material(
              elevation: 4,
              shape: CircleBorder(),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: Ink.image(
                image: AssetImage(Assets.iconProfileDefault),
                fit: BoxFit.fill,
                width: 65,
                height: 80,
                child: InkWell(
                  onTap: () {
                    navigationService.navigateTo(RoutePaths.AccountProfile);
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$name',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'mike.adams@gmail.com',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 8),
              width: 38,
              child: Text(
                'Edit',
                style: TextStyle(color: greenColor, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _myOrderContent(NavigationService navigationService) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _myOrderItems(
              asset: Assets.iconOrderConfirmed,
              text: 'To Pay',
              navigator: navigationService,
              routeName: RoutePaths.ToPay),
          _myOrderItems(
              asset: Assets.iconOrderShipped,
              text: 'To Ship',
              navigator: navigationService,
              routeName: RoutePaths.ToShip),
          _myOrderItems(
              asset: Assets.iconToReceive,
              text: 'To Receive',
              navigator: navigationService,
              routeName: RoutePaths.ToReceive),
          _myOrderItems(
              asset: Assets.iconPackage,
              text: 'Completed',
              navigator: navigationService,
              routeName: RoutePaths.Completed),
        ],
      ),
    );
  }

  Widget _menuContent() {
    return Column(
      children: <Widget>[
        _menuItems(
            asset: Icons.favorite,
            text: 'My Wishlist',
            navigator: navigationService,
            route: RoutePaths.WishList),
        Divider(
          height: 30,
        ),
        _menuItems(
            asset: Icons.star,
            text: 'My Rating',
            navigator: navigationService,
            route: RoutePaths.Rating),
        Divider(
          height: 30,
        ),
        _menuItems(
            asset: Icons.history,
            text: 'Recently Viewed',
            navigator: navigationService,
            route: RoutePaths.RecentlyViewed),
        Divider(
          height: 30,
        ),
        _menuItems(
            asset: Icons.person,
            text: 'Account Setting',
            navigator: navigationService,
            route: RoutePaths.Settings),
        Divider(
          height: 30,
        ),
        _menuItems(
            asset: Icons.help,
            text: 'Help Center',
            navigator: navigationService,
            route: RoutePaths.HelpCenter),
      ],
    );
  }

  Widget _menuItems(
      {@required IconData asset,
      @required String text,
      @required NavigationService navigator,
      @required String route}) {
    return InkWell(
      onTap: () {
        navigator.navigateTo(route);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                asset,
                size: 16,
                color: primaryColor,
              ),
              UIDimensions.horizontal_dimen6,
              Text(
                text,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: greenColor,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _myOrderItems(
      {@required String asset,
      @required String text,
      @required NavigationService navigator,
      @required String routeName}) {
    return InkWell(
      onTap: () => navigator.navigateTo(routeName),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            ImageIcon(
              AssetImage(asset),
              color: greenColor,
            ),
            UIDimensions.vertical_dimen6,
            Text(
              text,
              style: TextStyle(
                color: greenColor,
                fontSize: 12.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    var bottomProvider = context.read<BottomNavigationBarProvider>();
    bottomProvider.currentIndex = 0;
  }
}
