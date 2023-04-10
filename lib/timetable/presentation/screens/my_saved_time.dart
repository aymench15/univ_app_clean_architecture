import 'package:flutter/material.dart';

import '../../../core/localDB/database.dart';
import '../../../core/utils/Constances.dart';
import '../compenents/timeTable.dart';

class MySavedTime extends StatefulWidget {
  final List list;
  final bool fromMyLocal;
  const MySavedTime({super.key, required this.fromMyLocal, required this.list});
  _MySavedSchedule createState() => _MySavedSchedule();
}

class _MySavedSchedule extends State<MySavedTime> {


  @override
  Widget build(BuildContext context) {
    if (widget.list.length < 1) {
      return Center(child: Text("no schedule registred !"));
    }
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Center(child: Text("${widget.list[0]["study_level"]} schedule")),
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Sun')),
              Tab(child: Text('Mon')),
              Tab(child: Text('Tue')),
              Tab(child: Text('Wed')),
              Tab(child: Text('Tus')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ClassesScreen(
              list: getLists(widget.list, 1),
              froMyLocal: widget.fromMyLocal,
            ),
            ClassesScreen(
              list: getLists(widget.list, 2),
              froMyLocal: widget.fromMyLocal,
            ),
            ClassesScreen(
              list: getLists(widget.list, 3),
              froMyLocal: widget.fromMyLocal,
            ),
            ClassesScreen(
              list: getLists(widget.list, 4),
              froMyLocal: widget.fromMyLocal,
            ),
            ClassesScreen(
              list: getLists(widget.list, 5),
              froMyLocal: widget.fromMyLocal,
            )
          ],
        ),
      ),
    );
  }

  Future<List> getData() async {
    List listing = await AppConstances.connect.getAllData();
    print(listing);
    if (listing.length > 0) {
      return listing;
    }
    return [];
  }

  List getLists(timetable, int num) {
    print(timetable[num - 1]);
    timetable.sort((a, b) => int.parse(a["uknown_fields2"])
        .compareTo(int.parse(b["uknown_fields2"])));

    /* print(
        'entred ==>>> \n ${timetable.where((list) => int.parse(list[12]) == 2).toList()} \n ');*/
    return timetable
        .where((list) => int.parse(list["uknown_fields2"]) == num)
        .toList();
  }
}
