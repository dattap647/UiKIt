import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICVerificationScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICLoginPage extends StatefulWidget {
  @override
  _ICLoginPageState createState() => _ICLoginPageState();
}

class _ICLoginPageState extends State<ICLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final noController = TextEditingController();

  String? valueChoose = "United States ofAmerica";
  List listItem = ["India", "United States ofAmerica", "Japan", "Australia", "Germany", "Russia"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: icScaffoldBgColor,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.height,
              Center(child: Image.asset('images/iiumiaCrypto/ic_logo.jpg', fit: BoxFit.cover)),
              16.height,
              Text('Welcome back!', style: boldTextStyle(color: icWhiteColor, size: 24), textAlign: TextAlign.center).center(),
              16.height,
              Text('Enter Your mobile no to login.', style: secondaryTextStyle(color: icWhiteColor)).center(),
              16.height,
              Text("National", style: secondaryTextStyle(color: icWhiteColor)),
              4.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: icNavyBlueColor),
                child: DropdownButton(
                  value: valueChoose,
                  onChanged: (dynamic newValue) {
                    valueChoose = newValue;
                    setState(() {});
                  },
                  isExpanded: true,
                  dropdownColor: icScaffoldBgColor,
                  icon: Icon(Icons.arrow_drop_down, color: icWhiteColor),
                  items: listItem.map(
                    (e) {
                      return DropdownMenuItem(
                        child: Text(e, style: TextStyle(color: icWhiteColor)),
                        value: e,
                      );
                    },
                  ).toList(),
                  hint: Text("United States of America", style: TextStyle(color: icWhiteColor)),
                  underline: SizedBox(),
                ),
              ),
              16.height,
              Text("Phone No.", style: secondaryTextStyle(color: icWhiteColor)),
              4.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: icNavyBlueColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: icNavyBlueColor,
                ),
                child: TextFormField(
                  style: TextStyle(color: icWhiteColor),
                  controller: noController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter No.",
                    hintStyle: TextStyle(color: icWhiteColor),
                    suffixIcon: Icon(Icons.check, color: icSkip, size: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              16.height,
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    child: Icon(Icons.auto_awesome, color: icWhiteColor),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  16.width,
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ICVerification(noController.text).launch(context);
                        }
                      },
                      child: Text("Send Code", textAlign: TextAlign.center),
                    ),
                  ).expand(),
                ],
              ),
              16.height,
              Text.rich(
                TextSpan(
                  text: "New user?  ",
                  style: boldTextStyle(color: icWhiteColor),
                  children: <TextSpan>[
                    TextSpan(text: "Get started", style: secondaryTextStyle(color: icSkip)),
                  ],
                ),
              ).center().onTap(
                () {
                  ICSignUp().launch(context);
                },
              )
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
