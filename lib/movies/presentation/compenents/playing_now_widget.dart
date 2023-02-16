import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app_with_two_modules/movies/presentation/controller/movies_state.dart';

import '../../../core/utils/Constances.dart';
import '../../../core/utils/dummy.dart';

class PlayingNowWidget extends StatelessWidget {
  const PlayingNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MovieState>(
        builder: (BuildContext context, state) {
      return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {},
          ),
          items: state.movies.map(
            (item) {
              return GestureDetector(
                key: const Key('openMovieMinimalDetail'),
                onTap: () {
                  /// TODO : NAVIGATE TO MOVIE DETAILS
                },
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // fromLTRB
                            Colors.transparent,
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0, 0.3, 0.5, 1],
                        ).createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        height: 560.0,
                        imageUrl: AppConstances.imageUrl(item.backdropPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: Colors.redAccent,
                                  size: 16.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  'Now Playing'.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      );
    });
  }
}
