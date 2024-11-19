import 'package:flutter/material.dart';
import 'package:projects/src/core/utils/helper/app_font_size.dart';

import 'app_colors.dart';

class AppStyles {
  static final AppStyles _instance = AppStyles._internal();

  factory AppStyles() {
    return _instance;
  }

  AppStyles._internal();

  static const sTextNormal = TextStyle(
      color: AppColors.colorPrimaryText,
      fontSize: AppFontSize.textMedium,
      fontFamily: 'SanPro',
      fontWeight: FontWeight.w400);
}
