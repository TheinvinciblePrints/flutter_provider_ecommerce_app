import 'package:ecommerceapp/core/enums/view_states.dart';
import 'package:ecommerceapp/core/services/local_storage_service.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/auth_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/assets.dart';
import 'package:ecommerceapp/ui/widgets/base_widget.dart';
import 'package:ecommerceapp/ui/widgets/custom_toast.dart';
import 'package:ecommerceapp/ui/widgets/form_loader.dart';
import 'package:ecommerceapp/ui/widgets/signup_footer.dart';
import 'package:ecommerceapp/ui/widgets/signup_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController _email;
  TextEditingController _password;
  TextEditingController _confirmPassword;

//  GlobalKey _scaffoldKey = GlobalKey();
  final _scaffoldKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
    _confirmPassword = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: primaryColor,
        child: Column(
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
              flex: 4,
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
                  child: BaseWidget<AuthViewModel>(
                    model: AuthViewModel(
                        authenticationService: Provider.of(context),
                        storageService: context.watch<LocalStorageService>(),
                        navigationService: context.watch<NavigationService>()),
                    builder: (_context, model, child) => _getUiBody(model),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getUiBody(AuthViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return FormLoader();
        break;
      case ViewState.Idle:
        return _signUpFormBody(model);
        break;
      case ViewState.Error:
        return CustomToast.showToast(model.error);
        break;
      default:
        return _signUpFormBody(model);
    }
  }

  void _showAlertDialog() {
    final _context = Provider.of<NavigationService>(context)
        .navigatorKey
        .currentState
        .overlay
        .context;
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // This closes the dialog. `context` means the BuildContext, which is
        // available by default inside of a State object. If you are working
        // with an AlertDialog in a StatelessWidget, then you would need to
        // pass a reference to the BuildContext.
        Navigator.pop(_context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Dialog title"),
      content: Text("This is a Flutter AlertDialog."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: _context,
      builder: (BuildContext __) {
        return alert;
      },
    );
  }

  _signUpFormBody(AuthViewModel model) {
    return ListView(
      children: <Widget>[
        SignUpHeader(
          emailController: _email,
          passwordController: _password,
          confirmPasswordController: _confirmPassword,
        ),
        SignUpFooter(
          loginViewModel: model,
          emailController: _email,
          passwordController: _password,
          confirmPasswordController: _confirmPassword,
        ),
      ],
    );
  }

  void _showDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Builder(builder: (BuildContext context) {
          return MaterialApp(
            home: AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Hello from flutter'),
              content: Text('That is the transparent dialog'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
