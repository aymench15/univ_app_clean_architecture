class Alert {
  final String title;
  final String subject;
  final DateTime time;

  Alert({required this.title, required this.subject, required this.time});
}

List<Alert> recentAlerts = [
  Alert(
    title: "Info",
    subject: "Trigonometry",
    time: DateTime.parse("2023-04-02 17:00:00"),
  ),
  Alert(
    title: "BDD",
    subject: "Gravitation",
    time: DateTime.parse("2023-04-02 19:00:00"),
  ),
];