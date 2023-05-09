import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Views/Widgets/otp_verfication.dart';
import 'package:sizer/sizer.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  String from;

  OTPScreen({required this.phoneNumber, required this.from});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              children: [
                buildOTPUpperImage(),
                buildOTPUpperText(),
                SizedBox(
                  height: 5.h,
                ),
                buildOTPFieldsAndButton(),
                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildOTPFieldsAndButton() {
    return Container(
      height: 40.h,
      width: 90.w,
      child: PinCodeVerificationScreen(
          phoneNumber: widget.phoneNumber, from: widget.from),
    );
  }

  Padding buildOTPUpperText() {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "كود التحقق" + " \n\n ",
                    style: TextStyle(
                        color: kDarkBlue,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Taga",
                        fontSize: 13.sp)),
                TextSpan(
                    text: "تم إرسال كود التحقق علي الرقم  \n\n ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Taga",
                        fontSize: 12.sp)),
              ])),
          Directionality(
            textDirection: TextDirection.ltr,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: widget.phoneNumber,
                      style: TextStyle(
                          color: kDarkBlue,
                          fontFamily: "Taga",
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp)),
                ])),
          ),
        ],
      ),
    );
  }

  Container buildOTPUpperImage() {
    return Container(
      height: 25.h,
      width: 100.w,
      child: Center(
        child: SvgPicture.asset("assets/icons/pincode.svg"),
      ),
    );
  }
}
