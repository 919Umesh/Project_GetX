class UserProfileModel {
  int? id;
  String? userQr;
  String? thumbnail;
  String? email;
  int? merchantStatus;
  String? firstName;
  String? phone;
  int? gender;

  UserProfileModel(
      {this.id,
      this.userQr,
      this.thumbnail,
      this.email,
      this.merchantStatus,
      this.firstName,
      this.phone,
      this.gender});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userQr = json['user_qr'];
    thumbnail = json['thumbnail'];
    email = json['email'];
    merchantStatus = json['merchant_status'];
    firstName = json['first_name'];
    phone = json['phone'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_qr'] = userQr;
    data['thumbnail'] = thumbnail;
    data['email'] = email;
    data['merchant_status'] = merchantStatus;
    data['first_name'] = firstName;
    data['phone'] = phone;
    data['gender'] = gender;
    return data;
  }
}
