import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/helper/app_font_size.dart';



class CommonButton extends StatelessWidget {
  final String? label;
  late Function()? onClicked;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final List<Color>? gradColor;
  final Color? borderColor;
  final double borderRadius;
  final Color? solidColor;
  final double? fontSize;
  final double? buttonHeight;
  final double? buttonWidth;
  final bool? isLoading;
  final bool? isOnBounce;

  CommonButton(
      {this.label,
        this.onClicked,
        this.labelColor,
        this.gradColor,
        this.solidColor,
        this.borderColor,
        this.borderRadius = 12.0,
        this.fontSize,
        this.buttonHeight = 50.0,
        this.buttonWidth,
        this.labelFontWeight,
        this.isLoading,
        this.isOnBounce=true,
        Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (isLoading ?? false)
        ? const Center(
        child: CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation<Color>(AppColors.colorButton)))
        : Bounce(
        duration:  Duration(milliseconds: (isOnBounce ?? true)?200:0),
        onPressed: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          if (onClicked != null) onClicked!();
        },
        child: Container(
          // alignment: Alignment.center,

          height: buttonHeight,
          width: buttonWidth,
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
          decoration: BoxDecoration(
              gradient: solidColor == null
                  ? LinearGradient(

                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradColor ?? [  Color(0xffAED0D7),
                    //AppColors.colorPrimaryText2,
                    Color(0xff00A7C7),])
                  : null,
              color: solidColor,
              border: borderColor != null
                  ? Border.all(
                color: borderColor!,
                width: 1.0,
              )
                  : null,
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          child: Center(
            child: Text(
              label ?? "",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: labelColor ?? AppColors.colorWhite,
                  fontFamily: AppFontSize.appFontOpenSans,
                  fontSize: fontSize ?? 18,
                  fontWeight:labelFontWeight?? FontWeight.w400),
            ),
          ),
        ));
  }
}
