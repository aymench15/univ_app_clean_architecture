import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_Bloc.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_events.dart';

import '../../data/datasource/movie_datasource.dart';
import '../../data/repository/data_movie_repository.dart';
import '../../domain/repository/domain_repository.dart';
import '../../domain/usecases/PlayingNowMoviesUseCase.dart';
import '../controller/movies_state.dart';

class Movies extends StatelessWidget {
  final String title;
  const Movies({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((BuildContext context) {
        return MoviesBloc()..add(PlayingNowMovies());
      }),
      child: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          print(state.nowState);
          return const Scaffold();
        },
      ),
    );
  }
}
