import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_themes/app_theme_lightmode.dart';
import 'Theme_state.dart';
/*
class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(ThemeInitial());
 bool _isDark = false;

  bool get dark => _isDark;
  void change_theme() async{
      final bool hasDarkTheme = await isDark();
        if (hasDarkTheme) {
           _isDark = !_isDark;
          emit(ThemeInitial());
        } else {
           _isDark = !_isDark;
           setTheme(_isDark);
          emit(NightTheme());
        }
  }
}*/


import '../app_themes/app_theme_darkmode.dart';
import 'Theme_event.dart';
import 'Theme_state.dart';
import 'theme_helper.dart';
/*
  class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
    ThemeBloc() : super(getThemeDataLight()) {
      //when app is started
      on<InitialThemeSetEvent>((event, emit) async {
        final bool hasDarkTheme = await isDark();
        if (hasDarkTheme) {
          emit(getThemeDataNight());
        } else {
          emit( getThemeDataLight());
        }
      });

      //while switch is clicked
      on<ThemeSwitchEvent>((event, emit) {
        final isDark = state ==  getThemeDataNight();
        emit(isDark ?  getThemeDataLight():getThemeDataNight());
        setTheme(isDark);
      });
    }
  }

*/
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
    ThemeBloc() : super(lightMode) {
      //when app is started
      on<InitialThemeSetEvent>((event, emit) async {
        final bool hasDarkTheme = await isDark();
        if (hasDarkTheme) {
          emit(darkMode);
        } else {
          emit(lightMode);
        }
      });

      //while switch is clicked
      on<ThemeSwitchEvent>((event, emit) {
        final isDark = state == darkMode;
        emit(isDark ? lightMode : darkMode);
        setTheme(isDark);
      });
    }
  }