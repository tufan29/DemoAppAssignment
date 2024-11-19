import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/helper/app_styles.dart';




class CommonWidgets {
  static final CommonWidgets _instance = CommonWidgets._internal();

  factory CommonWidgets() {
    return _instance;
  }

  CommonWidgets._internal();

  // ignore: prefer_function_declarations_over_variables
  Function showAppSnackBar = ({required String? message, bool showButton = false}) {
    return SnackBar(
      content: Text(
        message ?? "",
        style: AppStyles.sTextNormal.copyWith(color: AppColors.colorWhite),
      ),
      backgroundColor: AppColors.colorTextButton,
      /*action: SnackBarAction(
        label: "CLOSE",
        textColor: AppColors.colorWhite,
        onPressed: () {},
      ),*/
    );
  };

  Future<DateTime> selectDate(
      {required BuildContext context,
      required DateTime selectedDate,
      Function(DateTime?)? selected,
      DateTime? firstDate,
      DateTime? lastDate}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: firstDate ?? DateTime(1999, 8),
        lastDate: lastDate ?? DateTime(2100));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    return selectedDate;
  }


}
