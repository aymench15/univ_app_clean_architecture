import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/services_locator.dart';
import 'core/theme/toggle_theme_bloc/Theme_event.dart';
import 'core/theme/toggle_theme_bloc/theme_bloc.dart';
import 'timetable/presentation/compenents/welcome_screen.dart';

void main() async {
  ServiceLocator().init();
  runApp(BlocProvider(
    create: (context) => ThemeBloc()..add(InitialThemeSetEvent()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeBloc theme = BlocProvider.of<ThemeBloc>(context, listen: true);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          theme: state,
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
