import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_two_modules/core/services/services_locator.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_Bloc.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_events.dart';
import '../controller/movies_state.dart';

class Movies extends StatelessWidget {
  final String title;
  const Movies({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((BuildContext context) {
        return MoviesBloc(getIt())..add(PlayingNowMovies());
      }),
      child: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          print(context);
          return const Scaffold(
            
          );
        },
      ),
    );
  }
}
