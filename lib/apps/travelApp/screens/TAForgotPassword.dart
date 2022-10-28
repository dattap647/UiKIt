import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TASigninScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class TAForgotPassword extends StatefulWidget {
  static String tag = '/TAForgotPassword';

  @override
  TAForgotPasswordState createState() => TAForgotPasswordState();
}

class TAForgotPasswordState extends State<TAForgotPassword> {
  TextEditingController emailCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Forgot Password',center: true, backWidget: taBackButton(context, iconColor: context.iconColor), elevation: 0, color: context.scaffoldBackgroundColor),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: context.height(),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: context.statusBarHeight, right: 16, left: 16, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  taCachedImage(ta_forgotpass, height: 300),
                  8.height,
                  Text('Please enter your email address or phone \nnumber to reset your password', style: secondaryTextStyle(), textAlign: TextAlign.center),
                  24.height,
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    controller: emailCont,
                    decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Email"),
                  ),
                  24.height,
                  AppButton(
                    color: TAColorPrimary,
                    width: context.width(),
                    text: "Send new password",
                    textStyle: primaryTextStyle(color: Colors.white),
                    onTap: () {
                      TASigninScreen().launch(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
