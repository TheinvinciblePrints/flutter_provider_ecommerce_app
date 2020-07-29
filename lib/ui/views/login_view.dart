import 'package:ecommerceapp/core/enums/view_states.dart';
import 'package:ecommerceapp/core/services/authentication_service.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/auth_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/widgets/base_widget.dart';
import 'package:ecommerceapp/ui/widgets/custom_toast.dart';
import 'package:ecommerceapp/ui/widgets/form_loader.dart';
import 'package:ecommerceapp/ui/widgets/login_footer.dart';
import 'package:ecommerceapp/ui/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _email;
  TextEditingController _password;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    var authService = context.watch<AuthenticationService>();
    var storageService = context.watch<LocalStorageService>();
    var navigationService = context.watch<NavigationService>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: primaryColor,
      appBar: AppBar(),
      body: BaseWidget<AuthViewModel>(
        model: AuthViewModel(
            authenticationService: Provider.of(context),
            storageService: context.watch<LocalStorageService>(),
            navigationService: context.watch<NavigationService>()),
        builder: (context, model, child) => Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      child: Image(
                        image: AssetImage(Assets.iconSplash),
                        width: 151,
                        height: 52,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, right: 16, left: 16),
                      child: _loginFormBody(model),
                    ),
                  ),
                )
              ],
            ),
            _getUiBody(model, navigationService),
          ],
        ),
      ),
    );
  }

  _getUiBody(AuthViewModel model, NavigationService navigationService) {
    switch (model.state) {
      case ViewState.Busy:
        return FormLoader();
        break;
      case ViewState.Error:
        return CustomToast.showToast(model.error);
        break;
      default:
        return Container();
    }
  }

  _loginFormBody(AuthViewModel model) {
    return Form(
      child: ListView(
        children: <Widget>[
          LoginHeader(
            emailController: _email,
            passwordController: _password,
          ),
          LoginFooter(
            loginViewModel: model,
            emailController: _email,
            passwordController: _password,
          ),
        ],
      ),
    );
  }

//  Future<bool>_showProgressDialog(NavigationService navigator) async {
//    return (showDialog(
//      context: navigator.navigatorKey.currentState.overlay.context,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text(
//            'Are you sure you want to logout?',
//            style: TextStyle(fontSize: 16, color: Colors.black),
//          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text(
//                'Cancel',
//                style: TextStyle(
//                    fontSize: 14,
//                    color: HexColor.hexToColor(AppColors.primaryColor)),
//              ),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//            FlatButton(
//              child: Text(
//                'Yes',
//                style: TextStyle(
//                    fontSize: 14,
//                    color: HexColor.hexToColor(AppColors.primaryColor)),
//              ),
//              onPressed: () async {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    )) : false;
//  }

  Future<bool> _showProgressDialog() async {
    final _context = Provider.of<NavigationService>(context)
        .navigatorKey
        .currentState
        .overlay
        .context;
    return showDialog(
          context: _context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
          ),
        ) ??
        false;
  }

  void _displaySnackBar() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Logging In...'),
            CircularProgressIndicator(),
          ],
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
