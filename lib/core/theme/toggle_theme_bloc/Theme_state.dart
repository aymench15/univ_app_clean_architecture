import 'package:flutter/material.dart';

import '../app_colors/app_colors_lightmode.dart';

abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  ThemeData getThemeDataLight() => ThemeData(
  primaryColor:AppLightColors.appSecondeColor,
 //appBarTheme: AppBarTheme(color: AppLightColors.appMainColor),
 primarySwatch: Colors.blueGrey,
  textButtonTheme: TextButtonThemeData(
  style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.white),backgroundColor: MaterialStatePropertyAll(AppLightColors.appSecondeColor),
 ),),
 scaffoldBackgroundColor: Colors.blueGrey,
 iconButtonTheme:  IconButtonThemeData(style: ButtonStyle(
    iconColor:MaterialStatePropertyAll(AppLightColors.buttons_color) ,
  )
 ) ,

 drawerTheme: DrawerThemeData(backgroundColor:Colors.blueGrey),
 textTheme: TextTheme(displayLarge:TextStyle(color: AppLightColors.buttons_color) ),
 //cardTheme: CardTheme(color :AppLightColors.appMainColor,shadowColor: AppLightColors.appSecondeColor,),
 //iconTheme: IconThemeData(color :AppLightColors.appSecondeColor )

);
}
class NightTheme extends ThemeState {}


