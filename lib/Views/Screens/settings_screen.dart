import 'package:flutter/material.dart';
import 'package:qr_city/Views/Widgets/more_item_card.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatefulWidget {
  BuildContext navBarContext;

  SettingsScreen({required this.navBarContext});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    //header
                    /*MoreItemCard(
                        title: "المحفظه",
                        iconUrl: "assets/icons/paymentIcon.svg",
                        onTabButton: () {
                          pushToStack(widget.navBarScreenContext, WalletScreen());
                        }),*/

                    MoreItemCard(
                        title: "المفضله",
                        iconUrl: "assets/icons/empty-heart.svg",
                        onTabButton: () {}),
                    SizedBox(
                      height: 1.h,
                    ),
                    MoreItemCard(
                        title: "اللغة",
                        iconUrl: "assets/icons/language.svg",
                        onTabButton: () {}),
                    SizedBox(
                      height: 1.h,
                    ),
                    MoreItemCard(
                        title: "الدعم و المساعده",
                        iconUrl: "assets/icons/help.svg",
                        onTabButton: () {}),
                    SizedBox(
                      height: 1.h,
                    ),
                    MoreItemCard(
                        title: "سياسة الخصوصيه",
                        iconUrl: "assets/icons/policy.svg",
                        onTabButton: () {}),
                    SizedBox(
                      height: 1.h,
                    ),
                    MoreItemCard(
                        title: "الشروط والأحكام",
                        iconUrl: "assets/icons/conditions.svg",
                        onTabButton: () {}),
                  ],
                ),
              ),
            ),
            SimpleHeader(
              headerTitle: "الإعدادت",
              showPopIconButton: false,
            ),
          ],
        ),
      ),
    );
  }
}
