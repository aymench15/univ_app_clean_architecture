import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../Widgets/cards.dart';
import '../Widgets/nav_bar.dart';
import '../controller/data_bloc/data_bloc.dart';
import '../controller/data_bloc/data_state.dart';
import '../screens/providers/field_provider.dart';

class DepartmentScreen extends StatelessWidget {
  final String id;
  const DepartmentScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, state) {
      switch (state.departmentState) {
        case RequestState.loading:
          return const SizedBox(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        case RequestState.loaded:
          return Scaffold(
            appBar: AppBar(
              title: const Text("Choose a department"),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.departments.length,
              itemBuilder: (BuildContext context, int index) {
                //  return Cardds(title: '${state.faculties[index].name_fac}');

                return GestureDetector(
                    key: const Key('openFacMinimalDetail'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FieldProvider(
                                  id_dep: '${state.departments[index].id}',
                                  semestre: '2',
                                )),
                      );
                      print(state.departments[index].name_fr);
                    },
                    child: Cardds(
                      title: state.departments[index].name_fr,
                    ));
              },
            ),
            bottomNavigationBar: const NavBar(),
          );

        case RequestState.error:
          return CircularProgressIndicator();
      }
    });
  }
}
