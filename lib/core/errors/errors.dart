import '../network/Exception.dart';

class HandleErrors implements Exception {
  final ErrorExecption errorExecption;

  const HandleErrors({required this.errorExecption});
}


