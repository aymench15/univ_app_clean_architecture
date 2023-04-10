import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../compenents/section_screen.dart';
import '../../controller/data_bloc/data_bloc.dart';
import '../../controller/data_bloc/data_events.dart';

class SectionProvider extends StatelessWidget {
  final String id_lev_spec;
  final String semestre;
  const SectionProvider({Key? key, required this.id_lev_spec,required this.semestre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<DataBloc>()..add(SectionEvent(id_lev_spec: id_lev_spec,semestre: semestre)),
        child: SectionScreen(id_lev_spec: id_lev_spec,semestre: semestre));
  }
}
