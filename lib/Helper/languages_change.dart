import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future changeLanguage(
    {required String code, required BuildContext context}) async {
  switch (code) {
    case "ar":
      if (context.locale.toString() == "ar") {
        return;
      } else {
        await context.setLocale(Locale("ar"));
        return;
      }

    case "en":
      if (context.locale.toString() == "en") {
        return;
      } else {
        await context.setLocale(Locale("en"));
        return;
      }
      return;
  }
}
