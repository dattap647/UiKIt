import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../groceryApp/utils/GSWidgets.dart';

class TAEditProfileScreen extends StatefulWidget {
  static String tag = '/TAEditProfileScreen';

  @override
  TAEditProfileScreenState createState() => TAEditProfileScreenState();
}

class TAEditProfileScreenState extends State<TAEditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController(text: 'John Hawkins');
  TextEditingController emailController = TextEditingController(text: 'John@gmail.com');
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode dateOfBirthNode = FocusNode();
  FocusNode phoneNode = FocusNode();

  DateTime? _date;
  String value = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  Future<void> selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
    );
    if (_datePicker != null && _datePicker != _date) {
      _date = _datePicker;
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarWidget(
        'Personal Info',
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image.asset(
                          ta_profileImg,
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                        ).cornerRadiusWithClipRRect(60),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: TAColorPrimary),
                          child: Icon(Icons.camera_alt_outlined, color: Colors.white,size: 20,),
                        ),
                      ],
                    ),
                    16.height,
                    AppTextField(
                      autoFocus: false,
                      controller: nameController,
                      textFieldType: TextFieldType.NAME,
                      decoration: inputDecoration(label: "Name"),
                      focus: nameNode,
                      nextFocus: emailNode,
                      keyboardType: TextInputType.text,
                    ),
                    16.height,
                    AppTextField(
                      autoFocus: false,
                      controller: emailController,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: inputDecoration(label: "Email Address"),
                      focus: emailNode,
                      keyboardType: TextInputType.text,
                    ),
                    16.height,
                    TextFormField(
                      textAlign: TextAlign.start,
                      controller: dateOfBirthController,
                      autofocus: false,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration(label: "Date of Birth"),
                      onTap: () async {
                        hideKeyboard(context);
                        await selectDate(context);
                        dateOfBirthController.text = _date!.day.toString();
                        dateOfBirthController.text = _date!.month.toString();
                        dateOfBirthController.text = _date!.year.toString();
                        value = dateOfBirthController.text = _date!.day.toString() + "/" + _date!.month.toString() + "/" + _date!.year.toString();
                        setState(() {});
                      },
                    ),
                    20.height,
                    Row(
                      children: [
                        CountryCodePicker(
                          backgroundColor: context.cardColor,
                          onChanged: print,
                          initialSelection: 'IT',
                          favorite: ['+39', 'FR'],
                          showCountryOnly: false,
                          dialogBackgroundColor: context.cardColor,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        AppTextField(
                          autoFocus: false,
                          controller: phoneController,
                          textFieldType: TextFieldType.PHONE,
                          focus: phoneNode,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grey)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: TAColorPrimary)),
                            hintText: "000 0000 0000",
                            hintStyle: secondaryTextStyle(size: 14),
                          ),
                        ).expand()
                      ],
                    ),
                  ],
                ).paddingAll(16),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: AppButton(
              text: 'Save',
              textStyle: primaryTextStyle(color: Colors.white),
              color: TAColorPrimary,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  finish(context);
                }
              },
            ),
          ),
        ],
      ).withHeight(context.height()),
    ).paddingOnly(top: 16);
  }
}
