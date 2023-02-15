class AppConstances {
  static const ApiUri = "https://api.themoviedb.org/3/movie";
  static const ApiKey = "dbbb91920d52030bae9d734b0b40d13e";

  static String imageUrl(param0) {
    return "https://image.tmdb.org/t/p/w500${param0}";
  }
}
