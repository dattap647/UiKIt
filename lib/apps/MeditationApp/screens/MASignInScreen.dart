import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/MeditationApp/utils/MAAppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../component/MAForgotPasswordDailog.dart';
import '../utils/MAAppCommon.dart';
import '../utils/MAAppContants.dart';

class MASignInScreen extends StatefulWidget {
  @override
  _MASignInScreenState createState() => _MASignInScreenState();
}

class _MASignInScreenState extends State<MASignInScreen> {
  TextEditingController passSigInController = TextEditingController();
  TextEditingController emailSignInController = TextEditingController();
  FocusNode passFocus = FocusNode();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();

  bool? isRemember = false;
  int? isSelected = 0;

  // Initially password is obscure
  bool obscure1 = true;
  bool obscure2 = true;
  bool obscureSignIn = true;

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

  void forgotPasswordDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(backgroundColor: Colors.transparent, content: ForgotPasswordDailogComponent());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBarWidget("", showBack: true, elevation: 0, color: context.cardColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello \nWelcome here', style: boldTextStyle(size: 24)),
              30.height,
              SizedBox(
                width: context.width() * 0.7,
                child: TabBar(
                  isScrollable: false,
                  onTap: (i) {
                    isSelected = i;
                    setState(() {});
                  },
                  padding: EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(color: primaryColor, borderRadius: radius()),
                  unselectedLabelColor: primaryColor.withOpacity(0.3),
                  unselectedLabelStyle: primaryTextStyle(color: primaryColor),
                  tabs: [
                    Tab(child: tab(text: "Sign In", icon: Icons.login, color: isSelected != 0 ? primaryColor.withOpacity(0.3) : Colors.white)),
                    Tab(child: tab(text: "Sign Up", icon: Icons.person_add, color: isSelected != 1 ? primaryColor.withOpacity(0.3) : Colors.white)),
                  ],
                ),
              ),
              16.height,
              isSelected == 0 ? signIn() : signUp()
            ],
          ),
        ),
      ),
    );
  }

  Widget tab({String? text, IconData? icon, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        8.width,
        Text(text.toString().toUpperCase(), style: boldTextStyle(color: color, size: 18)).paddingTop(4),
      ],
    );
  }

  Widget signIn() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithShadow(spreadRadius: 0, borderRadius: radius(12), backgroundColor: context.cardColor),
      child: Column(
        children: [
          16.height,
          AppTextField(
            controller: emailSignInController,
            keyboardType: TextInputType.emailAddress,
            textStyle: primaryTextStyle(),
            decoration: inputDecoration(name: "Email/Username", prefixIcon: Icon(FontAwesome.user_o, size: 18, color: textSecondaryColor)),
            textFieldType: TextFieldType.EMAIL,
            autoFocus: true,
          ),
          16.height,
          Stack(
            alignment: Alignment.centerRight,
            children: [
              AppTextField(
                controller: passSigInController,
                textStyle: primaryTextStyle(),
                keyboardType: TextInputType.visiblePassword,
                decoration: inputDecoration(name: "Password", prefixIcon: Icon(Ionicons.md_key_outline, size: 20, color: textSecondaryColor)),
                textFieldType: TextFieldType.PASSWORD,
              ),
            ],
          ),
          8.height,
          Row(
            children: [
              6.width,
              SizedBox(
                width: 16,
                child: Checkbox(
                    value: isRemember,
                    activeColor: primaryColor,
                    onChanged: (v) async {
                      isRemember = v;
                      await setValue(IsRemember, v);
                      setState(() {});
                    }),
              ),
              8.width,
              Text("Remember me", style: secondaryTextStyle()).expand(),
              Text("Forgot password?", style: secondaryTextStyle()).onTap(() async {
                FocusScope.of(context).requestFocus(FocusNode());
                return forgotPasswordDialog();
              }),
            ],
          ),
          16.height,
          appButton(context, text: "Sign In", onTap: () {
            //
          }),
          16.height,
          Row(
            children: [
              Divider(endIndent: 10).expand(),
              Text('OR', style: secondaryTextStyle()),
              Divider(indent: 10).expand(),
            ],
          ),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GoogleLogoWidget(),
              12.width,
              Image.asset(
                'images/meditationApp/Phone.png',
                width: 30,
                height: 30,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget signUp() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithShadow(spreadRadius: 0, borderRadius: radius(12), backgroundColor: context.cardColor),
      child: Column(
        children: [
          16.height,
          AppTextField(
            controller: lNameController,
            keyboardType: TextInputType.name,
            textStyle: primaryTextStyle(),
            decoration: inputDecoration(name: "Username", prefixIcon: Icon(FontAwesome.user_o, size: 18, color: textSecondaryColor)),
            autoFocus: true,
            textFieldType: TextFieldType.USERNAME,
          ),
          16.height,
          AppTextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textStyle: primaryTextStyle(),
            decoration: inputDecoration(name: "Email", prefixIcon: Icon(Fontisto.email, size: 18, color: textSecondaryColor)),
            autoFocus: true,
            textFieldType: TextFieldType.EMAIL,
          ),
          16.height,
          AppTextField(
            controller: mobileController,
            keyboardType: TextInputType.number,
            textStyle: primaryTextStyle(),
            decoration: inputDecoration(name: "Mobile Number", prefixIcon: Icon(Ionicons.ios_phone_portrait_outline, size: 18, color: textSecondaryColor)),
            autoFocus: true,
            textFieldType: TextFieldType.PHONE,
          ),
          16.height,
          Stack(
            alignment: Alignment.centerRight,
            children: [
              AppTextField(
                controller: passController,
                keyboardType: TextInputType.visiblePassword,
                textStyle: primaryTextStyle(),
                decoration: inputDecoration(name: "Password", isPass: true, prefixIcon: Icon(Ionicons.md_key_outline, size: 20, color: textSecondaryColor)),
                isPassword: true,
                textFieldType: TextFieldType.PASSWORD,
              ),
            ],
          ),
          16.height,
          Stack(
            alignment: Alignment.centerRight,
            children: [
              AppTextField(
                controller: cPassController,
                keyboardType: TextInputType.visiblePassword,
                textStyle: primaryTextStyle(),
                decoration: inputDecoration(
                  name: "Confirm Password",
                  isPass: true,
                  prefixIcon: Icon(Ionicons.md_key_outline, size: 20, color: textSecondaryColor),
                ),
                isPassword: true,
                textFieldType: TextFieldType.PASSWORD,
              ),
            ],
          ),
          24.height,
          appButton(context, text: "Sign Up", onTap: () {
            //
          }),
          16.height,
        ],
      ),
    );
  }
}
