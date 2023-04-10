
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enums.dart';
import '../Widgets/cards.dart';
import '../controller/data_bloc/data_bloc.dart';
import '../controller/data_bloc/data_state.dart';
import '../screens/providers/department_provider.dart';

class FacultyWidget extends StatelessWidget {
  const FacultyWidget({super.key});
// rani fel faculties ah naffichihoom wnakder nselectioni + try to make a special wedget for faculti card...
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, state){
      print(" \n ======================= \n");
      print(state.faculties);
      print(" \n ======================= \n");
      switch (state.facultyState) {
        case RequestState.loading:
          return const SizedBox(
              height: 400.0,
              child: Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 101, 226, 160),
              )));
        case RequestState.loaded:
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.faculties.length,
            itemBuilder: (BuildContext context, int index) {
              //  return Cardds(title: '${state.faculties[index].name_fac}');

              return GestureDetector(
                  key: const Key('openFacMinimalDetail'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DepartProvid(
                              id: '${state.faculties[index].id_fac}')),
                    );
                  },
                  child: Cardds(
                    title: state.faculties[index].name_fac,
                  ));
            },
          );

        case RequestState.error:
          return const CircularProgressIndicator(
            color: Color.fromARGB(255, 101, 226, 160),
          );
      }
    });
  }
}
