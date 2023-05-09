import 'package:flutter/material.dart';
import 'package:qr_city/Views/Widgets/notification_item.dart';
import 'package:qr_city/Views/Widgets/simple_Header.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  int unReadedNotificationsNumber;

  NotificationScreen({this.unReadedNotificationsNumber = 0});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: SizedBox(
                    height: 90.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      //TODO:Paginator
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return NotificationItem();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 1.h,
                            );
                          },
                          itemCount: 20),
                    ),
                  ),
                ),
                SimpleHeader(
                  headerTitle: "الإشعارات",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
