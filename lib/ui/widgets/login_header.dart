import 'package:ecommerceapp/core/services/form_controller.dart';
import 'package:ecommerceapp/ui/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginHeader(
      {@required this.emailController, @required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<FormController>(context);
    return Column(
      children: <Widget>[
        LoginEmailTextField(bloc, emailController),
        LoginPasswordTextField(bloc, passwordController),
      ],
    );
  }
}

class LoginEmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  final FormController bloc;

  LoginEmailTextField(this.bloc, this.emailController);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(top: 22, bottom: 10),
          child: TextFormField(
            autofocus: false,
            controller: emailController,
            onChanged: bloc.onEmailChanged,
            keyboardType: TextInputType.emailAddress,
            validator: (val) {
              return val.isEmpty ? "Please enter email address" : null;
            },
            style: inputTextStyle,
            decoration: InputDecoration(
                labelText: "Email",
                errorText: snapshot.error,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        );
      },
    );
  }
}

class LoginPasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  final FormController bloc;

  LoginPasswordTextField(this.bloc, this.passwordController);

  @override
  _LoginPasswordTextFieldState createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _showPassword = context.watch<FormController>().showPassword;
    return StreamBuilder<String>(
      stream: widget.bloc.password,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: TextFormField(
            autofocus: false,
            focusNode: _focusNode,
            controller: widget.passwordController,
            onChanged: widget.bloc.onPasswordChanged,
            validator: (val) {
              return val.isEmpty ? "Please enter password" : null;
            },
            keyboardType: TextInputType.text,
            obscureText: !_showPassword,
            style: inputTextStyle,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<FormController>().togglePassword();
                  _focusNode.canRequestFocus = false;
                },
                icon: Icon(
                  _showPassword ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
              errorText: snapshot.error,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        );
      },
    );
  }
}
