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
  /*
  runApp(MultiBlocProvider(providers: [
    // BlocProvider(create: (coontext) => ThemeBloc())],child: const MyApp(),)
    BlocProvider(
      create: (context) => ThemeBloc()..add(InitialThemeSetEvent()))
      ],
      child: const MyApp(),
  ));*/
  /*
  runApp(BlocProvider(
    create: (context) => ThemeBloc()..add(InitialThemeSetEvent()),
    child: const MyApp(),
  ));*/
}
/*
void main() async {
  ServiceLocator().init();
  /*
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (coontext) => ThemeBloc())],child: const MyApp(),)
   
  );*/
  runApp(MultiBlocProvider(providers: [
    // BlocProvider(create: (coontext) => ThemeBloc())],child: const MyApp(),)
    BlocProvider(
      create: (context) => ThemeBloc()..add(InitialThemeSetEvent()))],
      child: const MyApp(),
  ));
}
*/
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: getThemeDataNight(),
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}*/

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
/*
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoSchool UI',
      theme: theme.dark
          ? getThemeDataLight()
          : getThemeDataNight(), //ThemeData.dark() : ThemeData.light(),
      ThemeData(
        primaryColor: Color(0xFF202328),
        backgroundColor: Color(0xFF12171D),
        visualDensity: VisualDensity.adaptivePlatformDensity, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF63CF93)),
      ),
      home: const WelcomeScreen(),
    );8/
  }
}*/
