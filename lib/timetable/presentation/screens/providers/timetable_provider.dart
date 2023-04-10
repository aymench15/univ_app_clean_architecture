import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../compenents/time_table_screen.dart';
import '../../controller/data_bloc/data_bloc.dart';
import '../../controller/data_bloc/data_events.dart';

class TimeTableProvider extends StatelessWidget {
  final String id_sec;
  final String id_group;
  final String semestre;
  final String group;
  final bool isSelected;
  const TimeTableProvider(
      {Key? key,
      required this.id_sec,
      required this.id_group,
      required this.semestre,
      required this.group,
      required this.isSelected
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => getIt<DataBloc>()
          ..add(TimeTableEvent(
              id_group: id_group, id_sec: id_sec, semestre: semestre)),
        child: TimeTableScreen(
          group: group,
          group_id :id_group, 
          isSelected: isSelected,
        ));
  }
}
