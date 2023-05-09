import 'package:easy_localization/easy_localization.dart' as loca;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Constants/styles.dart';
import 'package:qr_city/Helper/getAlignmentAccordingToLocalization.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/Registeration/phone_registeration_screen.dart';
import 'package:qr_city/Views/Screens/bottom_navBar_screen.dart';
import 'package:qr_city/Views/Screens/reset_password_phone_number_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:qr_city/translations/local_keys.g.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildLoginHeader(context: context),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildPhoneTextFormField(),
                  buildPasswordTextFormField(),
                  InkWell(
                    onTap: () {
                      navigateToScreen(
                          ctx: context, nextScreen: ResetPasswordPhoneScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: Text(
                        LocaleKeys.AreYouForgetPassword.tr(),
                        style: TextStyle(
                            color: kBlue,
                            fontFamily: "Taga",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomTextButton(
                      buttonColor: kDarkBlue,
                      textColor: Colors.white,
                      textSize: 12.sp,
                      roundedBorder: 2.h,
                      onPressed: () {
                        navigateToScreen(
                            ctx: context, nextScreen: BottomNavBarScreen());
                      },
                      text: LocaleKeys.Enter.tr()),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  InkWell(
                    onTap: () {
                      navigateToScreenAndReplacment(
                          ctx: context, nextScreen: PhoneRegisterationScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 7.h,
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.YouHaveNotAccount.tr(),
                            style: tagaNormalBlackText,
                          ),
                          Text(
                            LocaleKeys.CreateAccount.tr(),
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

  Container buildLoginHeader({required BuildContext context}) {
    return Container(
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
              alignment: getBottomAlignmentAccordingToLang(context: context),
              child: Container(
                height: 6.h,
                width: 30.w,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                  child: Center(
                      child: Text(
                    LocaleKeys.Welcome.tr(),
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
    );
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

  SizedBox buildPasswordTextFormField() {
    return SizedBox(
      height: 8.h,
      child: SquareTextField(
        textLetterSpaceing: 2,
        labelText: LocaleKeys.Password.tr(),
        preFixWidget: Icon(
          Icons.lock,
          color: kLightBlue,
        ),
        maxLength: 8,
        hintText: "",
        obsecureance: true,
        suffixWidget: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_red_eye,
            color: kDarkBlue.withOpacity(.5),
          ),
        ),
        validator: (passWord) {
          if (passWord!.isEmpty) {
            return "هذا الحقل فارغ";
          } else {
            return null;
          }
        },
        /*controller: inst.phoneNumberController,*/
        onChanged: (phone) {},
        keyBoardType: TextInputType.text,
      ),
    );
  }
}
