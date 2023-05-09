import 'package:flutter/material.dart';

void pop(BuildContext context) {
  Navigator.of(context).pop();
}

void navigateToScreen({required BuildContext ctx, required Widget nextScreen}) {
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_) => nextScreen));
}

void navigateToScreenAndReplacment(
    {required BuildContext ctx, required Widget nextScreen}) {
  Navigator.of(ctx)
      .pushReplacement(MaterialPageRoute(builder: (_) => nextScreen));
}

void navigateToScreenAndRemoveAll(
    {required BuildContext ctx, required Widget nextScreen}) {
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => nextScreen), (route) => false);
}
