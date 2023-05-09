import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/otp_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordPhoneScreen extends StatelessWidget {
  const ResetPasswordPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 3.w, right: 3.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          SvgPicture.asset("assets/icons/resetpasswordbg.svg"),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                              "من فضلك أدخل رقم الجوال لإعادة تعيين كلمة مرور جديده",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Taga",
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            height: 12.h,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: SquareTextField(
                                textLetterSpaceing: 2,
                                preFixWidget: Icon(
                                  Icons.phone,
                                  color: kLightBlue,
                                ),
                                labelText: "رقم الهاتف",
                                maxLength: 8,
                                hintText: "",
                                validator: (phoneVal) {
                                  if (phoneVal!.isEmpty) {
                                    return "هذا الحقل فارغ";
                                  } else if (!RegExp(
                                          r'(^(?:[+0]9)?[0-9]{8,8}$)')
                                      .hasMatch(phoneVal)) {
                                    return "من فضلك أدخل رقم هاتف صحيح";
                                  } else {
                                    return null;
                                  }
                                },
                                /*controller: inst.phoneNumberController,*/
                                onChanged: (phone) {},
                                keyBoardType: TextInputType.phone,
                              ),
                            ),
                          ),
                          CustomTextButton(
                              buttonColor: kDarkBlue,
                              textColor: Colors.white,
                              buttonHorizontalPaddingval: 5.w,
                              buttonVerticalPaddingVal: 5.h,
                              roundedBorder: 1.h,
                              textSize: 12.sp,
                              onPressed: () {
                                navigateToScreenAndReplacment(
                                    ctx: context,
                                    nextScreen: OTPScreen(
                                        phoneNumber: "+966 50 505 5050",
                                        from: "resetPassword"));
                              },
                              text: "متابعه")
                        ],
                      ),
                    ),
                  ),
                ),
                SimpleHeader(headerTitle: ""),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
