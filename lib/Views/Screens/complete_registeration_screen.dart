import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/success_registeration_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:sizer/sizer.dart';

class CompleteRegisterationScreen extends StatefulWidget {
  @override
  State<CompleteRegisterationScreen> createState() =>
      _CompleteRegisterationScreenState();
}

class _CompleteRegisterationScreenState
    extends State<CompleteRegisterationScreen> {
  bool termsAndConditionsCheckState = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 33.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 30.h,
                      width: 100.w,
                      color: kDarkBlue,
                      child: Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/logo.svg",
                            height: 30.h,
                            width: 100.w,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 6.h,
                          width: 50.w,
                          child: Card(
                            elevation: 10,
                            color: Colors.white,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.h),
                            ),
                            child: Center(
                                child: Text(
                              "إستكمال بيانات الحساب",
                              style: TextStyle(
                                  color: kDarkBlue,
                                  fontSize: 14.sp,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildFirstNameTextFormField(),
                    SizedBox(
                      height: 2.h,
                    ),
                    buildLastNameTextFormField(),
                    SizedBox(
                      height: 2.h,
                    ),
                    buildEmailTextFormField(),
                    SizedBox(
                      height: 2.h,
                    ),
                    buildPasswordTextFormField(),
                    SizedBox(
                      height: 2.h,
                    ),
                    buildTermsAndConditionsAgreement(),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomTextButton(
                        buttonColor: kDarkBlue,
                        textColor: Colors.white,
                        textSize: 12.sp,
                        roundedBorder: 2.h,
                        onPressed: () {
                          navigateToScreen(
                              ctx: context,
                              nextScreen: SuccessRegisterationScreen());
                        },
                        text: "تسجيل"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  SizedBox buildPasswordTextFormField() {
    return SizedBox(
      height: 8.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SquareTextField(
          textLetterSpaceing: 2,
          labelText: "كلمة المرور",
          maxLength: 8,
          hintText: "",
          validator: (passWord) {
            if (passWord!.isEmpty) {
              return "هذا الحقل فارغ";
            } else {
              return null;
            }
          },
          /*controller: inst.phoneNumberController,*/
          onChanged: (phone) {},
          keyBoardType: TextInputType.phone,
        ),
      ),
    );
  }

  SizedBox buildFirstNameTextFormField() {
    return SizedBox(
      height: 8.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SquareTextField(
          textLetterSpaceing: 2,
          labelText: " الإسم الأول ",
          maxLength: 8,
          hintText: "",
          validator: (passWord) {
            if (passWord!.isEmpty) {
              return "هذا الحقل فارغ";
            } else {
              return null;
            }
          },
          /*controller: inst.phoneNumberController,*/
          onChanged: (phone) {},
          keyBoardType: TextInputType.phone,
        ),
      ),
    );
  }

  SizedBox buildLastNameTextFormField() {
    return SizedBox(
      height: 8.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SquareTextField(
          textLetterSpaceing: 2,
          labelText: " إسم العائلة ",
          maxLength: 8,
          hintText: "",
          validator: (passWord) {
            if (passWord!.isEmpty) {
              return "هذا الحقل فارغ";
            } else {
              return null;
            }
          },
          /*controller: inst.phoneNumberController,*/
          onChanged: (phone) {},
          keyBoardType: TextInputType.phone,
        ),
      ),
    );
  }

  SizedBox buildEmailTextFormField() {
    return SizedBox(
      height: 8.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SquareTextField(
          textLetterSpaceing: 2,
          labelText: " البريد الإلكتروني ",
          maxLength: 8,
          hintText: "",
          validator: (passWord) {
            if (passWord!.isEmpty) {
              return "هذا الحقل فارغ";
            } else {
              return null;
            }
          },
          /*controller: inst.phoneNumberController,*/
          onChanged: (phone) {},
          keyBoardType: TextInputType.phone,
        ),
      ),
    );
  }

  SizedBox buildTermsAndConditionsAgreement() {
    return SizedBox(
      height: 5.h,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.scale(
              scale: .75.sp,
              child: Checkbox(
                  activeColor: kDarkBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(.5.h)),
                  value: termsAndConditionsCheckState,
                  onChanged: (val) {
                    setState(() {
                      termsAndConditionsCheckState = val!;
                    });
                  }),
            ),
            RichText(
              text: TextSpan(
                  text: "الموافقة علي شروط وأحكام التطبيق",
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 12.sp,
                    decoration: TextDecoration.underline,
                    fontFamily: "Taga",
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
