import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Constants/styles.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/Login/login_screen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/translations/local_keys.g.dart';
import 'package:sizer/sizer.dart';

class OnBoarding extends StatefulWidget {
  //write stf to Create fully stateful widget
  @override
  _OnBoardingState createState() =>
      _OnBoardingState(); //_OnBoardingState onCreateState =>_OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // Index Of Shown Moved Item On Screen
  int currentIndex = 0;
  //List of All Moved Items In OnBoarding Screen each Block(Map) Consider One Moved Item
  List<Map<String, dynamic>> onBoardingMovedItemsList = [
    {
      "imgUrl": "assets/icons/onboardingBg.svg",
      "desc":
          "الاولي لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص افتراضي يوضع في التصاميم"
    },
    {
      "imgUrl": "assets/icons/onboardingBg.svg",
      "desc":
          "الثانيه لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص افتراضي يوضع في التصاميم"
    },
    {
      "imgUrl": "assets/icons/onboardingBg.svg",
      "desc":
          "الثالثه لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص افتراضي يوضع في التصاميم"
    },
  ];
  @override
  // ignore: must_call_super
  initState() {}

  //.
  //.
  //.
  //.
  //.
  //.
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setEnabledSystemUIOverlays([]);*/
    // the same function of stateless widget

    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffffffff),
          body: Stack(
            //this Stack For Containing PageView and above it the getStarted buttom
            children: <Widget>[
              //main background that has half of screen height
              buildOnBoardingBg(),
              //Moved Widget
              buildPageView(),
              //Skip Button
              currentIndex == 2 ? SizedBox() : buildSkipButton(context),
              //Indicator And Bottom Button
              buildMovementButton(context),
            ],
          )),
    );
  }

  //.
  //.
  //.
  //.
  //.
  //.
  //Build OnBoarding Bg
  //------------------
  //------------------
  //------------------
  //------------------
  //------------------
  Positioned buildOnBoardingBg() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 40.h,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: kLightWhite,
      ),
    );
  }

  // Build Skip Button
  //------------------
  //------------------
  //------------------
  //------------------
  //------------------

  buildSkipButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 2.h),
        child: TextButton(
          onPressed: () {
            navigateToScreen(ctx: context, nextScreen: LoginScreen());
          },
          child: Text(
            LocaleKeys.Skip.tr(),
            style: tagaBoldBlueText,
          ),
        ),
      ),
    );
  }

  //Build Movement Button
  //------------------
  //------------------
  //------------------
  //------------------
  //------------------
  Align buildMovementButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
          height: 30.h,
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 1.h,
                    width: currentIndex == 0 ? 8.w : 5.w,
                    decoration: BoxDecoration(
                      color: currentIndex == 0 ? kLightBlue : Colors.grey,
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(50),
                          left: Radius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 1.h,
                    width: currentIndex == 1 ? 8.w : 5.w,
                    decoration: BoxDecoration(
                      color: currentIndex == 1 ? kLightBlue : Colors.grey,
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(50),
                          left: Radius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 1.h,
                    width: currentIndex == 2 ? 8.w : 5.w,
                    decoration: BoxDecoration(
                      color: currentIndex == 2 ? kLightBlue : Colors.grey,
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(50),
                          left: Radius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              currentIndex == 2
                  ? CustomTextButton(
                      buttonColor: kDarkBlue,
                      textColor: Colors.white,
                      buttonHorizontalPaddingval: 10.w,
                      roundedBorder: 2.h,
                      textSize: 12.sp,
                      onPressed: () {
                        navigateToScreen(
                            ctx: context, nextScreen: LoginScreen());
                      },
                      text: LocaleKeys.StartNow.tr())
                  : CustomTextButton(
                      buttonColor: kDarkBlue,
                      textColor: Colors.white,
                      buttonHorizontalPaddingval: 10.w,
                      roundedBorder: 2.h,
                      textSize: 12.sp,
                      onPressed: () {
                        setState(() {
                          currentIndex++;
                        });
                      },
                      text: LocaleKeys.next.tr()),
            ],
          )),
    );
  }

  //Build Page View
  //------------------
  //------------------
  //------------------
  //------------------
  //------------------
  buildPageView() {
    return SizedBox(
      height: 80.h,
      child: Center(
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: PageController(
              initialPage: currentIndex, keepPage: true, viewportFraction: 1),
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context,
                  index) //itemBuilder will call with all items with number of index times
              {
            return Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: SvgPicture.asset(
                            onBoardingMovedItemsList[currentIndex]["imgUrl"],
                            width: 50.w,
                            height: 30.h,
                          ),
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 85.w,
                          height: 20.h,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: onBoardingMovedItemsList[currentIndex]
                                    ["desc"],
                                style: tagaNormalBlackText),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: onBoardingMovedItemsList.length,
        ),
      ),
    );
  }
}
