import 'package:equatable/equatable.dart';

class ErrorExecption extends Equatable {
  final String codeStatus;
  final String messageStatus;
  final String sucess;

  const ErrorExecption(this.codeStatus, this.messageStatus, this.sucess);

  factory ErrorExecption.fromJson(Map<String, dynamic> json) =>
      ErrorExecption(json["codeStatus"], json["messageStatus"], json["sucess"]);

  @override
  // TODO: implement props
  List<Object?> get props => [codeStatus, messageStatus, sucess];
}
