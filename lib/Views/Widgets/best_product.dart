import 'package:flutter/material.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:sizer/sizer.dart';

class BestProduct extends StatefulWidget {
  const BestProduct({Key? key}) : super(key: key);

  @override
  State<BestProduct> createState() => _BestProductState();
}

class _BestProductState extends State<BestProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Stack(
        children: [
          Container(
            width: 70.w,
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.h),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/capap.png"),
                )),
          ),
          Positioned(
            top: 1.h,
            left: 3.w,
            child: Container(
              height: 4.h,
              decoration: BoxDecoration(
                  color: kBlue, borderRadius: BorderRadius.circular(1.h)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text("5.5 SR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      )),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 1.h,
            left: 3.w,
            right: 3.w,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: BorderRadius.circular(1.h)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "كباب لحم عربي",
                      style: TextStyle(
                        color: kBlue,
                        fontFamily: "Taga",
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "قطع كباب تقدم مع ثوميه كانز بيبسي",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Taga",
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
