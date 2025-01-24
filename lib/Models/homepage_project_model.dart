class ProjectResponseModel {
  ProjectResponseModel({
    required this.status,
    required this.message,
    required this.projects,
  });

  final int status;
  final String message;
  final List<ProjectModel> projects;

  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) {
    return ProjectResponseModel(
      status: json["status"] ?? 0,
      message: json["message"] ?? "",
      projects: json["projects"] == null ? [] : List<ProjectModel>.from(json["projects"]!.map((x) => ProjectModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "projects": projects.map((x) => x.toJson()).toList(),
  };
}

class ProjectModel {
  ProjectModel({
    required this.id,
    required this.name,
    required this.duration,
    required this.members,
    required this.location,
    required this.amount,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String name;
  final String duration;
  final int members;
  final String location;
  final int amount;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      duration: json["duration"] ?? "",
      members: json["members"] ?? 0,
      location: json["location"] ?? "",
      amount: json["amount"] ?? 0,
      status: json["status"] ?? "",
      createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now().toString()),
      updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now().toString()),
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "duration": duration,
    "members": members,
    "location": location,
    "amount": amount,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
