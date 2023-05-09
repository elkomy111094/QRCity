import 'package:flutter/material.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/change_password_screen.dart';
import 'package:qr_city/Views/Screens/edit_profile_data_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/more_item_card.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:sizer/sizer.dart';

class MainProfileScreen extends StatelessWidget {
  const MainProfileScreen({Key? key}) : super(key: key);

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
                        MoreItemCard(
                            title: "تعديل بيانات الحساب",
                            iconUrl: "assets/icons/user_image.svg",
                            onTabButton: () {
                              navigateToScreenAndReplacment(
                                  ctx: context,
                                  nextScreen: EditProfileDataScreen());
                            }),
                        SizedBox(
                          height: 2.h,
                        ),
                        MoreItemCard(
                            title: "تغيير كلمة المرور",
                            iconUrl: "assets/icons/lock.svg",
                            onTabButton: () {
                              navigateToScreenAndReplacment(
                                  ctx: context,
                                  nextScreen: ChangePasswordScreen());
                            }),
                        SizedBox(
                          height: 2.h,
                        ),
                        CustomTextButton(
                            buttonColor: Colors.red,
                            textColor: Colors.white,
                            buttonHorizontalPaddingval: 5.w,
                            buttonVerticalPaddingVal: 5.h,
                            roundedBorder: 1.h,
                            textSize: 15.sp,
                            onPressed: () {},
                            text: "حذف حسابي"),
                      ],
                    ),
                  ),
                ),
              ),
              SimpleHeader(headerTitle: "حسابي"),
            ],
          ),
        ),
      ),
    );
  }
}
