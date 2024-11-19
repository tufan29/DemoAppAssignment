
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projects/src/core/apiHelper/common/locator.dart';
import 'package:projects/src/core/services/route_generator.dart';
import 'package:projects/src/core/services/shared_pref/shared_pref.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/screen_utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  final SharedPref _pref = getIt<SharedPref>();
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome()  {
     Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(RouteGenerator.kHomePage);
    }); // Duration of splash
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return  Scaffold(body:SizedBox(
      width: ScreenUtils().screenWidth(context),
      height: ScreenUtils().screenHeight(context),
      child: Container(
        color: AppColors.colorWhite,
       child:  Center(
         child: Image.asset(
           //'https://img.freepik.com/premium-vector/color-icon_609277-3347.jpg',
            "assets/images/icons/logo.png",
            height: 200,
            width: 200,
          ),
       ),

      ),
    ));
  }

}
