import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/add_bank_account_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:sizer/sizer.dart';

class NoBankAccountScreen extends StatelessWidget {
  const NoBankAccountScreen({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.only(top: 10.h),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/nobank.svg"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text("لايوجد حساب بنكي أضيف من قبل",
                            style: TextStyle(
                              color: kBlue,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Taga",
                            )),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text("من فضلك قم بإضافة حسابك لإستلام الأموال",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Taga",
                            )),
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
                                  nextScreen: AddBankAccountScreen());
                            },
                            text: "إضافة حساب بنكي")
                      ],
                    ),
                  ),
                ),
                SimpleHeader(headerTitle: "الحساب البنكي"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
