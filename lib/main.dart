import 'package:flutter/material.dart';
import 'package:movie_app_with_two_modules/core/services/services_locator.dart';
import 'package:movie_app_with_two_modules/movies/domain/entities/movie.dart';
import 'package:movie_app_with_two_modules/test.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() async {
  Movie movie1 = const Movie(
      id: 2,
      title: "aaa",
      backdropPath: "ss",
      genreIds: [1],
      overview: "ss",
      voteAverage: 2.2,
      releaseDate: "2020");
  Movie movie2 = const Movie(
      id: 2,
      title: "aaa",
      backdropPath: "ss",
      genreIds: [1],
      overview: 'ss',
      voteAverage: 2.2,
      releaseDate: "2020");
  print(movie1 == movie2);

  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestScreen(),
    );
  }
}
