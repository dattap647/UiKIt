import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/MAAppColors.dart';
import '../utils/MAAppCommon.dart';

class MAChangePassword extends StatefulWidget {
  @override
  _MAChangePasswordState createState() => _MAChangePasswordState();
}

class _MAChangePasswordState extends State<MAChangePassword> {
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();

  // Initially password is obscure
  bool obscure1 = true;
  bool obscure2 = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarWidget("Change Password", color: primaryColor, textColor: Colors.white),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Reset your password.',style: boldTextStyle(color: primaryColor,size:20)),
              16.height,
              AppTextField(
                controller: passController,
                textStyle: primaryTextStyle(),
                keyboardType: TextInputType.visiblePassword,
                decoration: inputDecoration(
                  name: "Password",
                  prefixIcon: Icon(Ionicons.md_key_outline, size: 20, color: textSecondaryColor),
                ),
                textFieldType: TextFieldType.PASSWORD,
              ),
              16.height,
              AppTextField(
                controller: cPassController,
                textStyle: primaryTextStyle(),
                keyboardType: TextInputType.visiblePassword,
                decoration: inputDecoration(
                  name: "Confirm Password",
                  prefixIcon: Icon(Ionicons.md_key_outline, size: 20, color: textSecondaryColor),
                ),
                textFieldType: TextFieldType.PASSWORD,
              ),
              24.height,
              appButton(context, text: 'Update Password', bgColor: primaryColor, onTap: () {
                //
                if (passController.text.isEmpty && cPassController.text.isEmpty) {
                  toast('Please enter password');
                } else {
                  if (passController.text == cPassController.text) {
                    toast('Password update successfully !');
                  } else {
                    toast("Password doesn't match");
                  }
                }
              }),
            ],
          ).paddingAll(12),
        ],
      ),
    );
  }
}
