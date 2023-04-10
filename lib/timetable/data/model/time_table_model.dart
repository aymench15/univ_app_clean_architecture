import '../../domain/entities/time_table.dart';

class TimeTableModel extends TimeTable {
  const TimeTableModel(super.listOfLists);

  factory TimeTableModel.fromJson(List<dynamic> json) {
    List<List<String>> listOfLists = json.map((list) {
      return List<String>.from(list.map((element) => element as String));
    }).toList();
    return TimeTableModel(listOfLists);
  }

  /*
  TimeTableModel(
      {required super.class_name,
      required super.location,
      required super.cours_type,
      required super.study_level,
      required super.field,
      required super.prof_lastName,
      required super.prof_firstName,
      required super.module_name,
      required super.loc,
      required super.uknown_fields1,
      required super.week_days,
      required super.time_slot,
      required super.uknown_fields2,
      required super.uknown_fields3,
      required super.uknown_fields4,
      required super.uknown_fields5,
      required super.uknown_fields6,
      required super.uknown_fields7,
      required super.sub_group,
      required super.online,
      required super.biweekly});

  factory TimeTableModel.fromJson(Map<String, dynamic> json) => TimeTableModel(
        class_name: json[0],
        location: json[1],
        cours_type: json[2],
        study_level: json[3],
        field: json[4],
        prof_lastName: json[5],
        prof_firstName: json[6],
        module_name: json[7],
        loc: json[8],
        uknown_fields1: json[9],
        week_days: json[10],
        time_slot: json[11],
        uknown_fields2: json[12],
        uknown_fields3: json[13],
        uknown_fields4: json[14],
        uknown_fields5: json[15],
        uknown_fields6: json[16],
        uknown_fields7: json[17],
        sub_group: json[18],
        online: json[19],
        biweekly: json[20]
      );*/
}
