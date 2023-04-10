
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../Widgets/cards.dart';
import '../Widgets/nav_bar.dart';
import '../controller/data_bloc/data_bloc.dart';
import '../controller/data_bloc/data_state.dart';
import '../screens/providers/level_provider.dart';

class FieldScreen extends StatelessWidget {
  final String id_dep;
  final String semestre;
  const FieldScreen({super.key,required this.id_dep,required this.semestre});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, state) {
      switch (state.fieldState) {
        case RequestState.loading:
          return const SizedBox(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        case RequestState.loaded:
          return Scaffold(
            appBar: AppBar(
              title: const Text("Choose a field"),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.fields.length,
              itemBuilder: (BuildContext context, int index) {
                //  return Cardds(title: '${state.faculties[index].name_fac}');

                return GestureDetector(
                    key: const Key('openFacMinimalDetail'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => LevelProvider(
                                id_field: '${state.fields[index].id_specialty}', semestre: semestre,)),
                      );
                      print(state.fields[index].Nom_spec);
                    },
                    child: Cardds(
                      title: state.fields[index].Nom_spec,
                    ));
              },
            ),
            bottomNavigationBar: const NavBar(),
          );

        case RequestState.error:
          return const CircularProgressIndicator();
      }
    });
  }
}
