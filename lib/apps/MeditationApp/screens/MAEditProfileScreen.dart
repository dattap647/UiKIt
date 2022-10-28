import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/MAAppColors.dart';
import '../utils/MAAppCommon.dart';
import '../utils/MAImages.dart';

class MAEditProfileScreen extends StatefulWidget {
  @override
  _MAEditProfileScreenState createState() => _MAEditProfileScreenState();
}

class _MAEditProfileScreenState extends State<MAEditProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();

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

      appBar: appBarWidget("Edit Profile", showBack: true, textColor: Colors.white, color: primaryColor),
      body: Stack(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                16.height,
                Stack(
                  children: [
                    Container(
                        padding: EdgeInsets.all(3),
                        decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.circle, backgroundColor: primaryColor),
                        child: CircleAvatar(maxRadius: 60, backgroundImage: AssetImage(MAProfile_image))),
                    Positioned(
                      bottom: 4,
                      right: 3,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: boxDecorationWithRoundedCorners(
                          boxShape: BoxShape.circle,
                          backgroundColor: primaryColor,
                          border: Border.all(color: Colors.white),
                        ),
                        child: Icon(Icons.edit, color: Colors.white, size: 16),
                      ).onTap(() async {
                        toast("Change your profile picture");
                      }),
                    )
                  ],
                ).onTap(() {
                  //
                }),
                40.height,
                AppTextField(
                  controller: firstNameController,
                  nextFocus: lastNameFocus,
                  autoFocus: true,
                  readOnly: true,
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  decoration: inputDecoration(name: "John", prefixIcon: Icon(FontAwesome.user_o, size: 18, color: textSecondaryColor)),
                ),
                12.height,
                AppTextField(
                  controller: lastNameController,
                  readOnly: true,
                  textFieldType: TextFieldType.NAME,
                  keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value.validate().isEmpty) return errorThisFieldRequired;
                    return null;
                  },
                  decoration: inputDecoration(name: 'Dover', prefixIcon: Icon(FontAwesome.user_o, size: 18, color: textSecondaryColor)),
                  onFieldSubmitted: (c) {},
                ),
                24.height,
                appButton(
                  context,text: "Update Profile",
                  onTap: () {},
                )
              ],
            ).paddingAll(16),
          ),
        ],
      ),
    );
  }
}
