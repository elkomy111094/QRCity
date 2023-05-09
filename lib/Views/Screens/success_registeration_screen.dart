import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/bottom_navBar_screen.dart';
import 'package:sizer/sizer.dart';

class SuccessRegisterationScreen extends StatefulWidget {
  const SuccessRegisterationScreen({Key? key}) : super(key: key);

  @override
  State<SuccessRegisterationScreen> createState() =>
      _SuccessRegisterationScreenState();
}

class _SuccessRegisterationScreenState
    extends State<SuccessRegisterationScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        navigateToScreenAndReplacment(
            ctx: context, nextScreen: const BottomNavBarScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 40.h,
                  width: 40.h,
                  child:
                      Center(child: SvgPicture.asset("assets/icons/done.svg")),
                ),
                Text(
                  "تم تسجيل دخولك بنجاح",
                  style: TextStyle(
                      color: kBlue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Taga"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
