import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
 class MyConstant{
  static Color maincolor=const Color(0xFF163C9F);
  static Color maincolortext=const Color(0xFF000000);
  static Color subcolortext=const  Color(0xFF2E3E5C);
  static Color backgroundcolor=const Color(0xFFE5E5E5);

  TextStyle mainstyle=TextStyle(
   color: maincolor,
   fontWeight: FontWeight.bold,
  );

  static Icon emailicon=Icon(
   FlutterIcons.email_mco,
   color: maincolor,
  );
  static Icon personicon=Icon(
   FlutterIcons.person_mdi,
   color: maincolor,
  );
  static Icon phoneicon=Icon(
   FlutterIcons.phone_mco,
   color: maincolor,
  );
  static Icon billicon=Icon(
   FlutterIcons.bell_faw5,
   color: maincolor,
  );
  static Icon searchicon=Icon(
   FlutterIcons.search_faw,
   color: maincolor,
  );
  static Icon arrowicon=Icon(
   FlutterIcons.ios_arrow_back_ion,
   color: maincolortext,
  );
  static Icon adressicon=Icon(
   FlutterIcons.place_mdi,
   color: maincolor,
  );
  static Icon visibilityicon=Icon(
   FlutterIcons.place_mdi,
   color: maincolor,
  );
  static Icon nonvisibilityicon=Icon(  FlutterIcons.place_mdi,
   color: maincolor,);

 }