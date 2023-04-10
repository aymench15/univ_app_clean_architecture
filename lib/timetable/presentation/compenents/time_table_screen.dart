import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import '../Widgets/cards.dart';
import '../Widgets/nav_bar.dart';
import '../controller/data_bloc/data_bloc.dart';
import '../controller/data_bloc/data_state.dart';
import '../screens/providers/group_provider.dart';
import '../screens/my_time.dart';

class TimeTableScreen extends StatelessWidget {
  final String group;
  final String group_id;
  final bool isSelected;
  const TimeTableScreen({super.key, required this.group,required this.group_id,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
        builder: (BuildContext context, state) {
      switch (state.timeTableState) {
        case RequestState.loading:
          return const SizedBox(
              height: 400.0,
              child: Center(
                  child: CircularProgressIndicator(
              )));
        case RequestState.loaded:
          return MyTime(
            list: state.timeTable,
            fromMyLocal: false,
            group: group,
            id: group_id,
            isSelectted: isSelected,
          );

        case RequestState.error:
          return const CircularProgressIndicator(
          );
      }
    });
  }
}
