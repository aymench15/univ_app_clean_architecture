import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../compenents/level_screen.dart';
import '../../controller/data_bloc/data_bloc.dart';
import '../../controller/data_bloc/data_events.dart';

class LevelProvider extends StatelessWidget {
  final String id_field;
  final String semestre;
  const LevelProvider({Key? key, required this.id_field,required this.semestre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<DataBloc>()..add(LevelEvent(id_field: id_field,semestre: semestre)),
        child: LevelScreen(id_field: id_field,semestre: semestre));
  }
}
