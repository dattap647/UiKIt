import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAColors.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TACommon.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TAImages.dart';
import 'package:mighty_ui_kit/apps/travelApp/utils/TATextInputFormatter.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TAAddNewCardScreen extends StatefulWidget {
  static String tag = '/TAAddNewCardScreen';

  @override
  TAAddNewCardScreenState createState() => TAAddNewCardScreenState();
}

class TAAddNewCardScreenState extends State<TAAddNewCardScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController cardHolderNameCtrl = TextEditingController();
  TextEditingController expiryCtrl = TextEditingController();
  TextEditingController securityCodeCtrl = TextEditingController();

  FocusNode? cardNumberFocus;
  FocusNode? cardHolderNameFocus;
  FocusNode? expiryFocus;
  FocusNode? securityFocus;

  bool isValidCardNumber = false;

  @override
  void initState() {
    super.initState();
    cardNumberFocus = FocusNode();
    cardHolderNameFocus = FocusNode();
    expiryFocus = FocusNode();
    securityFocus = FocusNode();
    init();
  }

  init() async {}

  @override
  void dispose() {
    super.dispose();
    cardNumberFocus!.dispose();
    cardHolderNameFocus!.dispose();
    expiryFocus!.dispose();
    securityFocus!.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  bool validateCardNumber(String cardNumber) {
    if (cardNumber == "1234 5678 9876 5432") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  appBarWidget(
        'Add new card',
        elevation: 0,
        color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
        backWidget: taBackButton(context, iconColor: context.iconColor),
      ),

        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: context.height(),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      taCachedImage(ta_card3, height: 200, width: context.width(),fit: BoxFit.fill).center(),
                      32.height,
                      TextFormField(
                        focusNode: cardNumberFocus,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        controller: cardNumberCtrl,
                        inputFormatters: [TATextInputFormatter('xxxx xxxx xxxx xxxx', ' ')],
                        decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Card Number"),
                        onFieldSubmitted: (val) {
                          cardNumberFocus!.unfocus();
                          FocusScope.of(context).requestFocus(cardHolderNameFocus);
                        },
                        onChanged: (val) {
                          if (val.length == 19) {
                            cardNumberFocus!.unfocus();
                            FocusScope.of(context).requestFocus(cardHolderNameFocus);
                          }
                        },
                      ),
                      16.height,
                      TextFormField(
                        focusNode: cardHolderNameFocus,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.text,
                        controller: cardHolderNameCtrl,
                        decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Cardholder Name"),
                        onFieldSubmitted: (val) {
                          cardHolderNameFocus!.unfocus();
                          FocusScope.of(context).requestFocus(expiryFocus);
                        },
                      ),
                      16.height,
                      Row(
                        children: [
                          TextFormField(
                            focusNode: expiryFocus,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.datetime,
                            inputFormatters: [TATextInputFormatter('xx/xx', '/')],
                            controller: expiryCtrl,
                            decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Expiry"),
                            onFieldSubmitted: (val) {
                              expiryFocus!.unfocus();
                              FocusScope.of(context).requestFocus(securityFocus);
                            },
                            onChanged: (val) {
                              if (val.length == 5) {
                                expiryFocus!.unfocus();
                                FocusScope.of(context).requestFocus(securityFocus);
                              }
                            },
                          ).expand(),
                          16.width,
                          TextFormField(
                            obscureText: true,
                            focusNode: securityFocus,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.number,
                            controller: securityCodeCtrl,
                            inputFormatters: [LengthLimitingTextInputFormatter(3)],
                            decoration: TAInputDecoration(context, borderColor: context.dividerColor, hintText: "Security Code"),
                            onFieldSubmitted: (val) {
                              securityFocus!.unfocus();
                            },
                          ).expand(),
                        ],
                      ),
                      80.height,
                    ],
                  ).paddingAll(16),
                ),
              ),
            ),
            AppButton(
              text: "Save",
              onTap: (){
                finish(context);
              },
              color: TAColorPrimary,
              textStyle: primaryTextStyle(color: Colors.white),
              width: context.width(),
            ).paddingAll(16)
          ],
        ),
      ),
    );
  }
}

