import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/classes.dart';
import '../../../core/utils/constants.dart';

class BuildClasses extends StatelessWidget {
  final List list;
  final bool fromMyLocal;
  final DateFormat dateFormat = DateFormat("hh:mm a");

  BuildClasses({super.key, required this.list, required this.fromMyLocal});

  @override
  Widget build(BuildContext context) {
    print(list.length);
    if (list.length == 0)
      return Container(
          height: MediaQuery.of(context).size.height - 345,
          child: Center(
              child: Text(
            "No Courses for this day",
            //    style: TextStyle(color: Colors.white),
          )));
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
      //  Classes c = classes[index];
        //_getStatus(c);
        return Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  (!fromMyLocal)
                      ? "${getCoursesHours(int.parse(list[index][13]))}"
                      : "${getCoursesHours(int.parse(list[index]["time_slot"]))}",
                  // "${dateFormat.format(c.time)}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    // c.isPassed
                    //  ? Colors.white.withOpacity(0.2)
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(width: 15.0),
                //_getTime(c, context),
                SizedBox(width: 22.0),
                Text(
                  (!fromMyLocal) ? list[index][8] : list[index]["module_name"],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                    // c.isPassed
                    //  ? Colors.white.withOpacity(0.2)

                    fontSize: 18.0,
                  ),
                ),
                //SizedBox(width: 10.0),
                /*  c.isHappening
                    ? Container(
                        height: 30.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                            child: Text(
                          "Now",
                          style: TextStyle(color: Colors.white),
                        )),
                      )
                    : Container(),*/
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 90, bottom: 20.0),
                  width: 2,
                  height: 85.0,
                  color: /* c.isPassed ? kTextColor.withOpacity(0.3) :*/
                      Color(0xFF6C7174),
                ),
                SizedBox(width: 7.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.class_,
                          color: /* c.isPassed
                              ? Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3)
                              : */
                              Theme.of(context).colorScheme.secondary,
                          size: 15.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          (!fromMyLocal)
                              ? '${list[index][2]} (${getCoursState(int.parse(list[index][19]))})'
                              : list[index]["cours_type"],
                          style: TextStyle(
                            color: /*c.isPassed
                                ? kTextColor.withOpacity(0.3)
                                :*/
                                Color(0xFF6C7174),
                            fontSize: 13.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: //c.isPassed
                              /*? Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3)*/
                              Theme.of(context).colorScheme.secondary,
                          size: 15.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          (!fromMyLocal)
                              ? getReducedName(
                                  "${list[index][5]} ${list[index][6]}")
                              : getReducedName(
                                  "${list[index]["prof_firstName"]} ${list[index]["prof_lastName"]}"),
                          style: const TextStyle(
                            color: // c.isPassed
                                //? kTextColor.withOpacity(0.3)
                                Color(0xFF6C7174),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          /*c.isPassed
                              ?*/
                          color: Theme.of(context).colorScheme.secondary,
                          //  .withOpacity(0.3),

                          size: 15.0,
                        ),
                       const SizedBox(width: 8.0),
                        Text(
                          (!fromMyLocal)
                              ? getReducedName("${list[index][9]}")
                              : getReducedName("${list[index]["loc"]} (${getCoursState(int.parse(list[index]["online"]))})"),
                          style: const TextStyle(
                            color: // c.isPassed
                                //   ? kTextColor.withOpacity(0.3)
                                Color(0xFF6C7174),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 20.0),
          ],
        );
      },
    );
  }

  _getStatus(Classes c) {
    DateTime now = DateTime.now();
    DateTime finishedTime = c.time.add(Duration(hours: 1));

    if (now.difference(c.time).inMinutes >= 59) {
      c.isPassed = true;
    } else if (now.difference(c.time).inMinutes <= 59 &&
        now.difference(finishedTime).inMinutes >= -59) {
      c.isHappening = true;
    }
  }

  _getTime(Classes c, context) {
    return Container(
      height: 23.0,
      width: 23.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: c.isPassed
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
              : Theme.of(context).colorScheme.secondary,
          // width: 2.0,
        ),
      ),
      child: _getChild(c, context),
    );
  }

  String getCoursState(int i) {
    if (i == 0) return "Attendence";
    return "Online";
  }

  String getCoursesHours(int i) {
    if (i == 1) return "08:00 AM";
    if (i == 2) return "09:40 AM";
    if (i == 3) return "11:20 AM";
    if (i == 4) return "01:10 PM";
    if (i == 5) return "02:50 PM";
    return "04:30 PM";
  }

  String getReducedName(String s) {
    if (s.length > 17) return s.substring(0, 18);
    return s;
  }

  _getChild(Classes c, context) {
    if (c.isPassed) {
      return Icon(
        Icons.check,
        color: c.isPassed
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
            : Theme.of(context).colorScheme.secondary,
        size: 15.0,
      );
    } else if (c.isHappening) {
      return Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),
      );
    }
    return null;
  }
}
