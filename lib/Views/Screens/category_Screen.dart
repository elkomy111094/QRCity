import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/View_Models/filter_view_model/home_filter_cubit.dart';
import 'package:qr_city/Views/Widgets/custom_text_button.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:qr_city/Views/Widgets/square_text_field.dart';
import 'package:qr_city/Views/Widgets/store_Item.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatefulWidget {
  String name;
  CategoryScreen({required this.name});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedCategory = 0;
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 5.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "تصفية حساب",
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
                                        textColor: filterInst.filterRate == 0
                                            ? kBlue
                                            : Colors.grey,
                                        borderColor: filterInst.filterRate == 0
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
                                        textColor: filterInst.filterRate == 1
                                            ? kBlue
                                            : Colors.grey,
                                        borderColor: filterInst.filterRate == 1
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
                                            filterInst.changCoffeeFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
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
                                            filterInst.changeRestFilter(val!);
                                          })
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Padding(
                    padding: EdgeInsets.only(top: 9.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 2.h,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 6.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                      child: buildSearchTextFormField(),
                                    ),
                                  ),
                                  MaterialButton(
                                      onPressed: () {
                                        modalBottomSheetMenu();
                                      },
                                      padding: EdgeInsets.all(0),
                                      visualDensity: VisualDensity(
                                          horizontal: 0, vertical: 0),
                                      color: kBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.5.h),
                                      ),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              "assets/icons/filter.svg",
                                              width: 2.h,
                                              height: 3.h,
                                              color: Colors.white),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                        ],
                                      )))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            " كل ال${widget.name}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Taga",
                                fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          buildSubCategoriesHorizontalList(),
                          SizedBox(
                            height: 2.h,
                          ),
                          Center(
                            child: Container(
                              height: 64.h,
                              width: 95.w,
                              child: buildCategorySomeItemsVertiacalList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SimpleHeader(headerTitle: widget.name),
              ],
            ),
          ),
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
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: SizedBox(
        height: 5.h,
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

  buildCategorySomeItemsVertiacalList() {
    return SizedBox(
        height: 25.h,
        width: double.infinity,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, innerIndex) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: SizedBox(
                height: 30.h,
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
        ));
  }
}
