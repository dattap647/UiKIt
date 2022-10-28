import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/MAAppCommon.dart';

class ForgotPasswordDailogComponent extends StatefulWidget {
  @override
  ForgotPasswordDailogComponentState createState() => ForgotPasswordDailogComponentState();
}

class ForgotPasswordDailogComponentState extends State<ForgotPasswordDailogComponent> {
  var formKey = GlobalKey<FormState>();

  TextEditingController emailCont = TextEditingController();
  FocusNode emailFocus = FocusNode();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future<void> forgotPassword() async {
    isLoading = true;
    if (emailCont.text.isNotEmpty) {
      hideKeyboard(context);
      Navigator.pop(context);
    } else {
      toast('Please enter your email address');
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12),backgroundColor: context.cardColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Forgot Password?', style: boldTextStyle(), textAlign: TextAlign.justify),
            8.height,
            Text('Please enter the email you used to register we will then send you a notification', style: secondaryTextStyle(size: 12), textAlign: TextAlign.left).paddingSymmetric(horizontal: 8),
            16.height,
            TextField(
              controller: emailCont,
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration(name: "email", prefixIcon: Icon(Icons.email_outlined, size: 18, color: textSecondaryColor)),
              autofocus: true,
            ),
            8.height,
            appButton(context, text: 'submit', onTap: () {
              forgotPassword();
            })
          ],
        ).center(),
      ),
    );
  }
}
