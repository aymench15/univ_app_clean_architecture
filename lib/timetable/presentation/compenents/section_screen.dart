import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../Widgets/cards.dart';
import '../Widgets/nav_bar.dart';
import '../controller/data_bloc/data_bloc.dart';
import '../controller/data_bloc/data_state.dart';
import '../screens/providers/group_provider.dart';

class SectionScreen extends StatelessWidget {
  final String id_lev_spec;
  final String semestre;
  const SectionScreen({super.key,required this.id_lev_spec,required this.semestre});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, state) {
      print(" \n ======================= \n");
      print(state.sectionState);
      print(" \n ======================= \n");
      switch (state.sectionState) {
        case RequestState.loading:
          return const SizedBox(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        case RequestState.loaded:
          return Scaffold(
            appBar: AppBar(
              title: const Text("Choose a section"),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.sections.length,
              itemBuilder: (BuildContext context, int index) {

                return GestureDetector(
                    key: const Key('openFacMinimalDetail'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => GroupProvider(
                                id_sec: '${state.sections[index].sectionn_id}', semestre: semestre,)),
                      );
                   //   print(state.fields[index].Nom_spec);
                    },
                    child: Cardds(
                      title: state.sections[index].Abrev_fr,
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
