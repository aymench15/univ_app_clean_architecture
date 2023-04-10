import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/Constances.dart';
import '../../../core/utils/btn_details.dart';
import '../../../core/utils/enums.dart';
import '../Widgets/group_cards.dart';
import '../Widgets/nav_bar.dart';
import '../controller/data_bloc/data_bloc.dart';
import '../controller/data_bloc/data_state.dart';
import '../screens/providers/timetable_provider.dart';

class GroupScreen extends StatefulWidget {
  final String id_sec;
  final String semestre;

  const GroupScreen({super.key, required this.id_sec, required this.semestre});

  State<GroupScreen> createState() => GrpScreen();
}

class GrpScreen extends State<GroupScreen> {
  bool _isSelected = false;
  String name = "";
  String id = "";
  List<Btn_details> btn_list = [];
  @override
  void initState() {
    //   print('selection is now => ${getSelection(_isSelected)}');
    getSelection(_isSelected).then((value) => _isSelected = value);
    //  print("_isSelected now is => $_isSelected");
    AppConstances.connect.getGroupDetails().then((value) =>
        {name = value[0]['name'], id = value[0]['id'], print(id + name)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, state) {
      switch (state.groupState) {
        case RequestState.loading:
          return const SizedBox(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        case RequestState.loaded:
          return Scaffold(
            appBar: AppBar(
              title: const Text("Choose a group"),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.groupes.length,
              itemBuilder: (BuildContext context, int index) {
                Btn_details b = Btn_details(
                    isSelected: _isSelected,
                    name: state.groupes[index].groupe_name,
                    id: state.groupes[index].groupe_id,
                    index: index);
                btn_list.add(b);
                return Stack(children: [
                  GestureDetector(
                    key: const Key('openFacMinimalDetail'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => TimeTableProvider(
                            id_group: state.groupes[index].groupe_id,
                            id_sec: state.groupes[index].sectionn_id,
                            semestre: "2",
                            group: state.groupes[index].groupe_name,
                            isSelected: btn_list[index].isSelected &&
                                name == btn_list[index].name &&
                                btn_list[index].id == id,
                          ),
                        ),
                      ).then(onGoBack);

                      //   print(state.fields[index].Nom_spec);
                    },
                    child: GroupCards(
                      title: state.groupes[index].groupe_name,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 0,
                    child: (name == btn_list[index].name &&
                            btn_list[index].id == id)
                        ? Container(
                            width: 35,
                            height: 75,
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            color: Color.fromARGB(255, 103, 28, 23),
                            child: const RotatedBox(
                              quarterTurns: 1,
                              child: Center(
                                child: Text(
                                  'Saved',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    /* IconButton(
                        icon: Icon(
                          btn_list[index].isSelected &&
                                  name == btn_list[index].name &&
                                  btn_list[index].id == id
                              ? Icons.bookmark_added
                              : Icons.bookmark_add_outlined,
                          color: btn_list[index].isSelected &&
                                  name == btn_list[index].name &&
                                  btn_list[index].id == id
                              ? Colors.red
                              : Colors.black,
                        ),
                        onPressed: () async {
                          setState(() {
                            btn_list[index].isSelected =
                                !btn_list[index].isSelected;
                          });
                        },
                      )*/
                  )
                ]);
              },
            ),
            bottomNavigationBar: const NavBar(),
          );

        case RequestState.error:
          return const CircularProgressIndicator();
      }
    });
  }

  FutureOr onGoBack(dynamic value) async {
    //refreshData();
    await AppConstances.connect.getGroupDetails().then((val) => {
          setState(() {
            if (!val.isEmpty) {
              name = val[0]['name'];
              id = val[0]['id'];
            } else{
              name = "";
            id = "";}
            // isSelected = true;
          }),
        });
    print(name + id);
  }

  Future<bool> getSelection(bool isSelected) async {
    List listing = await AppConstances.connect.getGroupDetails();
    if (listing.length > 0) {
      return true;
    }
    return isSelected;
  }
}
