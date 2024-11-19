import 'package:flutter/material.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/helper/app_font_size.dart';


class AppDecoration {
  static final AppDecoration _instance = AppDecoration._internal();

  factory AppDecoration() {
    return _instance;
  }

  AppDecoration._internal();

  static  InputDecoration sFormField = InputDecoration(
    contentPadding:
    const EdgeInsets.only(left: 18.0, bottom: 15.0, top: 15.0,right: 18),
    filled: true,
   // fillColor: AppColors.colorTextBox,
    errorStyle: TextStyle(color: Colors.red,fontFamily: AppFontSize.appFontOpenSans,fontSize: AppFontSize.textMedium,),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color:AppColors.colorEditTextBorder, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.colorEditTextBorder, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),

    border:UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white,width: 5),
      borderRadius: BorderRadius.circular(12),
    ) ,
    errorBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color:Colors.transparent, width: 1.0),
    ),



    errorMaxLines: 1,
    floatingLabelStyle: const TextStyle(
        color: AppColors.colorWhite,
        fontSize: AppFontSize.textExtraLarge,
        fontFamily: AppFontSize.appFontOpenSans,
        fontWeight: FontWeight.w600),
    labelStyle: const TextStyle(
        color: AppColors.colorPrimaryText,
        fontSize: AppFontSize.textMedium,
        fontFamily: AppFontSize.appFontOpenSans,
        fontWeight: FontWeight.w400),
    hintStyle: TextStyle(
        color: AppColors.colorWhite.withOpacity(0.5),
        fontSize: AppFontSize.textMedium,
        fontFamily: AppFontSize.appFontOpenSans,
        height: 0,
        fontWeight: FontWeight.w400),
    helperMaxLines: 1,
  );

  static const formFieldDecorationForMultipleLine = InputDecoration(
    hintText: "Hint Here",

    hintStyle: TextStyle(
        color: AppColors.colorSecondaryText2,
        fontSize: AppFontSize.textMedium,
        fontFamily: 'SanPro',
        fontWeight: FontWeight.w400),
    helperMaxLines: 1,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16))),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(16))),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(16))),
  );
}