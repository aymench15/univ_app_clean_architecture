import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../Widgets/cards.dart';
import '../Widgets/nav_bar.dart';
import '../controller/data_bloc/data_bloc.dart';
import '../controller/data_bloc/data_state.dart';
import '../screens/providers/section_provider.dart';

class LevelScreen extends StatelessWidget {
  final String id_field;
  final String semestre;
  const LevelScreen(
      {super.key, required this.id_field, required this.semestre});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, state) {
      print(" \n ======================= \n");
      print(state.levelState);
      print(" \n ======================= \n");
      switch (state.levelState) {
        case RequestState.loading:
          return const SizedBox(
              height: 400.0,
              child: Center(
                  child: CircularProgressIndicator(
                color: Color.fromARGB(255, 101, 226, 160),
              )));
        case RequestState.loaded:
          return Scaffold(
            appBar: AppBar(
              title: const Text("Choose a level"),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.levels.length,
              itemBuilder: (BuildContext context, int index) {
                //  return Cardds(title: '${state.faculties[index].name_fac}');

                return GestureDetector(
                    key: const Key('openlevelMinimalDetail'),
                    onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SectionProvider(
                                id_lev_spec: '${state.levels[index].id_niv_spec}', semestre: semestre,)),
                      );
                      print(state.levels[index].id_specialty);
                    },
                    child: Cardds(
                      title:
                          levelField(int.parse(state.levels[index].id_niveau)),
                    ));
              },
            ),
            bottomNavigationBar: const NavBar(),
          );

        case RequestState.error:
          return const CircularProgressIndicator(
            color: Color.fromARGB(255, 101, 226, 160),
          );
      }
    });
  }

  String levelField(int num) {
    switch (num) {
      case 1:
        return "First year";
      case 2:
        return "Second year";
      case 3:
        return "Third year";
      case 4:
        return "First Master -1-";
    }
    return "";
  }
}
