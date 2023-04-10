import 'package:flutter/material.dart';

import '../app_colors/app_colors_lightmode.dart';

ThemeData lightMode = ThemeData.light().copyWith(
    primaryColor: AppLightColors.black,
    appBarTheme: const AppBarTheme(color: Color.fromRGBO(96, 125, 139, 1)),
    // primarySwatch: Colors.blueGrey,
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.black),
        backgroundColor: MaterialStatePropertyAll(AppLightColors.black),
      ),
    ),
    scaffoldBackgroundColor: AppLightColors.appMainColorReduced,
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(
      iconColor: MaterialStatePropertyAll(AppLightColors.black),
    )),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppLightColors.secondary),
    indicatorColor: AppLightColors.secondary,
    drawerTheme: const DrawerThemeData(
        backgroundColor: AppLightColors.appMainColorReduced),
    textTheme:
        const TextTheme(displayLarge: TextStyle(color: AppLightColors.black)),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppLightColors.appMainColor,
        onPrimary: AppLightColors.black,
        secondary: AppLightColors.secondary,
        error: AppLightColors.errors,
        onError: AppLightColors.errors,
        background: AppLightColors.appMainColor,
        onBackground: AppLightColors.appMainColorReduced,
        surface: AppLightColors.kBGColor,
        onSurface: AppLightColors.kTextColor,
        onSecondary: AppLightColors.black));
/*
ThemeData getThemeDataLight() => ThemeData(
      primaryColor: AppLightColors.appSecondeColor,
      //appBarTheme: AppBarTheme(color: AppLightColors.appMainColor),
      primarySwatch: Colors.blueGrey,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.white),
          backgroundColor:
              MaterialStatePropertyAll(AppLightColors.appSecondeColor),
        ),
      ),
      scaffoldBackgroundColor: Colors.blueGrey,
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(AppLightColors.buttons_color),
      )),

      drawerTheme: DrawerThemeData(backgroundColor: Colors.blueGrey),
      textTheme: TextTheme(
          displayLarge: TextStyle(color: AppLightColors.buttons_color)),
      //cardTheme: CardTheme(color :AppLightColors.appMainColor,shadowColor: AppLightColors.appSecondeColor,),
      //iconTheme: IconThemeData(color :AppLightColors.appSecondeColor )
    );

*/