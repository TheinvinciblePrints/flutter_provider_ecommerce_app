import 'package:ecommerceapp/core/constants/route_paths.dart';
import 'package:ecommerceapp/core/services/form_controller.dart';
import 'package:ecommerceapp/core/services/navigator_service.dart';
import 'package:ecommerceapp/core/viewmodels/auth_viewmodel.dart';
import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/ui_spacing_helper.dart';
import 'package:ecommerceapp/ui/widgets/app_outline_button.dart';
import 'package:ecommerceapp/ui/widgets/app_regular_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_toast.dart';
import 'package:ecommerceapp/ui/widgets/terms_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpFooter extends StatelessWidget {
  final AuthViewModel loginViewModel;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  SignUpFooter(
      {@required this.loginViewModel,
      @required this.emailController,
      @required this.passwordController,
      @required this.confirmPasswordController});

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: <Widget>[
        UIDimensions.vertical_dimen6,
        NextButton(loginViewModel, emailController, passwordController),
        UIDimensions.vertical_dimen16,
        LoginButton(),
        UIDimensions.vertical_dimen20,
        TermsWidget(),
        UIDimensions.vertical_dimen16,
      ],
    );
  }
}

class NextButton extends StatelessWidget {
  final AuthViewModel loginViewModel;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  NextButton(
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
          buttonText: 'Next',
          buttonColor: primaryColor,
          fontFamily: 'Rubik-Regular',
          onPressed: () {
            !snapshot.hasData
                ? CustomToast.showToast("Please fill in all details")
                : loginViewModel.login(
                    emailController.text, passwordController.text);
          },
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigationService navigationService = context.watch<NavigationService>();
    return AppOutlineButton(
      buttonText: 'Login',
      buttonTextColor: primaryColor,
      buttonWidth: 343,
      borderSideColor: primaryColor,
      fontFamily: 'Rubik-Regular',
      onPressed: () {
        navigationService.navigateTo(RoutePaths.Login);
      },
    );
  }
}
