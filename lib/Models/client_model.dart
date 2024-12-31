class ClientModel {
  final String id;
  final String name;
  final String contact;
  final String mail;
  final String location;

  // Constructor to initialize the fields
  ClientModel({
    required this.id,
    required this.name,
    required this.contact,
    required this.mail,
    required this.location,
  });

  // Convert a ClientModel instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contact': contact,
      'mail': mail,
      'location': location,
    };
  }

  // Factory constructor to create a ClientModel instance from a map
  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      contact: map['contact'] ?? '',
      mail: map['mail'] ?? '',
      location: map['location'] ?? '',
    );
  }

  @override
  String toString() {
    return 'ClientModel(id: $id, name: $name, contact: $contact, mail: $mail, location: $location)';
  }
}
