import 'package:ecommerceapp/core/services/form_controller.dart';
import 'package:ecommerceapp/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpHeader extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  SignUpHeader(
      {@required this.emailController,
      @required this.passwordController,
      @required this.confirmPasswordController});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FormController>(context);
    return Column(
      children: <Widget>[
        SignUpEmailTextField(bloc, emailController),
        SignUpPasswordTextField(bloc, passwordController),
        SignUpConfirmPasswordTextField(bloc, confirmPasswordController),
      ],
    );
  }
}

class SignUpEmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final FormController bloc;
  final FocusNode focusNode = FocusNode();

  SignUpEmailTextField(this.bloc, this.emailController);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: TextFormField(
            autofocus: false,
            controller: emailController,
            onChanged: bloc.onEmailChanged,
            keyboardType: TextInputType.emailAddress,
            style: inputTextStyle,
            decoration: InputDecoration(
              labelText: "Email",
              errorText: snapshot.error,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SignUpPasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  final FormController bloc;

  SignUpPasswordTextField(this.bloc, this.passwordController);

  @override
  _SignUpPasswordTextFieldState createState() =>
      _SignUpPasswordTextFieldState();
}

class _SignUpPasswordTextFieldState extends State<SignUpPasswordTextField> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _showPassword = context.watch<FormController>().showPassword;

    return StreamBuilder<String>(
      stream: widget.bloc.password,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 10),
          child: Container(
            child: Stack(
              alignment: Alignment.centerRight,
              children: <Widget>[
                TextFormField(
                  autofocus: false,
                  obscureText: !_showPassword,
                  controller: widget.passwordController,
                  onChanged: widget.bloc.onPasswordChanged,
                  keyboardType: TextInputType.text,
                  style: inputTextStyle,
                  decoration: InputDecoration(
                    labelText: "Create Password",
                    errorText: snapshot.error,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () =>
                        context.read<FormController>().togglePassword(),
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SignUpConfirmPasswordTextField extends StatefulWidget {
  final TextEditingController confirmPasswordController;
  final FormController bloc;

  SignUpConfirmPasswordTextField(this.bloc, this.confirmPasswordController);

  @override
  _SignUpConfirmPasswordTextFieldState createState() =>
      _SignUpConfirmPasswordTextFieldState();
}

class _SignUpConfirmPasswordTextFieldState
    extends State<SignUpConfirmPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    final _showPassword = context.watch<FormController>().showConfirmPassword;

    return StreamBuilder<String>(
      stream: widget.bloc.confirmPassword,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 18),
          child: Container(
            child: Stack(
              alignment: Alignment.centerRight,
              children: <Widget>[
                TextFormField(
                  autofocus: false,
                  obscureText: !_showPassword,
                  controller: widget.confirmPasswordController,
                  onChanged: widget.bloc.onRetypePasswordChanged,
                  keyboardType: TextInputType.text,
                  style: inputTextStyle,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    errorText: snapshot.error,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () =>
                        context.read<FormController>().toggleConfirmPassword(),
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
