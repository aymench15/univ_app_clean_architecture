import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../../compenents/field_screen.dart';
import '../../controller/data_bloc/data_bloc.dart';
import '../../controller/data_bloc/data_events.dart';

class FieldProvider extends StatelessWidget {
  final String id_dep;
  final String semestre;

  const FieldProvider({Key? key, required this.id_dep,required this.semestre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            getIt<DataBloc>()..add(FieldEvent(department_id: id_dep, semestre: semestre)),
        child: FieldScreen(id_dep: id_dep, semestre: semestre));
  }
}
