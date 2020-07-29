import 'package:ecommerceapp/ui/shared/app_colors.dart';
import 'package:ecommerceapp/ui/shared/text_styles.dart';
import 'package:ecommerceapp/ui/shared/ui_spacing_helper.dart';
import 'package:ecommerceapp/ui/widgets/app_regular_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 25),
          child: Text('Recover Password'),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 22, bottom: 6, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: false,
              keyboardType: TextInputType.emailAddress,
              style: inputTextStyle,
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: "Email",
                suffixIcon: IconButton(
                  onPressed: () {
                    textEditingController.clear();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            UIDimensions.vertical_dimen18,
            AppRegularButton(
              buttonWidth: 337,
              buttonTextColor: Colors.white,
              buttonText: 'Reset Password',
              buttonColor: primaryColor,
              fontFamily: 'Rubik-Regular',
              onPressed: () {},
            ),
            UIDimensions.vertical_dimen24,
            Text(
                'If you have forgotten your password, enter your email address in the field and click Reset Password. You will receive a password reset link.'),
          ],
        ),
      ),
    );
  }
}
