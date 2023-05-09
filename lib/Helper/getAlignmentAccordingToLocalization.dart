import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Alignment getBottomAlignmentAccordingToLang({required BuildContext context}) {
  print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
  print(context.locale.languageCode.toString());

  if (context.locale.languageCode == "en") {
    return Alignment.bottomLeft;
  } else if (context.locale.languageCode == "ar") {
    return Alignment.bottomRight;
  } else {
    return Alignment.bottomRight;
  }
}
