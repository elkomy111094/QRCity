import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Widgets/best_product.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/custom_text_icon_button.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class StoreDetailsScreen extends StatefulWidget {
  @override
  _StoreDetailsScreenState createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  int selectedCategory = 0;
  void BestSellingBottomSheet() {
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                    ),
                    child: Row(
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
                          width: 3.w,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Text("الأكثر مبيعا",
                                style: TextStyle(
                                  color: kBlue,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: 25.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, innerIndex) {
                        return BestProduct();
                      },
                      separatorBuilder: (context, _) {
                        return SizedBox(
                          width: 1.w,
                        );
                      },
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void RateStoreBottomSheet() {
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/ratingbg.svg"),
                    SizedBox(
                      height: 2.h,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SquareTextField(
                      hintText: "",
                      fillColor: Colors.transparent,
                      maxLines: 5,
                      labelText: "أكتب رأيك هنا",
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CustomTextButton(
                        buttonColor: kDarkBlue,
                        textColor: Colors.white,
                        textSize: 12.sp,
                        roundedBorder: 1.h,
                        onPressed: () {
                          pop(context);
                          suceesRateBottomSheet();
                        },
                        text: "أضف تقييمي"),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void suceesRateBottomSheet() {
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
              child: Container(
                height: 50.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.h,
                      height: 30.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kLightBlue),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/present.gif"),
                          )),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "تهانينا لك حصلت علي 4 نقاط",
                      style: TextStyle(
                        fontFamily: "Taga",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: kDarkBlue,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              //Todo:BackGround Store Cover Image
              Stack(
                children: [
                  Container(
                    height: 30.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/images/ad1.png"),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 5.h,
                          height: 5.h,
                          decoration: BoxDecoration(
                            color: kLightWhite,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {},
                          child: CircleAvatar(
                            radius: 2.5.h,
                            backgroundColor: kLightWhite,
                            child: const Center(
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //Todo: ForeGround : Components
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Todo : favorite And BackButton

                    //Todo : Your Points In This Store
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.5),
                              borderRadius: BorderRadius.circular(2.h),
                              border: Border.all(color: Colors.white)),
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "ماكدونالدز",
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontFamily: "Taga",
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5)),
                                ]),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    //Todo :Card Contents
                    buildStoreDetailsCard(),
                    CustomTextIconButton(
                        icon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.white,
                        ),
                        buttonColor: kDarkBlue,
                        textColor: Colors.white,
                        buttonHorizontalPaddingval: 5.w,
                        roundedBorder: 1.h,
                        textSize: 12.sp,
                        onPressed: () {
                          BestSellingBottomSheet();
                        },
                        text: "عرض الأكثر مبيعا"),
                    Expanded(
                      child: buildDefaultTabController(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildStoreDetailsCard() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 95.w,
          child: Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.h),
                side: BorderSide(
                  color: kDarkBlue,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Products Provider details
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 6.h,
                          width: 6.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: kDarkBlue),
                            borderRadius: BorderRadius.circular(100.h),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/macLogo.png",
                              fit: BoxFit.contain,
                              width: 4.h,
                              height: 4.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "ماكدونالدز",
                                        style: TextStyle(
                                          color: kBlue,
                                          fontFamily: "Taga",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        )),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: RichText(
                                          text: TextSpan(
                                              text: "4.4 KM",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 2.h,
                                      child: Center(
                                          child: SvgPicture.asset(
                                        "assets/icons/distance.svg",
                                        fit: BoxFit.fill,
                                        height: 2.h,
                                        width: 2.h,
                                      )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(.2),
                                      borderRadius:
                                          BorderRadius.circular(10.h)),
                                  child: Padding(
                                    padding: EdgeInsets.all(.3.h),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                                text: "4.4",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black))),
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                          size: 15.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 2.h,
                                  width: 2.h,
                                  child: Center(
                                      child: SvgPicture.asset(
                                    "assets/icons/home.svg",
                                    fit: BoxFit.fill,
                                    height: 3.h,
                                    width: 3.h,
                                  )),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "مفتوح من ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 8.sp,
                                              fontFamily: "Taga")),
                                      TextSpan(
                                          text: "AM ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8.sp,
                                          )),
                                      TextSpan(
                                          text: "8:00",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.sp,
                                              fontFamily: "Taga")),
                                      TextSpan(
                                          text: "  الي ",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 8.sp,
                                              fontFamily: "Taga")),
                                      TextSpan(
                                          text: "PM ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8.sp,
                                          )),
                                      TextSpan(
                                          text: "12.00 ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8.sp,
                                              fontFamily: "Taga")),
                                    ]))
                              ],
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: SizedBox(
                            child: RichText(
                                overflow: TextOverflow.fade,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "عن المتجر\n",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp)),
                                  TextSpan(
                                      text: "أفضل مطعم يقدم البرجر طازج",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Taga",
                                          fontSize: 10.sp)),
                                ])),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          children: [
                            buildSocialMediaIconButton(
                                color: kDarkBlue,
                                icon: FontAwesomeIcons.share,
                                onPressed: () async {}),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text("مشاركة",
                                style: TextStyle(
                                    color: kBlue,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp)),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: kLightWhite,
                            borderRadius: BorderRadius.circular(5.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: .5.h),
                            child: Center(
                                child: Text("مشويات",
                                    style: TextStyle(
                                        color: kBlue,
                                        fontFamily: "Taga",
                                        fontSize: 12.sp))),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: kLightWhite,
                            borderRadius: BorderRadius.circular(5.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: .5.h),
                            child: Center(
                                child: Text("حلويات",
                                    style: TextStyle(
                                        color: kBlue,
                                        fontFamily: "Taga",
                                        fontSize: 12.sp))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: "للتواصل",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp)),
                        ),
                        Expanded(
                          child: Center(
                            child: SizedBox(
                              height: 6.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildSocialMediaIconButton(
                                      color: Colors.green,
                                      icon: FontAwesomeIcons.whatsapp,
                                      onPressed: () async {}),
                                  buildSocialMediaIconButton(
                                      onPressed: () async {},
                                      color: Colors.tealAccent,
                                      icon: FontAwesomeIcons.twitter),
                                  buildSocialMediaIconButton(
                                      onPressed: () async {},
                                      color: Colors.orange,
                                      icon: FontAwesomeIcons.snapchat),
                                  buildSocialMediaIconButton(
                                      onPressed: () async {},
                                      color: Colors.purple,
                                      icon: FontAwesomeIcons.instagram)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Container(
                      height: 6.h,
                      width: 89.w,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(1.h),
                          border:
                              Border.all(color: Colors.grey.withOpacity(.2))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSocialMediaIconButton(
                                      color: kDarkBlue,
                                      icon: FontAwesomeIcons.mapMarkerAlt),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "الإتجاه للموقع",
                                        style: TextStyle(
                                            color: kDarkBlue,
                                            fontFamily: "Taga",
                                            fontSize: 10.sp)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              height: 5.h,
                              width: 1,
                              color: Colors.grey.withOpacity(.2)),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSocialMediaIconButton(
                                      color: kDarkBlue,
                                      icon: Icons.phone_in_talk_outlined),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                        text: "إتصال",
                                        style: TextStyle(
                                            color: kDarkBlue,
                                            fontFamily: "Taga",
                                            fontSize: 12.sp)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  //Products Provider Description
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  DefaultTabController buildDefaultTabController() {
    return DefaultTabController(
      length: 3 /*2*/,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: false,
            padding: EdgeInsets.all(0),
            indicatorColor: kDarkBlue,
            labelStyle: TextStyle(
                fontFamily: "Taga",
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
            unselectedLabelColor: Colors.black,
            labelColor: kDarkBlue,
            unselectedLabelStyle:
                TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
            onTap: (val) {},
            tabs: [
              Tab(
                /*icon: Image.asset(
                                  "assets/images/dues.png",
                                  height: 40,
                                  width: 40,
                                  color: duesTaped == true
                                      ? Colors.white
                                      : Colors.white70,
                                ),*/
                text: "قائمه المنتجات",
              ),
              Tab(
                /*icon: Image.asset(
                                  "assets/images/depts.png",
                                  height: 40,
                                  width: 40,
                                  */ /*color: debtsTaped == true ? Colors.white : Colors.white70,*/ /*
                                ),*/
                text: "الفروع",
              ),
              Tab(
                /*icon: Image.asset(
                                  "assets/images/depts.png",
                                  height: 40,
                                  width: 40,
                                  */ /*color: debtsTaped == true ? Colors.white : Colors.white70,*/ /*
                                ),*/
                text: "التقييمات",
              ),
            ],
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 0,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildProductListTabBody(),
            buildBranchesTabBody(),
            buildRatingsTabBody(),
          ],
        ),
      ),
    );
  }

  Center buildRatingsTabBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              height: 7.h,
              width: double.infinity,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: .5.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("إجمـــالي التقيـــيـــمات",
                                  style: TextStyle(
                                    color: kBlue,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Container(
                                height: 3.h,
                                width: 3.h,
                                child: Center(
                                  child: Icon(Icons.star,
                                      size: 10.sp, color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(1.h),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 2.h,
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Positioned(
                                          right: 6.w,
                                          child: Container(
                                            width: 10.w,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 2.h,
                                                  width: 2.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "assets/images/person.png"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 4.w,
                                          child: Container(
                                            width: 10.w,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 2.h,
                                                  width: 2.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "assets/images/person.png"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 2.w,
                                          child: Container(
                                            width: 10.w,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: 2.h,
                                                  width: 2.h,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: AssetImage(
                                                          "assets/images/person.png"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 2.h,
                                          width: 2.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  "assets/images/person.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 3.w),
                                  Text("200 تقييم",
                                      style: TextStyle(
                                        color: kBlue,
                                        fontFamily: "Taga",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Text(" 4.7 ",
                                  style: TextStyle(
                                    color: kBlue,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    CustomTextButton(
                        buttonColor: kDarkBlue,
                        textColor: Colors.white,
                        textSize: 12.sp,
                        roundedBorder: 1.h,
                        onPressed: () {
                          RateStoreBottomSheet();
                        },
                        text: "إضافة تقييم")
                  ],
                ),
              )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h),
                color: kLightWhite,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              height: 23.h,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 2.w, vertical: 1.h),
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 10.h,
                                    child: Padding(
                                      padding: EdgeInsets.all(.5.h),
                                      child: Image.asset(
                                          "assets/images/person.png"),
                                    ),
                                    decoration: BoxDecoration(
                                      color: kLightWhite,
                                      borderRadius: BorderRadius.circular(1.h),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 2.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("إسلام الكومي",
                                                  style: TextStyle(
                                                    color: kBlue,
                                                    fontFamily: "Taga",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              Text("جيد جدا",
                                                  style: TextStyle(
                                                    color: kBlue,
                                                    fontFamily: "Taga",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.orange
                                                        .withOpacity(.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1.h)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(.5.h),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      RichText(
                                                          text: TextSpan(
                                                              text: "4.4",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black))),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.orange,
                                                        size: 15.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("الاكل هنا أكثر من رائع",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: "Taga",
                                                    fontSize: 12.sp,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1.h,
                    );
                  },
                  itemCount: 5),
            ),
          )
        ],
      ),
    );
  }

  Container buildBranchesTabBody() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            child: Container(
              height: 7.h,
              width: double.infinity,
              child: Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/home.svg"),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("الفروع  (25)",
                        style: TextStyle(
                          color: kBlue,
                          fontFamily: "Taga",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              )),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.h),
                color: kLightWhite,
              ),
            ),
          ),
          Container(
            height: 21.h,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(1.h),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              accentColor: Colors.transparent,
                              indicatorColor: kDarkBlue,
                              backgroundColor: Colors.transparent),
                          child: ExpansionTile(
                            collapsedBackgroundColor: Colors.transparent,
                            title: Text(
                              "فرع جده",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  fontSize: 12.sp,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.transparent,
                            trailing: Icon(
                              FontAwesomeIcons.eye,
                              size: 12.sp,
                            ),
                            leading: SvgPicture.asset(
                              "assets/icons/mylocation.svg",
                              color: Colors.black,
                              width: 3.h,
                              height: 3.h,
                            ),
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "1253 جده ، السعوديه",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Taga",
                                          fontSize: 10.sp)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, _) => const SizedBox(),
                itemCount: 5),
          ),
        ],
      ),
    );
  }

  Center buildProductListTabBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSubCategoriesHorizontalList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Container(
              height: 24.h,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 12.h,
                      width: double.infinity,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 10.h,
                                    child: Padding(
                                      padding: EdgeInsets.all(.5.h),
                                      child: Image.asset(
                                          "assets/images/burger.png"),
                                    ),
                                    decoration: BoxDecoration(
                                      color: kLightWhite,
                                      borderRadius: BorderRadius.circular(1.h),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 2.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("دوبال ماك رويال",
                                                  style: TextStyle(
                                                    color: kBlue,
                                                    fontFamily: "Taga",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              Spacer(),
                                              Container(
                                                height: 4.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.orange
                                                        .withOpacity(.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.h)),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.w),
                                                    child: Text("5.5 SR",
                                                        style: TextStyle(
                                                          color: kBlue,
                                                          fontSize: 12.sp,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                              "قطع دجاج تقدم مع بطاطس وشيبسي وكانز بيبسي",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: "Taga",
                                                fontSize: 12.sp,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1.h,
                    );
                  },
                  itemCount: 5),
            ),
          )
        ],
      ),
    );
  }

  buildSubCategoriesHorizontalList() {
    List<Map<String, dynamic>> catList = [
      {
        "name": "دجاج",
      },
      {
        "name": "أسماك",
      },
      {
        "name": "أطباق جانبيه",
      },
      {
        "name": "فطار",
      },
      {
        "name": "غداء",
      },
      {
        "name": "عشاء",
      }
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .5.h),
      child: SizedBox(
        height: 4.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedCategory == index ? kBlue : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: .5.h),
                    child: Center(
                      child: Text(
                        catList[index]["name"].toString(),
                        style: TextStyle(
                            color:
                                selectedCategory == index ? kBlue : Colors.grey,
                            fontSize: 12.sp,
                            fontFamily: "Taga"),
                      ),
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
      ),
    );
  }

  Widget buildSocialMediaIconButton(
      {required Color color,
      required IconData icon,
      void Function()? onPressed}) {
    return Container(
      height: 5.h,
      width: 5.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 1),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Icon(
            icon,
            color: color,
            size: 12.sp,
          ),
        ),
      ),
    );
  }
}
