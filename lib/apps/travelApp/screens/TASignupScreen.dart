import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/screens/TADashboardScreen.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class TASignupScreen extends StatefulWidget {
  static String tag = '/TASignupScreen';

  @override
  TASignupScreenState createState() => TASignupScreenState();
}

class TASignupScreenState extends State<TASignupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      appBar: appBarWidget("Sign Up", center: true, elevation: 0, color: context.scaffoldBackgroundColor, backWidget: taBackButton(context, iconColor: context.iconColor)),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                taCachedImage(ta_signup, height: 300),
                16.height,
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: userNameController,
                        textFieldType: TextFieldType.NAME,
                        decoration: TAInputDecoration(context, hintText: "Name", borderColor: context.dividerColor),
                      ),
                      8.height,
                      AppTextField(
                        controller: emailController,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: TAInputDecoration(context, hintText: "Email", borderColor: context.dividerColor),
                      ),
                      8.height,
                      AppTextField(
                        controller: passwordController,
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: TAInputDecoration(context, hintText: "Password", borderColor: context.dividerColor),
                      )
                    ],
                  ),
                ),
                16.height,
                AppButton(
                  color: TAColorPrimary,
                  width: context.width(),
                  text: "Sign up",
                  textStyle: primaryTextStyle(color: Colors.white),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      TADashboardScreen().launch(context);
                    }
                  },
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: secondaryTextStyle(size: 12)),
                    TextButton(
                      onPressed: () {
                        finish(context);
                      },
                      child: Text('Sign In', style: boldTextStyle(size: 14, color: TAColorPrimary)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
