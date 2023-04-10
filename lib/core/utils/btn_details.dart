import 'package:equatable/equatable.dart';

class Btn_details extends Equatable {
  final  index;
  final String id;
  final String name;
   bool isSelected = false;
  Btn_details(
      {required this.index,
      required this.isSelected,
      required this.name,
      required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => [index, id];
}
