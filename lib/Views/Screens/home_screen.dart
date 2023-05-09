import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/View_Models/filter_view_model/home_filter_cubit.dart';
import 'package:qr_city/Views/Screens/category_Screen.dart';
import 'package:qr_city/Views/Screens/favorites_Screen.dart';
import 'package:qr_city/Views/Screens/main_profile_screen.dart';
import 'package:qr_city/Views/Screens/nearest_stores_screen.dart';
import 'package:qr_city/Views/Screens/no_bank_account_screen.dart';
import 'package:qr_city/Views/Screens/notificationScreen.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:qr_city/Views/Widgets/store_Item.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  BuildContext navBarContext;

  HomeScreen({required this.navBarContext});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool menuShowingState = false;

  void modalBottomSheetMenu() {
    showModalBottomSheet(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.h), topLeft: Radius.circular(5.h)),
        ),
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.all(1.h),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BlocConsumer<HomeFilterCubit, HomeFilterState>(
                listener: (context, state) {},
                builder: (context, state) {
                  HomeFilterCubit filterInst = HomeFilterCubit.get(context);
                  return Container(
                    height: 100.h,
                    color: Colors
                        .transparent, //could change this to Color(0xFF737373),
                    //so you don't have to change MaterialApp canvasColor
                    child: Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 5.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            pop(context);
                                          },
                                          child: Container(
                                            width: 5.h,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                              color: Colors.red.withOpacity(.5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                FontAwesomeIcons.close,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          "تصفية حسب",
                                          style: TextStyle(
                                            color: kBlue,
                                            fontFamily: "Taga",
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomTextButton(
                                        buttonColor: kLightWhite,
                                        roundedBorder: 1.h,
                                        vPadding: .1.h,
                                        textColor: kBlue,
                                        textSize: 15.sp,
                                        onPressed: () {},
                                        text: "إستعاده")
                                  ],
                                ),
                              ),
                              Divider(height: 2.h),
                              Container(
                                height: 5.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "التقييم العام",
                                        style: TextStyle(
                                          color: kBlue,
                                          fontFamily: "Taga",
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        CustomTextButton(
                                            buttonColor: kLightWhite,
                                            roundedBorder: 1.h,
                                            vPadding: 0,
                                            textColor:
                                                filterInst.filterRate == 0
                                                    ? kBlue
                                                    : Colors.grey,
                                            borderColor:
                                                filterInst.filterRate == 0
                                                    ? kBlue
                                                    : Colors.white,
                                            textSize: 15.sp,
                                            onPressed: () {
                                              filterInst.changeFilterRate(0);
                                            },
                                            text: "الأعلي أولا"),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        CustomTextButton(
                                            buttonColor: kLightWhite,
                                            roundedBorder: 1.h,
                                            vPadding: .1.h,
                                            textColor:
                                                filterInst.filterRate == 1
                                                    ? kBlue
                                                    : Colors.grey,
                                            borderColor:
                                                filterInst.filterRate == 1
                                                    ? kBlue
                                                    : Colors.white,
                                            textSize: 15.sp,
                                            onPressed: () {
                                              filterInst.changeFilterRate(1);
                                            },
                                            text: "الأقل أولا")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(height: 3.h),
                              Text(
                                "التصنيفات",
                                style: TextStyle(
                                  color: kBlue,
                                  fontFamily: "Taga",
                                  fontSize: 15.sp,
                                ),
                              ),
                              Divider(
                                height: 2.h,
                              ),
                              Container(
                                height: 30.h,
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مقاهي",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.coffeeFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changCoffeeFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "مطاعم",
                                            style: TextStyle(
                                                color: kBlue,
                                                fontSize: 12.sp,
                                                fontFamily: "Taga"),
                                          ),
                                          Checkbox(
                                              activeColor: kDarkBlue,
                                              value: filterInst.restFilter,
                                              onChanged: (val) {
                                                filterInst
                                                    .changeRestFilter(val!);
                                              })
                                        ],
                                      ),
                                      SizedBox(
                                        height: 7.h,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Positioned(
                              bottom: 0,
                              left: 5.w,
                              right: 5.w,
                              child: CustomTextButton(
                                  buttonColor: kDarkBlue,
                                  textColor: Colors.white,
                                  roundedBorder: 1.h,
                                  buttonVerticalPaddingVal: 0,
                                  buttonHorizontalPaddingval: 0,
                                  textSize: 12.sp,
                                  onPressed: () {
                                    pop(context);
                                  },
                                  text: "تصفيه"))
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 18.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 2.h,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 6.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: buildSearchTextFormField(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.w),
                            child: MaterialButton(
                                onPressed: () {
                                  modalBottomSheetMenu();
                                },
                                padding: EdgeInsets.all(0),
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: 0),
                                color: kBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1.5.h),
                                ),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/icons/filter.svg",
                                        width: 2.h,
                                        height: 3.h,
                                        color: Colors.white),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                  ],
                                ))),
                          )
                        ],
                      ),
                    ),
                  ),
                  buildAdsSlider(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.h,
                      bottom: 1.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "كل الفئات",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Taga",
                              fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                  buildCategoriesHorizontalList(),
                  buildCategoriesWithSomeItemsHorizontalList()
                ],
              ),
            ),
          ),
          buildHeader(widget.navBarContext),
          menuShowingState ? showMenu() : SizedBox(),
        ],
      ),
    );
  }

  showMenu() {
    return InkWell(
      onTap: () {
        setState(() {
          menuShowingState = false;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(.7),
        height: double.infinity,
        width: double.infinity,
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: double.infinity,
                width: 80.w,
                child: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.white,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                            top: -32.h,
                            left: 0,
                            right: 0,
                            child: Transform.scale(
                              scale: 3,
                              child: Container(
                                width: 50.h,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  color: kBlue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        menuShowingState = false;
                                      });
                                    },
                                    icon: Icon(
                                      FontAwesomeIcons.arrowRight,
                                      color: Colors.black,
                                      size: 25.sp,
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Container(
                                  width: 15.h,
                                  height: 15.h,
                                  decoration: BoxDecoration(
                                    color: kLightWhite,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(.5.h),
                                    child: Center(
                                        child: SvgPicture.asset(
                                      "assets/icons/user_image.svg",
                                      color: Colors.black,
                                      width: 5.h,
                                      height: 5.h,
                                    )),
                                    /*CircleAvatar(
                                      radius: 8.h,
                                      backgroundColor: kLightBlue,
                                      backgroundImage: AssetImage(
                                          "assets/images/person.jpeg"),
                                    )*/
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text("إسم المستخدم",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Taga",
                                    )),
                                Divider(),
                                Text("xxxxxxxxxx@gmail.com",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontFamily: "Taga",
                                    )),
                                Divider(),
                                Text("#345678",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.sp,
                                      fontFamily: "Taga",
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateToScreen(
                                        ctx: widget.navBarContext,
                                        nextScreen: MainProfileScreen());
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kLightWhite,
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 5.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/user_image.svg",
                                              width: 4.h,
                                              height: 4.w,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text("حسابي",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Taga",
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateToScreen(
                                        ctx: widget.navBarContext,
                                        nextScreen: NoBankAccountScreen());
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kLightWhite,
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 5.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/icons/bank.svg",
                                              width: 4.h,
                                              height: 4.w,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text("معلومات الحساب البنكي",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Taga",
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateToScreen(
                                        ctx: widget.navBarContext,
                                        nextScreen: FavoritesScreen(
                                            navBarContext:
                                                widget.navBarContext));
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kLightWhite,
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 5.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.heart,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text("مفضلاتي",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Taga",
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                  height: 8.h,
                                  width: 8.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      border: Border.all(color: Colors.red)),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.signOut,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text("تسجيل الخروج",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                      fontFamily: "Taga",
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildSearchTextFormField() {
    return SizedBox(
      height: 8.h,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SquareTextField(
          textLetterSpaceing: 0,
          preFixWidget: Icon(
            Icons.search,
            color: kLightBlue,
          ),
          hintText: "",
          hintStyle: TextStyle(
              color: Colors.grey, fontFamily: "Taga", fontSize: 12.sp),
          fillColor: Colors.transparent,
          /*controller: inst.phoneNumberController,*/
          onChanged: (phone) {},
          keyBoardType: TextInputType.text,
        ),
      ),
    );
  }

  Padding buildAdsSlider() {
    return Padding(
      padding: EdgeInsets.all(.5.h),
      child: Container(
        height: 19.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.h),
            border: Border.all(color: kLightWhite, width: 2)),
        child: ImageSlideshow(
          /// Width of the [ImageSlideshow].
          width: double.infinity,

          /// Height of the [ImageSlideshow].
          height: 18.h,

          /// The page to show when first creating the [ImageSlideshow].
          initialPage: 0,

          /// The color to paint the indicator.
          indicatorColor: kDarkBlue,

          /// The color to paint behind th indicator.
          indicatorBackgroundColor: Colors.white,

          /// The widgets to display in the [ImageSlideshow].
          /// Add the sample image file into the images folder
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2.h),
              child: Image.asset(
                'assets/images/ad1.png',
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(2.h),
              child: Image.asset(
                'assets/images/ad2.png',
                fit: BoxFit.fill,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(2.h),
              child: Image.asset(
                'assets/images/ad3.png',
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(2.h),
              child: Image.asset(
                'assets/images/ad4.png',
                fit: BoxFit.fill,
              ),
            ),
          ],

          /// Called whenever the page in the center of the viewport changes.
          onPageChanged: (value) {},

          /// Auto scroll interval.
          /// Do not auto scroll with null or 0.
          autoPlayInterval: 3000,

          /// Loops back to first slide.
          isLoop: true,
        ),
      ),
    );
  }

  buildHeader(BuildContext navBarContext) {
    return Container(
      color: kLightWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      menuShowingState = true;
                    });
                  },
                  child: CircleAvatar(
                    radius: 13.sp,
                    backgroundColor: kDarkBlue,
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: SvgPicture.asset(
                        "assets/icons/user_image.svg",
                        width: 5.h,
                        height: 5.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Expanded(
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "أهلا بك",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Taga",
                            fontSize: 12.sp)),
                    TextSpan(
                        text: "  إسلام الكومي",
                        style: TextStyle(
                            color: kDarkBlue,
                            fontFamily: "Taga",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp)),
                  ])),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(.5))),
                  child: GestureDetector(
                    onTap: () async {
                      navigateToScreen(
                          ctx: widget.navBarContext,
                          nextScreen: NotificationScreen());
                    },
                    child: CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: SvgPicture.asset(
                          "assets/icons/notification.svg",
                          width: 5.h,
                          height: 5.h,
                          color: kDarkBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Container(
              width: double.infinity,
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.h),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/mylocation.svg",
                              width: 2.h, height: 2.h, color: kLightBlue),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "جده 3422 السعوديه",
                            style: TextStyle(
                              color: kBlue,
                              fontSize: 12.sp,
                              fontFamily: "Taga",
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                      onPressed: () {
                        navigateToScreen(
                            nextScreen: NearestStoresScreen(),
                            ctx: navBarContext);
                      },
                      color: kBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.5.h),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/find_nearest.svg",
                              width: 2.h, height: 3.h, color: Colors.white),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "عرض الأقرب",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: "Taga",
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    );
  }

  buildCategoriesHorizontalList() {
    List<Map<String, dynamic>> catList = [
      {
        "name": "مطاعم",
        "image": "assets/icons/rest.svg",
        "count": "211",
      },
      {
        "name": "مقاهي",
        "image": "assets/icons/coffe.svg",
        "count": "250",
      },
      {
        "name": "أسر منتجه",
        "image": "assets/icons/family.svg",
        "count": "75",
      },
      {
        "name": "ماركت",
        "image": "assets/icons/market.svg",
        "count": "305",
      },
      {
        "name": "شقق فندقيه",
        "image": "assets/icons/hotel.svg",
        "count": "124",
      },
      {
        "name": "منتزهات",
        "image": "assets/icons/park.svg",
        "count": "17",
      }
    ];

    return SizedBox(
      height: 12.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                navigateToScreen(
                    ctx: context,
                    nextScreen: CategoryScreen(name: catList[index]["name"]));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: kLightWhite,
                  borderRadius: BorderRadius.circular(1.h),
                ),
                width: 30.w,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        catList[index]["image"],
                        width: 4.h,
                        color: kBlue,
                        height: 4.h,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        catList[index]["name"].toString(),
                        style: TextStyle(
                            color: kDarkBlue,
                            fontSize: 12.sp,
                            fontFamily: "Taga"),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        catList[index]["count"].toString(),
                        style: TextStyle(
                            color: kDarkBlue,
                            fontSize: 12.sp,
                            fontFamily: "Taga"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, _) {
            return SizedBox(
              width: 5.w,
            );
          },
          itemCount: catList.length),
    );
  }

