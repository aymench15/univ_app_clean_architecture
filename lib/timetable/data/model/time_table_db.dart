class TimeTableDB {
  final String class_name;
  final String location;
  final String cours_type;
  final String study_level;
  final String field;
  final String prof_lastName;
  final String prof_firstName;
  final String uknown_fields;
  final String module_name;
  final String loc;
  final String uknown_fields1;
  final String uknown_fields1_2;
  final String week_days;
  final String time_slot;
  final String uknown_fields2;
  final String uknown_fields3;
  final String uknown_fields4;
  final String uknown_fields5;
  final String sub_group;
  final String online;
  final String biweekly;

  TimeTableDB(
      {required this.class_name,
      required this.location,
      required this.cours_type,
      required this.study_level,
      required this.field,
      required this.prof_lastName,
      required this.prof_firstName,
      required this.uknown_fields,
      required this.module_name,
      required this.loc,
      required this.uknown_fields1,
      required this.uknown_fields1_2,
      
      required this.week_days,
      required this.time_slot,
      required this.uknown_fields2,
      required this.uknown_fields3,
      required this.uknown_fields4,
      required this.uknown_fields5,
      required this.sub_group,
      required this.online,
      required this.biweekly});

  factory TimeTableDB.fromMap(Map<String, dynamic> map) {
    return TimeTableDB(
        class_name: map["class_name"],
        location: map["location"],
        cours_type: map["cours_type"],
        study_level: map["study_level"],
        field: map["field"],
        prof_lastName: map["prof_lastName"],
        prof_firstName: map["prof_firstName"],
        uknown_fields: map["uknown_fields"],
        module_name: map["module_name"],
        loc: map["loc"],
        uknown_fields1: map["uknown_fields1"],
        uknown_fields1_2: map["uknown_fields1_2"],
        week_days: map["week_days"],
        time_slot: map["time_slot"],
        uknown_fields2: map["uknown_fields2"],
        uknown_fields3: map["uknown_fields3"],
        uknown_fields4: map["uknown_fields4"],
        uknown_fields5: map["uknown_fields5"],
        sub_group: map["sub_group"],
        online: map["online"],
        biweekly: map["biweekly"]);
  }

  Map<String, dynamic> toMap() {
    return {
      "class_name": class_name,
      "location": location,
      "cours_type": cours_type,
      "study_level": study_level,
      "field": field,
      "prof_lastName": prof_lastName,
      "prof_firstName": prof_firstName,
      "uknown_fields": uknown_fields,
      "module_name": module_name,
      "loc": loc,
      "uknown_fields1": uknown_fields1,
      "week_days": week_days,
      "time_slot": time_slot,
      "uknown_fields2": uknown_fields2,
      "uknown_fields3": uknown_fields3,
      "uknown_fields4": uknown_fields4,
      "uknown_fields5": uknown_fields5,
      "sub_group": sub_group,
      "online": online,
      "biweekly": biweekly
    };
  }
}
