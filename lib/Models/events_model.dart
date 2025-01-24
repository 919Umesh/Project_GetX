class EventResponseModel {
  EventResponseModel({
    required this.status,
    required this.message,
    required this.events,
  });

  final int status;
  final String message;
  final List<EventsModel> events;

  factory EventResponseModel.fromJson(Map<String, dynamic> json) {
    return EventResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      events: json["events"] == null
          ? []
          : List<EventsModel>.from(
          json["events"]!.map((x) => EventsModel.fromJson(x))),
    );
  }
}

class EventsModel {
  EventsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.v,
  });

  final String id;
  final String title;
  final String description;
  final String date;
  final dynamic v;

  factory EventsModel.fromJson(Map<String, dynamic> json) {
    return EventsModel(
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      date: json["date"] ?? "",
      v: json["__v"] ?? 0,
    );
  }

}
