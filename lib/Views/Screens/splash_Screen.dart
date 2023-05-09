import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:qr_city/Helper/routing_functions.dart';
import 'package:qr_city/Views/Screens/choose_language_screen.dart';
import 'package:qr_city/Views/Screens/onboarding_screen.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool logoAppearance = false;

  @override
  // ignore: must_call_super
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        navigateToScreenAndReplacment(
            ctx: context, nextScreen: OnBoarding());
      }
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          logoAppearance = !logoAppearance;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setEnabledSystemUIOverlays([]);*/
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: kDarkBlue,
          child: Center(
            child: AnimatedLogo(logoAppearance: logoAppearance),
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    Key? key,
    required this.logoAppearance,
  }) : super(key: key);

  final bool logoAppearance;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: logoAppearance ? 20.h : 0,
      width: logoAppearance ? 50.w : 0,
      duration: const Duration(seconds: 3),
      curve: Curves.easeInOut,
      child: SvgPicture.asset(
        "assets/icons/logo.svg",
        color: Colors.white,
        height: logoAppearance ? 20.h : 0,
        width: logoAppearance ? 50.w : 0,
      ),
    );
  }
}
