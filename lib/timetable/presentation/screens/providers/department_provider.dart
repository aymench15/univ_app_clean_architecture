import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/services_locator.dart';
import '../../compenents/department_screen.dart';
import '../../controller/data_bloc/data_bloc.dart';
import '../../controller/data_bloc/data_events.dart';

class DepartProvid extends StatelessWidget {
  final String id;
  const DepartProvid({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          getIt<DataBloc>()..add(DepartmentEvent(id: id)),
      child: DepartmentScreen(id: id)
    );
  }
}
