import 'package:flutter/material.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 12.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text: "كلمة المرور الحاليه",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                fontFamily: "Taga",
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                      child: SquareTextField(
                                        fillColor: kLightWhite,
                                        hintText: "",
                                        validator: (email) {},
                                        onChanged: (phone) {},
                                        keyBoardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 12.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text: "كلمة المرور الجديده",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                fontFamily: "Taga",
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                      child: SquareTextField(
                                        fillColor: kLightWhite,
                                        hintText: "",
                                        validator: (email) {},
                                        onChanged: (phone) {},
                                        keyBoardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          height: 12.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text: "تأكيد كلمة المرور",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                fontFamily: "Taga",
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: .5.h,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                      child: SquareTextField(
                                        fillColor: kLightWhite,
                                        hintText: "",
                                        validator: (email) {},
                                        onChanged: (phone) {},
                                        keyBoardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextButton(
                            buttonColor: kDarkBlue,
                            textColor: Colors.white,
                            buttonHorizontalPaddingval: 5.w,
                            buttonVerticalPaddingVal: 5.h,
                            roundedBorder: 1.h,
                            textSize: 12.sp,
                            onPressed: () {
                              pop(context);
                            },
                            text: "حفظ"),
                      ],
                    ),
                  ),
                ),
              ),
              SimpleHeader(headerTitle: "تغيير كلمة المرور"),
            ],
          ),
        ),
      ),
    );
  }
}
