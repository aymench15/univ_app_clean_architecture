import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/alerts.dart';
import '../../../core/utils/constants.dart';
import 'countdown_painter.dart';

class RecentsAlerts extends StatefulWidget {
  final List list;

  RecentsAlerts({super.key, required this.list});
  RcntAlert createState() => RcntAlert();
}

class RcntAlert extends State<RecentsAlerts> {
  final DateFormat dateFormat = DateFormat('h:mm a');

  @override
  Widget build(BuildContext context) {
    List subList = getLists(widget.list, DateTime.now().weekday + 1);
    print(DateTime.now().weekday);
    print(subList.length);
    print(subList);
    return (subList.length == 0)
        ? Container(
            height: 255,
            child: Center(
              child: Text("No Cours for this day"),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: subList.length,
            itemBuilder: (BuildContext context, int index) {
              // Alert alert = recentAlerts[index];
              double percent;
              //  Timer? timer;
              var now = DateTime.now();
              String state = "";
              String time = '0';
              //    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
              var targetTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  dateFormat
                      .parse(getHours(int.parse(subList[index]["time_slot"])))
                      .hour,
                  dateFormat
                      .parse(getHours(int.parse(subList[index]["time_slot"])))
                      .minute);

              var difference = targetTime.difference(now);
              state = "";
              if (difference.inHours >= 1) {
                state = "hours";
                time = '${difference.inHours}';
              } else if (difference.inMinutes >= 0) {
                state = "min";
                time = '${difference.inMinutes}';
              } else if ((-difference.inHours >= 0 &&
                      -difference.inHours <= 1) &&
                  difference.inMinutes >= -30) {
                state = "Started";
                time = '0';
              } else {
                state = "Finished";
                time = '0';
              }
              //   });

              // time = int.parse(time) < 0 ? '-int.parse(time)' : '0';
              percent = int.parse(time) / 48;

              return Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    height: 130.0,
                    width: 15.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                    height: 130.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                      //  color: Color.fromARGB(255, 0, 21, 40),
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              subList[index]["module_name"],
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  //   color: Theme.of(context).colorScheme.onSurface,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  //  AntDesign.clockcircle,
                                  Icons.timelapse,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 10.0,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  " Today : ${getHours(int.parse(subList[index]["time_slot"]))}",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.receipt,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 10.0,
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  subList[index]["cours_type"],
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0.0,
                          child: CustomPaint(
                            foregroundPainter: CountdownPainter(
                              bgColor: Color(0xFF343537),
                              lineColor: _getColor(context, percent),
                              percent: percent,
                              width: 4.0,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "$time",
                                    style: TextStyle(
                                      color: _getColor(context, percent),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    (state == "Finished" || state == "Started")
                                        ? '${state}'
                                        : "${state} left",
                                    style: TextStyle(
                                      color: _getColor(context, percent),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }

  String getHours(int num) {
    if (num == 1) return "8:00 AM";
    if (num == 2) return "9:40 AM";
    if (num == 3) return "11:20 AM";
    if (num == 4) return "1:10 PM";
    if (num == 5) return "3:50 PM";
    return "4:30 PM";
  }

  List getLists(timetable, int num) {
    if (num == 8) num = 1;
    timetable.sort((a, b) => int.parse(a["week_days"]).compareTo(int.parse(b[
        "week_days"]))); /* print(
        'entred ==>>> \n ${timetable.where((list) => int.parse(list[12]) == 2).toList()} \n ');*/
    List l =
        timetable.where((list) => int.parse(list["week_days"]) == num).toList();
    l.sort((a, b) =>
        int.parse(a["time_slot"]).compareTo(int.parse(b["time_slot"])));
    return l;
  }

  DateTime checkForNewTime() {
    print(DateTime.now());
    return DateTime.now();
  }

  _getColor(BuildContext context, double percent) {
    if (percent >= 0.4) {
      return Theme.of(context).colorScheme.secondary;
    }

    return Color(0xFFF5C35A);
  }
}
