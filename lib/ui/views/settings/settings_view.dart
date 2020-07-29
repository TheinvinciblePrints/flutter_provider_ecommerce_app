import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/services/authentication_service.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/auth_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/ui_spacing_helper.dart';
import 'package:ecommerceapp/ui/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  var navigationService;
  final double menuItemPadding = 7;

  @override
  Widget build(BuildContext context) {
    navigationService = context.watch<NavigationService>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 45),
          child: Center(
            child: Text('Settings'),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 5, right: 15, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _sectionHeader('My Account'),
                    _menuItems('My Profile', this.onProfileClick,
                        menuItemPadding, context),
                    _menuItems('My Addresses', this.onAddressClick,
                        menuItemPadding, context),
                    Divider(
                      thickness: 1.3,
                      height: 15,
                    ),
                    _sectionHeader('Setting'),
                    _menuItems('Language', () {}, menuItemPadding, context),
                    _menuItems('Currency', () {}, menuItemPadding, context),
                    _menuItems('Notification Setting', () {}, menuItemPadding,
                        context),
                    Divider(
                      thickness: 1.3,
                      height: 15,
                    ),
                    _sectionHeader('Help Center'),
                    _menuItems('About', () {}, menuItemPadding, context),
                    _menuItems(
                        'Walau Policies', () {}, menuItemPadding, context),
                    UIDimensions.vertical_dimen6,
                    Divider(
                      thickness: 1.3,
                      height: 15,
                    ),
                    UIDimensions.vertical_dimen6,
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Clear Search History',
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _showLogoutDialog(navigationService),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
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

  Widget _sectionHeader(String text) {
    return Container(
      margin: EdgeInsets.only(
          top: UIDimensions.dimen18, bottom: UIDimensions.dimen6),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, color: primaryColor, fontFamily: 'Rubik-Bold'),
      ),
    );
  }

  Widget _menuItems(String leading, Function onClickAction, double marginBottom,
      BuildContext context) {
    return InkWell(
      onTap: () => onClickAction(),
      child: Container(
        padding: EdgeInsets.only(top: marginBottom, bottom: marginBottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              leading,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.arrow_forward_ios,
                color: greenColor,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onProfileClick() {
    navigationService.navigateTo(RoutePaths.AccountProfile);
  }

  void onAddressClick() {
    navigationService.navigateTo(RoutePaths.AccountAddress);
  }

  _showLogoutDialog(NavigationService navigationService) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure you want to logout?',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 15, color: primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            BaseWidget<AuthViewModel>(
              model: AuthViewModel(
                authenticationService: context.watch<AuthenticationService>(),
                navigationService: navigationService,
                storageService: context.watch<LocalStorageService>(),
              ),
              builder: (_context, model, child) => FlatButton(
                child: Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                  ),
                ),
                onPressed: () async {
                  await model.logout();
                  navigationService.navigateWithoutBack(RoutePaths.Auth);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
