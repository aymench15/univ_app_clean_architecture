import 'package:movie_app_with_two_modules/core/network/Exception.dart';

class HandleErrors implements Exception {
  final ErrorExecption errorExecption;

  const HandleErrors({required this.errorExecption});
}


