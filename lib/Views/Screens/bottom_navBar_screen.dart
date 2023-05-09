import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Views/Screens/home_screen.dart';
import 'package:qr_city/Views/Screens/myPoints_screen.dart';
import 'package:qr_city/Views/Screens/notes_screen.dart';
import 'package:qr_city/Views/Screens/offers_screen.dart';
import 'package:qr_city/Views/Screens/settings_screen.dart';
import 'package:sizer/sizer.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  //State class
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CurvedNavigationBar(
                index: 2,
                height: 45,
                backgroundColor: Colors.transparent,
                buttonBackgroundColor: kBlue,
                key: _bottomNavigationKey,
                items: <Widget>[
                  SvgPicture.asset(
                    "assets/icons/notes_icon.svg",
                    width: 3.h,
                    height: 3.h,
                    color: _page == 0 ? Colors.white : kDarkBlue,
                  ),
                  SvgPicture.asset(
                    "assets/icons/offers_icon.svg",
                    width: 3.h,
                    height: 3.h,
                    color: _page == 1 ? Colors.white : kDarkBlue,
                  ),
                  SvgPicture.asset(
                    "assets/icons/home_icon.svg",
                    width: 3.h,
                    height: 3.h,
                    color: _page == 2 ? Colors.white : kDarkBlue,
                  ),
                  SvgPicture.asset(
                    "assets/icons/points_icon.svg",
                    width: 3.h,
                    height: 3.h,
                    color: _page == 3 ? Colors.white : kDarkBlue,
                  ),
                  SvgPicture.asset(
                    "assets/icons/settings_icon.svg",
                    width: 3.h,
                    height: 3.h,
                    color: _page == 4 ? Colors.white : kDarkBlue,
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    _page = index;
                  });
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Color(0xffffffff),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Center(
                                child: Text(
                          "المذكرة",
                          style: TextStyle(
                              fontFamily: "Taga",
                              fontSize: 12.sp,
                              fontWeight: _page == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _page == 0 ? kBlue : kDarkBlue),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          "العروض",
                          style: TextStyle(
                              fontFamily: "Taga",
                              fontSize: 12.sp,
                              fontWeight: _page == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _page == 1 ? kBlue : kDarkBlue),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          "الرئيسية",
                          style: TextStyle(
                              fontFamily: "Taga",
                              fontSize: 12.sp,
                              fontWeight: _page == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _page == 2 ? kBlue : kDarkBlue),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          "نقاطي",
                          style: TextStyle(
                              fontFamily: "Taga",
                              fontSize: 12.sp,
                              fontWeight: _page == 3
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _page == 3 ? kBlue : kDarkBlue),
                        ))),
                        Expanded(
                            child: Center(
                                child: Text(
                          "الإعدادت",
                          style: TextStyle(
                              fontFamily: "Taga",
                              fontSize: 12.sp,
                              fontWeight: _page == 4
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _page == 4 ? kBlue : kDarkBlue),
                        ))),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: getScreenBody(_page),
        ),
      ),
    );
  }

  getScreenBody(int currentindex) {
    switch (currentindex) {
      case 0:
        return NotesScreen(
          navBarContext: context,
        );
      case 1:
        return OffersScreen(
          navBarContext: context,
        );
      case 2:
        return HomeScreen(
          navBarContext: context,
        );
      case 3:
        return MyPointsScreen(
          navBarContext: context,
        );
      case 4:
        return SettingsScreen(
          navBarContext: context,
        );
    }
  }
}
