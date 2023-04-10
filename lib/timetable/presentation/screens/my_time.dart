import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';

import '../../../core/localDB/database.dart';
import '../../../core/utils/Constances.dart';
import '../../../core/utils/app_strings.dart';
import '../compenents/timeTable.dart';

class MyTime extends StatefulWidget {
  final List list;
  final bool fromMyLocal;
  final String group;
  final String id;
  final bool isSelectted;
  const MyTime({
    super.key,
    required this.list,
    required this.fromMyLocal,
    required this.group,
    required this.isSelectted,
    required this.id,
  });
  @override
  _Mtime createState() => _Mtime();
}

class _Mtime extends State<MyTime> {
  bool isSelected = true;
  @override
  void initState() {
    isSelected = widget.isSelectted;
    super.initState();
  }

  @override
  build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Center(child: Text(widget.list[0][2])),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 101, 226, 160),
            tabs: [
              Tab(child: Text('Sun')),
              Tab(child: Text('Mon')),
              Tab(child: Text('Tue')),
              Tab(child: Text('Wed')),
              Tab(child: Text('Tus')),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                isSelected ? Icons.bookmark_added : Icons.bookmark_add_outlined,
                color: isSelected ? Colors.red : Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isSelected = !isSelected;
                });
                add_schedule(isSelected, widget.list, widget.group, widget.id);
              },
            )
          ],
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

  Future<void> add_schedule(bool isSelected, list, grp, id) async {
    if (isSelected) {
      await AppConstances.connect.deleteAllData();
      await AppConstances.connect.insertData(list);
      await AppConstances.connect.insertNameGrp(grp, id);
     StatusAlert.show(
        context,
        //   duration: Duration(milliseconds: 500),
        title: 'Saved',
        subtitle: 'Schedule',
        configuration: IconConfiguration(icon: Icons.done),
        maxWidth: 240,
      );
    } else {
      await AppConstances.connect.deleteAllData();
    }
  }

  List getLists(timetable, int num) {
    timetable.sort((a, b) => int.parse(a[12]).compareTo(int.parse(b[12])));
    return timetable.where((list) => int.parse(list[12]) == num).toList();
  }
  /*

  Future<bool> getSelection(bool isSelected) async {
    List listing = await AppConstances.connect.getGroupDetails();
    print(listing);
    if (listing.length > 0 && listing[0]['name'] == widget.group &&listing[0]['id'] == widget.id) {
      return true;
    }
    return isSelected;
  }*/
}
