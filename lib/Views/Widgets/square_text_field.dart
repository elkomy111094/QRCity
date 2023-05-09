import 'package:flutter/material.dart';
import 'package:qr_city/Constants/colors.dart';
import 'package:sizer/sizer.dart';

class SquareTextField extends StatelessWidget {
  String hintText;
  Widget? suffixWidget;
  int? maxLines;
  Widget? preFixWidget;
  String? Function(String?)? validator;
  String? Function(String?)? onSubmit;
  final TextEditingController? phoneController;

  void Function(String)? onChanged;

  TextEditingController? controller;

  bool obsecureance;

  Brightness? keyBoardAppearance;

  TextInputType? keyBoardType;

  Color? fillColor;

  int? maxLength;

  String? prefixText;

  double? textLetterSpaceing;

  TextStyle? textStyle;

  TextStyle? hintStyle;

  TextAlign? textAlign;

  String labelText;

  SquareTextField({
    required this.hintText,
    this.labelText = "",
    this.textLetterSpaceing = 0.0,
    this.hintStyle,
    this.textStyle,
    this.maxLength,
    this.onSubmit,
    this.prefixText,
    this.textAlign,
    this.preFixWidget,
    this.fillColor = Colors.white60,
    this.maxLines = 1,
    this.phoneController,
    this.keyBoardType,
    this.controller,
    this.validator,
    this.keyBoardAppearance,
    this.obsecureance = false,
    this.suffixWidget,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: TextFormField(
          textAlign: textAlign ?? TextAlign.start,
          cursorColor: kDarkBlue,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyBoardType,
          keyboardAppearance: keyBoardAppearance,
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          obscuringCharacter: "•",
          obscureText: obsecureance,
          onFieldSubmitted: onSubmit,
          style: textStyle ??
              TextStyle(
                  color: Colors.black,
                  /*fontFamily: "Taga",*/
                  letterSpacing: textLetterSpaceing,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp),
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
            fillColor: fillColor,
            filled: true,
            contentPadding:
                EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            prefixText: prefixText,
            prefixStyle: TextStyle(
                color: kDarkBlue,
                fontWeight: FontWeight.bold,
                /*fontFamily: "Taga",*/
                fontSize: 13.sp),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.h),
                borderSide: BorderSide(
                  color: Colors.grey.withOpacity(.5),
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2.h),
                borderSide: BorderSide(color: kDarkBlue, width: 1)),
            hintText: hintText,
            counterText: "",
            suffixIcon: suffixWidget,
            alignLabelWithHint: true,
            floatingLabelStyle: TextStyle(
              fontSize: 16.sp,
              letterSpacing: 0,
              fontFamily: "Taga",
              color: kLightBlue,
            ),
            labelText: labelText,
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12.sp,
              letterSpacing: 0,
              fontFamily: "Taga",
            ),
            prefixIcon: preFixWidget,
            hintStyle:
                hintStyle ?? TextStyle(color: Colors.black26, fontSize: 15.sp),
          ),
        ),
      ),
    );
  }
}
