import 'package:flutter/material.dart';

import '../app_colors/app_colors_darkmode.dart';

class Theming {}

ThemeData darkMode = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(color: AppNightColors.appMainColor),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        backgroundColor:
            MaterialStatePropertyAll(AppNightColors.appSecondeColor),
      ),
    ),
    scaffoldBackgroundColor: AppNightColors.appMainColor,
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(AppNightColors.buttons_color),
    )),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppNightColors.appSecondeColor),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppNightColors.appMainColor,
    ),
    textTheme: const TextTheme(
        displayLarge: TextStyle(color: AppNightColors.buttons_color)),
    indicatorColor: AppNightColors.appSecondeColor,
    //cardTheme: CardTheme(color :AppNightColors.appMainColor,shadowColor: AppNightColors.appSecondeColor,),
    iconTheme: const IconThemeData(color: AppNightColors.buttons_color),
    buttonTheme:
        const ButtonThemeData(buttonColor: AppNightColors.appSecondeColor),
    cardColor: AppNightColors.appMainColor,
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppNightColors.appMainColor,
        onPrimary: AppNightColors.buttons_color,
        secondary: AppNightColors.appSecondeColor,
        error: AppNightColors.errors,
        onError: AppNightColors.errors,
        background: AppNightColors.appMainColorReduced,
        onBackground: AppNightColors.appMainColor,
        surface: AppNightColors.kBGColor,
        onSurface: AppNightColors.kTextColor,
        onSecondary: AppNightColors.buttons_color));
 
  /*
ThemeData getThemeDataNight() => ThemeData(
  primaryColor: AppNightColors.appSecondeColor,
  primarySwatch: Colors.cyan,
 appBarTheme: AppBarTheme(color: AppNightColors.appMainColor),
 textButtonTheme: TextButtonThemeData(
  style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.white),backgroundColor: MaterialStatePropertyAll(AppNightColors.appSecondeColor),
 ),),
 scaffoldBackgroundColor: AppNightColors.appMainColor,
 iconButtonTheme:  IconButtonThemeData(style: ButtonStyle(
    iconColor:MaterialStatePropertyAll(AppNightColors.buttons_color) ,
  )
 ) ,

 drawerTheme: DrawerThemeData(backgroundColor:AppNightColors.appMainColorReduced ),
 textTheme: TextTheme(displayLarge:TextStyle(color: AppNightColors.buttons_color) ),
 //cardTheme: CardTheme(color :AppNightColors.appMainColor,shadowColor: AppNightColors.appSecondeColor,),
 iconTheme: IconThemeData(color :AppNightColors.appSecondeColor )
 

);*/