class Classes {
  final String subject;
  final String type;
  final String teacherName;
  final DateTime time;
  bool isPassed = false;
  bool isHappening = false;

  Classes({required this.subject, required this.type, required this.teacherName, required this.time});
}

List<Classes> classes = [
  Classes(
    subject: "Computer",
    type: "Online Class",
    teacherName: "Julie Raybon",
    time: DateTime.parse("2023-03-31 10:30:00"),
  ),
  Classes(
    subject: "P",
    type: "Online Class",
    teacherName: "Robert Murray",
    time: DateTime.parse("2023-03-29 18:50:00"),
  ),
  Classes(
    subject: "German",
    type: "Online Class",
    teacherName: "Mary Peterson",
    time: DateTime.parse("2023-03-29 15:45:00"),
  ),
  Classes(
    subject: "History",
    type: "Online Class",
    teacherName: "Jim Brooke",
    time: DateTime.parse("2023-03-29 07:30:00"),
  ),
];