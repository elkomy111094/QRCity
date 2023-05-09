import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  void successResetingPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.h), topLeft: Radius.circular(5.h)),
        ),
        context: context,
        builder: (builder) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: 40.h,
                  child:
                      Center(child: SvgPicture.asset("assets/icons/done.svg")),
                ),
                Text(
                  "تم إعادة تعيين كلمة المرور بنجاح",
                  style: TextStyle(
                      color: kBlue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Taga"),
                ),
              ],
            ),
          );
        });
  }

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
                                              text: "تأكيد كلمة المرور الجديده",
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
                              successResetingPasswordBottomSheet(context);
                            },
                            text: "حفظ"),
                      ],
                    ),
                  ),
                ),
              ),
              SimpleHeader(headerTitle: "إعادة تعيين كلمة المرور"),
            ],
          ),
        ),
      ),
    );
  }
}
