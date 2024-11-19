import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:projects/src/core/utils/helper/app_colors.dart';
import 'package:projects/src/core/utils/helper/app_font_size.dart';
import 'package:projects/src/core/utils/helper/app_strings.dart';
import 'package:projects/src/feature/common_widget/common_button.dart';

import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';

import 'package:url_launcher/url_launcher.dart';

class CommonUtils {
  static final CommonUtils _instance = CommonUtils._internal();

  factory CommonUtils() {
    return _instance;
  }

  CommonUtils._internal();

  // ignore: prefer_function_declarations_over_variables
  final validateEmail =
      (String email) => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  // ignore: prefer_function_declarations_over_variables
  final validatePhone = (String phone) => RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phone);

  // ignore: prefer_function_declarations_over_variables
  final validateMinChar = (String str) => str.length <= 7;



  var parsedToDateTime = (String? dateStr) => dateStr != null ? DateTime.parse(dateStr) : DateTime.now();


  static DateTime parseDateString(String? dateStr) {
    return dateStr != null ? DateTime.parse(dateStr) : DateTime.now();
  }

  static String formatDate({required String dateTime}) {
    DateTime date = DateTime.parse(dateTime);
    return dateTime == ""?"":DateFormat("MMM dd").format(date);
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static const String DATE_FORMAT = "yyyy-MM-dd";
  static const String DATE_dd_MM_yyyy = "dd-MM-yyyy";



  Future<String>latLongToAddressConverter({required String lat, required String long})async{
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${lat},${long}&key=AIzaSyCKUX3s-w62ksNOgXEY8vwJ4wg2Cnlr7pU";
String address = "";
    Dio dio = new Dio();
    try {
      Response response = await dio.get(url,
          queryParameters: {          });
      if (response.statusCode == 200) {

        print("location="+response.data.toString());
        address = response.data["results"][0]["formatted_address"].toString();

  return address ;
      } else {

        Fluttertoast.showToast(msg: "Oops, something went wrong. Please try again later .response statusCode is "+response.statusCode.toString());
        throw Exception("Error");
      }
    } catch (e) {

      Fluttertoast.showToast(msg: "Oops, something went wrong. Please try again later");
      throw Exception(e.toString());
    }
  }


  // ignore: prefer_function_declarations_over_variables
  final addLeadingZero = ({required int num, int? digits}) =>
      num.toString().padLeft(digits ?? 2, "0");


  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }
    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }



  static const List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];



  Map<String, Menu> menuMapCustomer = {
    AppStrings.myProfile: Menu(name: AppStrings.myProfile, path: 'menu_my_profile'),
    AppStrings.riskProfile: Menu(name: AppStrings.riskProfile, path: 'risk_profile_icon'),
    AppStrings.loyaltyPoints: Menu(name: AppStrings.loyaltyPoints, path: 'menu_blog'),
    AppStrings.conversation: Menu(name: AppStrings.conversation, path: 'menu_conversation'),
    AppStrings.logout: Menu(name: AppStrings.logout, path: 'menu_logout')
  };

  Map<String, Menu> menuMapGuest = {
    AppStrings.logout: Menu(name: AppStrings.login, path: 'menu_login')
  };

  Map<String, Menu> menusAdvisor = {
    AppStrings.myProfile: Menu(name: AppStrings.myProfile, path: 'menu_my_profile'),
  };

  ////////////
  final List<Menu> menuGuest = [
    Menu(name: AppStrings.myProfile, path: 'menu_my_profile'),
  ];

  final List<Menu> menuCustomer = [
    Menu(name: AppStrings.myProfile, path: 'menu_my_profile'),
    Menu(name: AppStrings.riskProfile, path: 'risk_profile_icon'),
    Menu(name: AppStrings.loyaltyPoints, path: 'menu_blog'),
    Menu(name: AppStrings.conversation, path: 'menu_conversation'),
    Menu(name: AppStrings.logout, path: 'menu_logout')
  ];


  ////////////

  static const Map<String, String> regexPatterns = <String, String>{
    'age': r'^100|[1-9]?\d$',
    'phone': r'(^[6-9]\d{9}$)',
    'pan': r'^([A-Z]){5}([0-9]){4}([A-Z]){1}?$',
    'pincode': r'^[1-9][0-9]{5}$',
    'ifsc': r'^[A-Za-z]{4}[a-zA-Z0-9]{7}$',
    'yesBankIfsc': r'^(YESB|yesb)[a-zA-Z0-9]{7}$',
    'otp': r'^(0|[1-9][0-9]*)$',
    'email':
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    'gst':
        r'^([0]{1}[1-9]{1}|[1-2]{1}[0-9]{1}|[3]{1}[0-7]{1})([a-zA-Z]{5}[0-9]{4}[a-zA-Z]{1}[1-9a-zA-Z]{1}[zZ]{1}[0-9a-zA-Z]{1})+$',
    'cin': r'([L|U]{1})([0-9]{5})([A-Za-z]{2})([0-9]{4})([A-Za-z]{3})([0-9]{6})$',
    'bankAccount': r'^\d{9,18}$',
    'positiveInteger': r'^[0-9]*[1-9][0-9]*$',
    'currencyToNumber': r'[₹,]',
    'name': r'^[A-Za-z]+$',
    'fullName': r'^[a-zA-Z ]*$',
    'firstMiddleLastName': r"^([a-zA-Z]{2,}\s[a-zA-z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)",
    'whitelistingRegex': '^[a-zA-Z0-9]*',
    'emoticon': r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
    'upiId': r'^[\w.-]+@[\w.-]+$',
    'bbpsAmountInput': r'[0-9.]',
    'adhaarCard': r'^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$',
    'minMaxLength': r'^.{3,26}$',
    'base64': r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$'
  };

  static String imageFileToBase64(String path) {
    Uint8List imgFile = File(path).readAsBytesSync();
    return base64Encode(imgFile);
  }
  static void launchURL({required String url}) async {
    try {
      final Uri urlpath = Uri.parse(url);
      if (!await launchUrl(urlpath)) {
      }
    }catch (e){
      Fluttertoast.showToast(msg: "Url is not valid url");

    }
  }

  static void shareURLLink({required String url}) async {
    final result = await Share.shareWithResult(url, subject: 'Great picture');

    if (result.status == ShareResultStatus.success) {
      print('Thank you for sharing the picture!');
    }

  }
  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static Image stringToImage2(String value){
    if(RegExp(regexPatterns['base64']!).hasMatch(value)){
      return Image.memory(base64Decode(value));
    }else if(value.startsWith("http")){
      return Image.network(value);
    }else if(value.startsWith('assets')){
      return Image.asset(value);
    }else{
      return Image.file(File(value));
    }
  }
  static Widget stringToImage({required String value,double width = 0,double height = 0,double radius = 0,BoxFit fit = BoxFit.fill}){
    if(RegExp(regexPatterns['base64']!).hasMatch(value)){
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.memory(base64Decode(value)),
      );
    }else if(value.startsWith("http")){
    /*       ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.network(value,fit:fit,width: width,height :height ,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.network("https://www.mikimotoamerica.com/media/wysiwyg/mikimoto_SJC_GLB/spa.gif",fit: fit,width: width,height :height ,);
            },
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;

              return SizedBox(
                  width:width,height :height,
              child: Shimmer.fromColors(
                baseColor: AppColors.colorContainerBackground,
                highlightColor: AppColors.colorSecondaryText7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:  BorderRadius.circular(radius),
                    color: AppColors.colorBlack
                  ),
                ),
              ),
              *//*  child: Center(
                  child: Transform.scale(
                    scale: 0.5,
                    child: CircularProgressIndicator(
                      valueColor:  const AlwaysStoppedAnimation<Color>(AppColors.colorButton),

                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                ),*//*
              );
            }),

      );*/

           return  ClipRRect(
             borderRadius: BorderRadius.circular(radius),
             child: CachedNetworkImage(
                     imageUrl: value,fit:fit,width: width,height :height ,

               placeholder: (context, url) =>   SizedBox(
               width:width,height :height,
               child: Shimmer.fromColors(
                 baseColor: AppColors.colorContainerBackground,
                 highlightColor: AppColors.colorSecondaryText7,
                 child: Container(
                   decoration: BoxDecoration(
                       borderRadius:  BorderRadius.circular(radius),
                       color: AppColors.colorBlack
                   ),
                 ),
               ),
               /*  child: Center(
                  child: Transform.scale(
                    scale: 0.5,
                    child: CircularProgressIndicator(
                      valueColor:  const AlwaysStoppedAnimation<Color>(AppColors.colorButton),

                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                ),*/
             ),
                     errorWidget: (context, url, error) =>
                Image.network("https://www.mikimotoamerica.com/media/wysiwyg/mikimoto_SJC_GLB/spa.gif",fit: fit,width: width,height :height ,)

           ),
           );
    }else if(value.startsWith('assets')){
      return
        ClipRRect(
            borderRadius: BorderRadius.circular(radius),child: Image.asset(value,fit: BoxFit.fill,width: width,height :height,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.network("https://www.mikimotoamerica.com/media/wysiwyg/mikimoto_SJC_GLB/spa.gif",fit: BoxFit.fill,width: width,height :height ,);
            },

        ));
    }else{
      return     ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.file(File(value,),fit: BoxFit.fill,width: width,height :height,));
    }
  }



  loadingState({ required bool isLoading}){
    if(isLoading) {
      EasyLoading.instance
        ..displayDuration =const Duration(milliseconds: 2000)
        ..loadingStyle =EasyLoadingStyle.light //This was missing in earlier code
      // ..backgroundColor = ColorClass.blueColor
      // ..indicatorColor = Colors.red
      // ..maskColor = Colors.red
      // ..textColor =Colors.transparent
        ..dismissOnTap = false;
      return EasyLoading.show(status: 'loading...',);
    }else{
      EasyLoading.dismiss();
    }
  }

  FlutterSnackBar({required BuildContext context, required String mes, required int messageType }) {
   // 1 : Congratulations!
   // 2 : Did you know ?
   // 3 : Warning
   // 4 : Something went wrong !


    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color:  Theme.of(context).colorScheme.secondary,
                          offset: Offset(0.0, 3.0),
                          blurRadius: 8.0)
                    ],
                  border: Border.all(
                      color:
                      messageType == 1 ?Colors.green:
                      messageType == 2 ?Colors.blueAccent:
                      messageType == 3 ?Colors.orange:
                      messageType == 4 ?Colors.red:
                      Colors.black

                  ),// Colors.black87,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(children: [

                      Container(
                        height: 40,width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  messageType == 1 ?Colors.green:
                          messageType == 2 ?Colors.blueAccent:
                          messageType == 3 ?Colors.orange:
                          messageType == 4 ?Colors.red:
                          Colors.black
                        ),
                        child: Center(
                          child: Icon(
                            messageType == 1 ?Icons.verified_user:
                            messageType == 2 ?Icons.info_outlined:
                            messageType == 3 ?Icons.warning_amber_outlined:
                            messageType == 4 ?Icons.highlight_remove_sharp:

                            Icons.verified_user,
                            color: Colors.white,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              messageType == 1 ? "Congratulations!":
                              messageType == 2 ? "Did you know ?":
                              messageType == 3 ? "Warning":
                              messageType == 4 ? "Something went wrong !":

                                   "Did you know ?",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.colorBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 3,),
                            Text(
                              mes,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.colorBlack,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                          onTap: (){
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                          child: Icon(Icons.clear_rounded,color: Colors.black,)),

                    ]))))));
  }
  noDataFound({  Function()? onClicked,isShowRefreshButton = true, String? message}){
    return Center(
      child: Container(
          margin: const EdgeInsets.all(20),

          //width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height*0.5,
          decoration: BoxDecoration(
            //  color: AppColors.colorContainerBackground,
              color:Colors.black,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/no_data.png')),
                  // Text(
                  //     text: 'No Data Found',
                  //     fontSize: 25,
                  //     color: ColorClass.blueColor),
                  SizedBox(
                    height: 0,
                  ),

                  Text(
                    message ??
                    "We're sorry, no data available at the moment , Please check back latter . ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color:  AppColors.colorWhite,
                        fontFamily: AppFontSize.appFontOpenSans,
                        fontSize:15,
                        fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Visibility(
                    visible: isShowRefreshButton,
                    child: CommonButton(
                      onClicked: (){
                        if (onClicked != null) onClicked();
                      },
                      label: 'Refresh',
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )),
    );
  }




}


class Menu {
  final String name;
  final String path;
  final List<int>? rollIdList;

  Menu({required this.name, required this.path,  this.rollIdList});
}

