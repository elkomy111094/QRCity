import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class NotificationItem extends StatefulWidget {
  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 7.h,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: kDarkBlue.withOpacity(.2),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/notification.svg",
                        color: kDarkBlue,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 65.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Points Added",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp),
                            ),
                            Text(
                              "15 / 9 / 2022",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: 65.w,
                          child: Divider(height: 2.h, thickness: 1)),
                      Row(
                        children: [
                          SizedBox(
                            width: 65.w,
                            child: Text(
                              "تم إستلام 25 نقطة من مطعم ماكدونالدز",
                              /*overflow: TextOverflow.ellipsis,*/
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
