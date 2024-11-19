import 'package:flutter/material.dart';

class SocioIcon extends StatelessWidget {
  const SocioIcon({
    Key? key,
    required this.iconName,
    this.onClick,
    this.color,
    this.height = 30.0,
    this.width = 30.0,
  }) : super(key: key);

  final String? iconName;
  final void Function()? onClick;
  final Color? color;
  final double? height;
  final double? width;

  static const String baseIconPath = 'assets/images/icons';

  static const Map<String, String> IconsMap = <String, String>{
    "home": "home_icon.png",
    "home_gr": "home_icon_gr.png",
    "map_gr": "map_icon_gr.png",
    "map": "map_icon.png",
    "add_image": "add_image.png",
    "add_image_gr": "add_image_gr.png",
    "contest_icon_gr": "contest_icon_gr.png",
    "contest_icon": "contest_icon.png",
    "open_book_image_gr": "open_book_image_gr.png",
    "open_book_image": "open_book_image.png",
    "message": "message_icon.png",
    "Frame": "Frame 5.png",
    "feverate": "feverate.png",
    "share_icon": "share_icon.png",
    "cute_icon": "cute_icon.png",
    "camera_icon": "camera_icon.png",
    "location_icon": "location_icon.png",
    "back_icon": "back_icon.png",
    "forword_back": "forword_back_icon.png",
    "search_icon": "search_icon.png",
    "menu_icon": "menu_icon.png",
    "setting_icon": "setting_icon.png",
    "myprofile_icon": "myprofile_icon.png",
    "friends_icons": "friends_icons.png",
    "notification_icon": "notification_icon.png",
    "saved_photos": "saved_photos.png",
    "editing_software_icon": "editing_software_icon.png",
    "logout_Icon": "logout_Icon.png",
    "help_icon": "help_icon.png",
    "teams_of_use_icon": "teams_of_use_icon.png",
    "privacy_policy_icon": "privacy_policy_icon.png",
    "resend_icon": "resend_icon.png",
    "upload_content": "upload_content.png",
    "add_image_icon": "add_image_icon.png",
    "nops_icon": "nops_icon.png",
    "like_icon": "like_icon.png",
    "updateStatus_icon": "updateStatus_icon.png",
    "deactivatedAccount_icon":"deactivatedAccount_icon.png",
    "deleteAccount_icon":"deleteAccount_icon.png",
    "logout_icon1":"logout_icon1.png",
    "favouriteRed_icon":"favouriteRed_icon.png",
    "send_icon":"send_icon.png",
    "save_icon":"save_icon.png",
    "mapLocation_icon":"mapLocation_icon.png",
    "favouriteRed_icon1":"favouriteRed_icon1.png",
    "Frame 29":"Frame 29.png",
    "notVisible":"notVisible.png",
    "passwordVisible":"passwordVisible.png",


  };

  @override
  Widget build(BuildContext context) {
    final String? icon = IconsMap[iconName];

    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(
          height: height,
          width: width,
          '$baseIconPath/$icon',
         /// semanticsLabel: iconName,
          color: color,
        ),
     /*   child: SvgPicture.asset(
          //'$baseIconPath/$icon',
          '$baseIconPath/Union.svg',
          semanticsLabel: "Union",
        //  color: color,
        ),*/

      ),
    );
  }
}
