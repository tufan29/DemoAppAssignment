import 'package:flutter/material.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/helper/app_font_size.dart';
import 'package:projects/src/feature/home/Model/company_list_model.dart';
import 'package:projects/src/feature/home/Model/user_list_model.dart';
import 'package:projects/src/feature/home/ui/home_screen.dart';
import 'package:projects/src/feature/home/ui/user_details_pages.dart';
import 'package:projects/src/feature/splash/ui/splash_screen.dart';

class RouteGenerator {
  static const kSplash = "/";
  static const kHomePage = "/HomeScreen";
  static const kUserDetailsPages = "/UserDetailsPages";

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case kSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case kHomePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
   case kUserDetailsPages:
     if(args is Map<String, dynamic> ) {
        return MaterialPageRoute(builder: (_) =>  UserDetailsPages(userDetails: args ["isUserDetails"]?args ["data"]:UserListModel(), isUserDetails:  args ["isUserDetails"], companyDetails:args ["isUserDetails"]?CompanyListModel():  args ["data"],));
    }else{
    return _errorRoute();
    }
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Error",
            style: Theme.of(_)
                .textTheme
                .displayMedium
                ?.copyWith(color: AppColors.colorBlack),
          ),
        ),
        body: Center(
          child: Text(
            "Oops something went wrong",
            style: Theme.of(_).textTheme.displayMedium?.copyWith(
                fontSize: AppFontSize.textExtraLarge,
                color: AppColors.colorBlack),
          ),
        ),
      );
    });
  }
}
