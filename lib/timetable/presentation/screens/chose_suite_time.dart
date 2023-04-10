import 'package:flutter/material.dart';
import '../compenents/fac_screen.dart';
import '../compenents/timeTable.dart';
import 'my_saved_time.dart';
import 'my_time.dart';

class SuitbaleTime extends StatelessWidget {
  final List list;
  const SuitbaleTime({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            //indicatorColor: Theme.of(context).colorScheme.onSurface,
            tabs: [
              Tab(child: Text('Choose Schedule')),
              Tab(child: Text('My Schedule')),
            ],
          ),
          title: const Center(child: Text('Schedules')),
        ),
        body: TabBarView(
          children: [
            
            const FacultyWidget(),
            MySavedTime(
              list : list,
              fromMyLocal: true,
            )
          ],
        ),
      ),
    );
  }
}