//TODO:------ Category With Some Items(Horizontal list) Vertical List --------
  SizedBox buildCategoriesWithSomeItemsHorizontalList() {
    return SizedBox(
      child: buildCategorySomeItemsHorizontalList(),
    );
  }

//.
//.
//.
//.
//.
//.
//.
//.
//TODO:------------ Items Of Certain Category horizontal List ----------------
  ListView buildCategorySomeItemsHorizontalList() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
            child: Column(
              children: [
                Container(
                  color: kLightWhite.withOpacity(.5),
                  child: Row(
                    children: [
                      Text(
                        "مطاعم",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: kDarkBlue,
                          fontFamily: "Taga",
                          fontSize: 15.sp,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        splashColor: kDarkBlue.withOpacity(.5),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "أعرض الكل",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              true
                                  ? SvgPicture.asset(
                                      "assets/icons/show_all.svg",
                                      width: 1.5.h,
                                      height: 1.5.h,
                                    )
                                  : Transform.rotate(
                                      angle: 180 * pi / 180,
                                      child: SvgPicture.asset(
                                        "assets/icons/show_all.svg",
                                        width: 1.5.h,
                                        height: 1.5.h,
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                    height: 29.h,
                    width: double.infinity,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, innerIndex) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 1.h),
                          child: FittedBox(
                            child: StoreItem(
                              isFavorite: false,
                              currentContext: context,
                              name: "ماكدونالدز",
                              desc: "أفضل مطعم يقدم البرجر طازج",
                              busineesID: 1,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, _) {
                        return SizedBox(
                          width: 1.w,
                        );
                      },
                      itemCount: 5,
                    )), // )
              ],
            ),
          );
        },
        separatorBuilder: (context, _) {
          return SizedBox(
            width: 2.h,
          );
        },
        itemCount: 5);
  }
}
