import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Views/Widgets/offer_item.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:sizer/sizer.dart';

class OffersScreen extends StatefulWidget {
  BuildContext navBarContext;

  OffersScreen({required this.navBarContext});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  int selectedCategory = 0;

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
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                          bottom: 1.h,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "كل العروض",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Taga",
                                  fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 53.h,
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return OfferItem(
                                currentContext: context,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 1.h,
                              );
                            },
                            itemCount: 5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SimpleHeader(headerTitle: "العروض", showPopIconButton: false),
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SizedBox(
        height: 12.h,
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
                    color: selectedCategory == index ? kBlue : kLightWhite,
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
                          color: selectedCategory == index
                              ? Color(0xffffffff)
                              : kBlue,
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          catList[index]["name"].toString(),
                          style: TextStyle(
                              color: selectedCategory == index
                                  ? Color(0xffffffff)
                                  : kDarkBlue,
                              fontSize: 12.sp,
                              fontFamily: "Taga"),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          catList[index]["count"].toString(),
                          style: TextStyle(
                              color: selectedCategory == index
                                  ? Color(0xffffffff)
                                  : kDarkBlue,
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
      ),
    );
  }
}
