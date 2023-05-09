import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:sizer/sizer.dart';

class MyPointsScreen extends StatelessWidget {
  BuildContext navBarContext;

  MyPointsScreen({required this.navBarContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 9.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100.w,
                        height: 3.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 90.w,
                          height: 20.h,
                          child: Card(
                            color: kDarkBlue,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "نقاطي الحاليه",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Taga",
                                      fontSize: 15.sp),
                                ),
                                Divider(
                                  height: 1.h,
                                  thickness: 2,
                                  color: kLightBlue,
                                ),
                                Text(
                                  "1625",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  "SR 700",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "كل النقـــاط",
                        style: TextStyle(
                            fontFamily: "Taga",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: kDarkBlue),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 90.w,
                          height: 38.h,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                height: 10.h,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.h)),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 8.h,
                                            width: 8.h,
                                            decoration: BoxDecoration(
                                                color: kLightWhite,
                                                borderRadius:
                                                    BorderRadius.circular(1.h)),
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(1.h),
                                                child: SvgPicture.asset(
                                                    "assets/icons/wallet.svg"),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.5.h,
                                                horizontal: 2.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "مطعم زعفران الهندي",
                                                      style: TextStyle(
                                                          color: kDarkBlue,
                                                          fontFamily: "Taga",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "50 SR +",
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontFamily: "Taga",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "نقاط 10",
                                                      style: TextStyle(
                                                          color: kBlue,
                                                          fontFamily: "Taga",
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "تم التقييم منذ 15/9/2022",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: "Taga",
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 2.h,
                              );
                            },
                            itemCount: 10,
                          ),
                        ),
                      ),
                      CustomTextButton(
                          buttonColor: kDarkBlue,
                          textColor: Colors.white,
                          roundedBorder: 1.h,
                          buttonHorizontalPaddingval: 5.w,
                          textSize: 12.sp,
                          onPressed: () {},
                          text: "طلب الحصول علي الكاش")
                    ],
                  ),
                ),
              ),
            ],
          ),
          SimpleHeader(headerTitle: "نقاطي", showPopIconButton: false),
        ],
      ),
    );
  }
}
