import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_with_two_modules/movies/presentation/screens/movies_screen.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
             const MainMoviesScreen(title: "movies")
            ));
          }
            
          , child: Text("Navigation"))),
    );
  }
}
