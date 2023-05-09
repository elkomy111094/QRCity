// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "login": "تسجيل الدخول",
  "Skip": "تخطي",
  "StartNow": "أبداء الأن",
  "next": "التالي",
  "PhoneNumber": " رقم الهاتف ",
  "Password": "كلمة المرور",
  "AreYouForgetPassword": "هل نسيت كلمة المرور ؟",
  "Enter": "دخول",
  "CreateAccount": "إنشاء حساب",
  "YouHaveNotAccount": "ليس لديك حساب ؟",
  "OrLoginFromYour": "أو تسجيل الدخول عبر",
  "Welcome": "أهلا بعودتك",
  "register": "تسجيل",
  "youAlreadyHaveAccount": "لديك حساب بالفعل ؟"
};
static const Map<String,dynamic> en = {
  "login": "Login",
  "Skip": "Skip",
  "StartNow": "Start Now",
  "next": "Next",
  "PhoneNumber": "Phone Number",
  "Password": "Password",
  "AreYouForgetPassword": "Are You Forget Your Password ?",
  "Enter": "Enter",
  "CreateAccount": "CreateAccount",
  "YouHaveNotAccount": "If You Haven't Account ?",
  "OrLoginFromYour": "Or Login From Your",
  "Welcome": "Welcome",
  "register": "Register",
  "youAlreadyHaveAccount": "You Already Have Account ? "
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
