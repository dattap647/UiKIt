import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TADashboardScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TAForgotPassword.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TASignupScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class TASigninScreen extends StatefulWidget {
  static String tag = '/TASigninScreen';

  @override
  TASigninScreenState createState() => TASigninScreenState();
}

class TASigninScreenState extends State<TASigninScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Sign In", center: true, elevation: 0, color: context.scaffoldBackgroundColor,showBack: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            taCachedImage(ta_signin, height: 300).center(),
            16.height,
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    controller: emailController,
                    decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Email"),
                  ),
                  8.height,
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    controller: passWordController,
                    decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Password"),
                  ),
                  8.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        TAForgotPassword().launch(context);
                      },
                      child: Text('Forgot Password?', style: boldTextStyle(size: 14, color: TAColorPrimary)),
                    ),
                  ),
                ],
              ),
            ),
            16.height,
            AppButton(
              width: context.width(),
              text: "Sign In",
              textStyle: primaryTextStyle(color: Colors.white),
              color: TAColorPrimary,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  TADashboardScreen().launch(context, isNewTask: true);
                }
              },
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: secondaryTextStyle(size: 12)),
                0.width,
                TextButton(
                  onPressed: () {
                    TASignupScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                  },
                  child: Text('Sign up', style: boldTextStyle(size: 14, color: TAColorPrimary)),
                )
              ],
            ),
            16.height,
          ],
        ),
      ),
    );
  }
}
