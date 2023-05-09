import 'package:flutter/material.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:qr_city/Views/Widgets/store_Item.dart';
import 'package:sizer/sizer.dart';

class FavoritesScreen extends StatefulWidget {
  BuildContext navBarContext;

  FavoritesScreen({required this.navBarContext});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 9.h),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Container(
                          height: 85.h,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 30.h,
                                  child: StoreItem(
                                    currentContext: context,
                                    busineesID: index,
                                    isFavorite: true,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 1.h,
                                );
                              },
                              itemCount: 5),
                        ),
                      ),
                    ),
                  ],
                ),
                SimpleHeader(
                  headerTitle: "المفضله",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
