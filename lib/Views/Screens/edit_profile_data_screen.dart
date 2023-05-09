import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:sizer/sizer.dart';

class EditProfileDataScreen extends StatelessWidget {
  const EditProfileDataScreen({Key? key}) : super(key: key);

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
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 20.h,
                              width: 20.h,
                              child: Stack(
                                children: [
                                  Container(
                                      width: 20.h,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: kLightWhite, width: 5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.h),
                                        child: SvgPicture.asset(
                                          "assets/icons/user_image.svg",
                                          color: Colors.black,
                                        ),
                                      )),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.h),
                                      child: CircleAvatar(
                                        backgroundColor: kDarkBlue,
                                        radius: 2.h,
                                        child: Center(
                                          child: SvgPicture.asset(
                                            "assets/icons/edit.svg",
                                            width: 2.h,
                                            height: 2.h,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Container(
                              height: 12.h,
                              child: Row(
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
                                                  text: "الاسم الاول",
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
                                            maxLength: 15,
                                            fillColor: kLightWhite,
                                            validator: (fName) {},
                                            hintText: "",
                                            onChanged: (phone) {},
                                            keyBoardType: TextInputType.name,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
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
                                                  text: "إسم العائلة",
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
                                            validator: (lName) {},
                                            maxLength: 15,
                                            onChanged: (phone) {},
                                            keyBoardType: TextInputType.name,
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
                                                  text: "البريد الإلكتروني",
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
                                            validator: (email) {
                                              if (email!.isEmpty) {
                                                return "الحقل فارغ";
                                              }
                                              if (!RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(email)) {
                                                return "أدخل أيميل صحيح";
                                              }
                                            },
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
                            CustomTextButton(
                                buttonColor: kDarkBlue,
                                textColor: Colors.white,
                                buttonHorizontalPaddingval: 5.w,
                                buttonVerticalPaddingVal: 5.h,
                                roundedBorder: 1.h,
                                textSize: 12.sp,
                                onPressed: () {},
                                text: "تعديل")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SimpleHeader(headerTitle: "تعديل بيانات الملف الشخصي"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
