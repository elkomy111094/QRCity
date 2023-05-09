import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/getAlignmentAccordingToLocalization.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/Login/login_screen.dart';
import 'package:qr_city/Views/Screens/otp_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:qr_city/translations/local_keys.g.dart';
import 'package:sizer/sizer.dart';

class PhoneRegisterationScreen extends StatelessWidget {
  const PhoneRegisterationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      alignment:
                          getBottomAlignmentAccordingToLang(context: context),
                      child: Container(
                        height: 6.h,
                        width: 35.w,
                        child: Card(
                          elevation: 10,
                          color: Colors.white,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                          child: Center(
                              child: Text(
                            LocaleKeys.CreateAccount.tr(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPhoneTextFormField(),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomTextButton(
                      buttonColor: kDarkBlue,
                      textColor: Colors.white,
                      textSize: 12.sp,
                      roundedBorder: 2.h,
                      onPressed: () {
                        navigateToScreen(
                            ctx: context,
                            nextScreen: OTPScreen(
                              phoneNumber: "+966 55 555 5555",
                              from: "registeration",
                            ));
                      },
                      text: LocaleKeys.register.tr()),
                  SizedBox(
                    height: 8.h,
                  ),
                  InkWell(
                    onTap: () {
                      navigateToScreenAndReplacment(
                          ctx: context, nextScreen: LoginScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 7.h,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.youAlreadyHaveAccount.tr(),
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Taga",
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            LocaleKeys.login.tr(),
                            style: TextStyle(
                              color: kBlue,
                              fontFamily: "Taga",
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      )),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.5.h),
                        color: kLightWhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            color: kLightWhite,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Text(
                              LocaleKeys.OrLoginFromYour.tr(),
                              style: TextStyle(
                                color: kDarkBlue,
                                fontFamily: "Taga",
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 2,
                            width: double.infinity,
                            color: kLightWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 7.h,
                          height: 7.h,
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.google,
                              color: kDarkBlue,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 7.h,
                          height: 7.h,
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.apple,
                              color: kDarkBlue,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  SizedBox buildPhoneTextFormField() {
    return SizedBox(
      height: 12.h,
      child: SquareTextField(
        textLetterSpaceing: 2,
        preFixWidget: Icon(
          Icons.phone,
          color: kLightBlue,
        ),
        labelText: LocaleKeys.PhoneNumber.tr(),
        maxLength: 11,
        hintText: "",
        validator: (phoneVal) {
          if (phoneVal!.isEmpty) {
            return "هذا الحقل فارغ";
          } else if (!RegExp(r'(^(?:[+0]9)?[0-9]{8,8}$)').hasMatch(phoneVal)) {
            return "من فضلك أدخل رقم هاتف صحيح";
          } else {
            return null;
          }
        },
        /*controller: inst.phoneNumberController,*/
        onChanged: (phone) {},
        keyBoardType: TextInputType.phone,
      ),
    );
  }
}
