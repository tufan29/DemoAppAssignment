


import 'dart:ui';

import 'package:flutter/cupertino.dart';

class shap_the extends CustomClipper<Path>
{
  Path getClip(Size size) {
    Path path = Path();
//    path.lineTo(0, size.height-40 );
//    path.quadraticBezierTo(
//        size.width / 4, size.height,
//        size.width/2, size.height -40);
//    path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width, size.height-40);
//    path.lineTo(size.width, 0);
//    path.close();

    Offset curvrStartopint=Offset(0,size.height*0.75);
    Offset curvrEndtopint=Offset(size.width,size.height*0.75);
    path.lineTo(curvrStartopint.dx, curvrStartopint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curvrEndtopint.dx, curvrEndtopint.dy);
    path.lineTo(size.width, 0);


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>true;


}
class shap_two extends CustomClipper<Path>
{
  Path getClip(Size size) {
    Path path = Path();
//    path.lineTo(0, size.height-40 );
//    path.quadraticBezierTo(
//        size.width / 4, size.height,
//        size.width/2, size.height -40);
//    path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width, size.height-40);
//    path.lineTo(size.width, 0);
//    path.close();

    Offset curvrStartopint=Offset(0,size.height*0.90);
    Offset curvrEndtopint=Offset(size.width,size.height*0.80);
    path.lineTo(curvrStartopint.dx, curvrStartopint.dy);
    path.quadraticBezierTo(size.width/2, size.height, curvrEndtopint.dx, curvrEndtopint.dy);
    path.lineTo(size.width, 0);


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>true;


}
