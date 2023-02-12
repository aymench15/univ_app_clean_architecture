import 'package:dio/dio.dart';
import 'package:movie_app_with_two_modules/errors/errors.dart';
import 'package:movie_app_with_two_modules/movies/data/model/movie_model.dart';
import 'package:movie_app_with_two_modules/network/Exception.dart';
import '../../../core/utils/Constances.dart';

abstract class BaseMovieRemoteData {
  Future<List<MovieModel>> getMovieRemoteDataPlayingNow();
  Future<List<MovieModel>> getMovieRemoteDataPopular();
  Future<List<MovieModel>> getMovieRemoteDataTopRated();
}

class MovieRemoteData implements BaseMovieRemoteData {
  @override
  Future<List<MovieModel>> getMovieRemoteDataPlayingNow() async {
    
      var dio = Dio();

      final response = await dio.get(
          '${AppConstances.ApiUri}/now_playing?api_key=${AppConstances.ApiKey}');
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ));
      }
      else
       return throw HandleErrors(errorExecption: ErrorExecption.fromJson(response.data));
    }
    
      @override
  Future<List<MovieModel>> getMovieRemoteDataPopular() async {
    
      var dio = Dio();

      final response = await dio.get('${AppConstances.ApiUri}/now_playing?api_key=${AppConstances.ApiKey}');
      if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ));
      }
      else
       return throw HandleErrors(errorExecption: ErrorExecption.fromJson(response.data));
  
  }

  @override
  Future<List<MovieModel>> getMovieRemoteDataTopRated() async {
   
      var dio = Dio();

      final response = await dio.get('${AppConstances.ApiUri}/now_playing?api_key=${AppConstances.ApiKey}');
       if (response.statusCode == 200) {
        return List<MovieModel>.from((response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ));
      }
      else
       return throw HandleErrors(errorExecption: ErrorExecption.fromJson(response.data));
  
  }
  }
