import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/services/form_controller.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/auth_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/ui_spacing_helper.dart';
import 'package:ecommerceapp/ui/widgets/app_outline_button.dart';
import 'package:ecommerceapp/ui/widgets/app_regular_button.dart';
import 'package:ecommerceapp/ui/widgets/terms_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginFooter extends StatelessWidget {
  final AuthViewModel loginViewModel;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginFooter(
      {@required this.loginViewModel,
      @required this.emailController,
      @required this.passwordController});

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: <Widget>[
        UIDimensions.vertical_dimen6,
        ForgotPassword(),
        UIDimensions.vertical_dimen6,
        LoginButton(loginViewModel, emailController, passwordController),
        UIDimensions.vertical_dimen16,
        SignUpButton(),
        UIDimensions.vertical_dimen16,
        TermsWidget(),
        UIDimensions.vertical_dimen16,
      ],
    );
  }
}

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var navigationService = context.watch<NavigationService>();
    return Container(
      height: 18,
      margin: EdgeInsets.only(top: 8, bottom: 14),
      alignment: Alignment.topLeft,
      width: MediaQuery.of(context).size.width,
      child: RichText(
        text: TextSpan(
          text: 'Forgot Password?',
          style: TextStyle(color: Colors.black),
          recognizer: TapGestureRecognizer()
            ..onTap =
                () => navigationService.navigateTo(RoutePaths.ForgotPassword),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final AuthViewModel loginViewModel;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginButton(
      this.loginViewModel, this.emailController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FormController>(context);
    return StreamBuilder<bool>(
      stream: bloc.loginValid,
      builder: (_context, snapshot) {
        return AppRegularButton(
          buttonWidth: 337,
          buttonTextColor: Colors.white,
          buttonText: 'Login',
          buttonColor: primaryColor,
          fontFamily: 'Rubik-Regular',
          onPressed: () {
            !snapshot.hasData
                ? null
                : loginViewModel.login(
                    emailController.text, passwordController.text);
          },
        );
      },
    );
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppOutlineButton(
      buttonText: 'Create An Account',
      buttonTextColor: primaryColor,
      buttonWidth: 343,
      borderSideColor: primaryColor,
      fontFamily: 'Rubik-Regular',
      onPressed: () {
        Navigator.pushNamed(context, RoutePaths.Register);
      },
    );
  }
}
