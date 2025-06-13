class Message {
  final String name;
  final String message;
  final DateTime time;

  Message({required this.name, required this.message, required this.time});

  Map<String, dynamic> toJson() =>
      {"name": name, "message": message, "time": time.toIso8601String()};

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        name: json["name"],
        message: json["message"],
        time: DateTime.parse(json["time"]),
      );
}
