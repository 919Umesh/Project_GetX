class ProjectStatusModel {

  final String status;

  ProjectStatusModel({
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
    };
  }


  factory ProjectStatusModel.fromMap(Map<String, dynamic> map) {
    return ProjectStatusModel(
      status: map['status'] ?? '',
    );
  }

}
