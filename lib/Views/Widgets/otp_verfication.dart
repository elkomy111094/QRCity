import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/location_registeration_screen.dart';
import 'package:qr_city/Views/Screens/reset_password_screen.dart';
import 'package:sizer/sizer.dart';

import 'custom_text_button.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  String from;

  PinCodeVerificationScreen({required this.phoneNumber, required this.from});

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  late String otpCode;
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: <Widget>[
          Form(
            key: formKey,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    enablePinAutofill: true,
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Taga",
                    ),
                    length: 6,
                    useExternalAutoFillGroup: true,
                    obscureText: true,
                    obscuringCharacter: '*',
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    animationCurve: Curves.bounceInOut,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeColor: Colors.white,
                      inactiveColor: kDarkBlue,
                      selectedColor: kDarkBlue.withOpacity(.5),
                      inactiveFillColor: Colors.white,
                      selectedFillColor: kDarkBlue.withOpacity(.5),
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 7.h,
                      fieldWidth: 5.h,
                      activeFillColor: kDarkBlue.withOpacity(.5),
                    ),
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                    autoFocus: true,
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: textEditingController,
                    validator: (v) {
                      if (v!.length < 6) {
                        return "";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    onCompleted: (submitedCode) {
                      otpCode = submitedCode;
                      print("Completed");
                    },
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              hasError ? "يجب ملئ جميع الحقول" : "",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              enableResend
                  ? TextButton(
                      onPressed: () async {},
                      child: Text(
                        "إعادة إرسال الكود ؟",
                        style: TextStyle(
                            color: kDarkBlue,
                            fontSize: 12.sp,
                            fontFamily: "Taga"),
                      ),
                    )
                  : TextButton(
                      onPressed: null,
                      child: Text(
                        "إعادة إرسال الكود ؟",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            fontFamily: "Taga"),
                      ),
                    ),
              SizedBox(
                width: 1.w,
              ),
              RichText(
                  text: TextSpan(
                      text: secondsRemaining.toString() + ":00",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Taga",
                          fontSize: 12.sp))),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: CustomTextButton(
              text: "تحقق الأن",
              buttonColor: kDarkBlue,
              roundedBorder: 10,
              textColor: Colors.white,
              vPadding: 0,
              hPadding: 0,
              buttonHorizontalPaddingval: 20.w,
              textSize: 15.sp,
              onPressed: () async {
                /*if (formKey.currentState!.validate()) {
                 navigateToScreen(ctx: context, nextScreen:HomeScreen());
                } else {
                  showToast(context, "Activation code less than 6 digits".tr());
                }*/

                if (widget.from == "registeration") {
                  navigateToScreen(
                      ctx: context, nextScreen: LocationRegisterationScreen());
                } else if (widget.from == "resetPassword") {
                  navigateToScreen(
                      ctx: context, nextScreen: ResetPasswordScreen());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
