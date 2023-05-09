import 'package:flutter/material.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class SimpleHeader extends StatelessWidget {
  bool? showPopIconButton;
  String headerTitle;
  Color? headerColor;
  SimpleHeader(
      {required this.headerTitle,
      this.showPopIconButton = true,
      this.headerColor});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 9.h,
        color: headerColor ?? kDarkBlue.withOpacity(.05),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        headerTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kDarkBlue,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Taga",
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                ],
              ),
              showPopIconButton!
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: GestureDetector(
                        onTap: () {
                          pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDarkBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(.5.h),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: kDarkBlue,
                                    size: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
