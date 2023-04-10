import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../controller/data_bloc/data_bloc.dart';
import '../../controller/data_bloc/data_events.dart';
import '../../compenents/group_screen.dart';
import '../../controller/data_bloc/data_events.dart';

class GroupProvider extends StatelessWidget {
  final String id_sec;
  final String semestre;
  const GroupProvider({Key? key, required this.id_sec,required this.semestre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<DataBloc>()..add(GroupEvent(section_id: id_sec,semestre: semestre)),
        child: GroupScreen(id_sec: id_sec,semestre: semestre));
  }
}
