import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/store_details_screen.dart';
import 'package:sizer/sizer.dart';

class StoreItem extends StatefulWidget {
  BuildContext currentContext;

  Widget? tabNavigateToScreen;

  bool isFavorite;

  String? name;

  String? desc;

  int busineesID;

  String? coverImage;

  String? logoImage;

  StoreItem(
      {required this.currentContext,
      this.name = "ماكدونالدز",
      required this.busineesID,
      this.logoImage,
      this.coverImage,
      this.tabNavigateToScreen,
      this.desc = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      this.isFavorite = false});

  @override
  State<StoreItem> createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  void Function()? onTapFavoriteButton;
  bool idInFavList = false;
  bool idInUnFavList = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      child: InkWell(
        onTap: () {
          navigateToScreen(ctx: context, nextScreen: StoreDetailsScreen());
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.5.h),
            /*side: BorderSide(color: Colors.black.withOpacity(.3), width: 1),*/
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //TODO:-----------Cover Image & Favorite Button-----------
                  Stack(
                    children: [
                      widget.coverImage != null
                          ? Container(
                              height: 17.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: kDarkBlue,
                                  borderRadius: BorderRadius.circular(1.5.h),
                                  border:
                                      Border.all(color: kDarkBlue, width: 1)),
                              child: Center(
                                child: Text(
                                  "لاتوجد صورة غلاف",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Taga",
                                      fontSize: 15.sp),
                                ),
                              ),
                            )
                          : Container(
                              height: 17.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kLightWhite, width: 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1.5.h),
                                    bottomLeft: Radius.circular(1.5.h),
                                    bottomRight: Radius.circular(1.5.h),
                                    topRight: Radius.circular(1.5.h)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.h),
                                child: Image.asset("assets/images/ad1.png",
                                    fit: BoxFit.fill),
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {},
                              child: CircleAvatar(
                                radius: 2.5.h,
                                backgroundColor: kLightWhite,
                                child: ((widget.isFavorite || idInFavList) &&
                                        !(idInUnFavList))
                                    ? Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: SvgPicture.asset(
                                            "assets/icons/favorites.svg"),
                                      )
                                    : Center(
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                        ),
                                      ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kLightWhite,
                                  borderRadius: BorderRadius.circular(1.h)),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4.7",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: Colors.orangeAccent),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.orangeAccent,
                                        size: 2.h,
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 4.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            child: Center(
                              child: Text(
                                "مشويات - حلويات",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1.h)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                kLightBlue,
                                kBlue,
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //TODO:-------------Loogo Image &  Distance---------------
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: kDarkBlue, width: 1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: CircleAvatar(
                              backgroundColor: widget.logoImage == null
                                  ? kDarkBlue
                                  : Colors.white,
                              child: widget.logoImage == null
                                  ? Padding(
                                      padding: EdgeInsets.all(1.h),
                                      child: SvgPicture.asset(
                                          "assets/icons/store.svg",
                                          fit: BoxFit.contain,
                                          width: 4.h,
                                          height: 4.h,
                                          color: Colors.white),
                                    )
                                  : Center(
                                      child: Container(
                                        height: 4.5.h,
                                        width: 4.5.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0)),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2.h),
                                          child: SvgPicture.asset(
                                              "assets/icons/store.svg",
                                              fit: BoxFit.contain,
                                              width: 4.h,
                                              height: 4.h,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: Text(
                            widget.name!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Taga",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/distance.svg",
                              width: 2.h,
                              height: 2.h,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "4.4KM",
                              style: TextStyle(
                                  color: Colors.deepPurpleAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //.
                  //TODO:----------------- Store Details -------------------
                  Padding(
                    padding: EdgeInsets.only(right: 5.w, left: 5.w),
                    child: Text(
                      widget.desc!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: "Taga",
                          color: Colors.grey.shade500),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    )

        /*BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ;
      },
    )*/
        ;
  }
}
