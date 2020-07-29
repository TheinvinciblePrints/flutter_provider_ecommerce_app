import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/shared/ui_spacing_helper.dart';
import 'package:ecommerceapp/ui/widgets/app_regular_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var navigationService;

  @override
  Widget build(BuildContext context) {
    navigationService = context.watch<NavigationService>();
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 45),
          child: Center(
            child: Text('My Profile'),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 0, right: 15, left: 15),
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Material(
                          elevation: 4,
                          shape: CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child: Ink.image(
                            image: AssetImage(Assets.iconProfileDefault),
                            fit: BoxFit.fill,
                            width: 85,
                            height: 115,
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                          child: Text(
                            'Tap to Edit',
                            style: TextStyle(
                              fontSize: 12,
                              color: greyColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.3,
                      height: 20,
                    ),
                    _menuItems('Full Name', 'Mike Adams', () {}, 20, context),
                    _menuItems('Change Password', '', () {}, 0, context),
                    Divider(
                      thickness: 1.3,
                      height: 20,
                    ),
                    UIDimensions.vertical_dimen6,
                    _menuItems('Address', 'No.32 Jalan Asam Laska', () {}, 20,
                        context),
                    _menuItems('Phone', '(+60)1151191640', () {}, 20, context),
                    _menuItems('Email', 'emmanydeveloper@gmail.com', () {}, 20,
                        context),
                    _menuItems('Gender', 'No Set', () {}, 20, context),
                    _menuItems('Birthday', 'No Set', () {}, 20, context),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppRegularButton(
                buttonWidth: 345,
                buttonTextColor: Colors.white,
                buttonText: 'Save',
                buttonColor: greenColor,
                fontFamily: 'Rubik-Regular',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItems(String leading, String trailing, Function onClickAction,
      double marginBottom, BuildContext context) {
    return InkWell(
      onTap: () => onClickAction(),
      child: Container(
        margin: EdgeInsets.only(bottom: marginBottom),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              leading,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 120),
                  child: Text(
                    trailing,
                    style: TextStyle(color: unselectedTextColor, fontSize: 16),
                    softWrap: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: greenColor,
                    size: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onWishListClick() {
    navigationService.navigateTo(RoutePaths.AccountProfile);
  }

  void onAccountSettingClick() {
    navigationService.navigateTo(RoutePaths.Settings);
  }
}
