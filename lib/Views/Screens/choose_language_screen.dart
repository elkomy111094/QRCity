import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/onboarding_screen.dart';
import 'package:qr_city/translations/local_keys.g.dart';
import 'package:sizer/sizer.dart';

class ChooseLanguageScreen extends StatefulWidget {
  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LocaleKeys.login.tr()),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                  child: Text("English"),
                  onPressed: () async {
                    setState(() {
                      context.setLocale(Locale("en")).then((value) {
                        setState(() {});
                        navigateToScreen(
                            ctx: context, nextScreen: OnBoarding());
                      });
                    });
                  }),
              SizedBox(
                width: 10.w,
              ),
              MaterialButton(
                  child: Text("العربيه"),
                  onPressed: () async {
                    await context.setLocale(Locale("ar")).then((value) {
                      setState(() {});
                      navigateToScreen(ctx: context, nextScreen: OnBoarding());
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
