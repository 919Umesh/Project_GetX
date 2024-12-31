class SignupResponseModel {
  String? _token;
  int? _userId;
  String? _email;
  String? _username;
  String? _image;
  bool? _isComplete;

  SignupResponseModel(
      {String? token,
      int? userId,
      String? email,
      String? username,
      String? image,
      bool? isComplete}) {
    if (token != null) {
      _token = token;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (email != null) {
      _email = email;
    }
    if (username != null) {
      _username = username;
    }
    if (image != null) {
      _image = image;
    }
    if (isComplete != null) {
      _isComplete = isComplete;
    }
  }

  String? get token => _token;
  set token(String? token) => _token = token;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get image => _image;
  set image(String? image) => _image = image;
  bool? get isComplete => _isComplete;
  set isComplete(bool? isComplete) => _isComplete = isComplete;

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    _token = json['token'];
    _userId = json['user_id'];
    _email = json['email'];
    _username = json['username'];
    _image = json['image'];
    _isComplete = json['is_complete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = _token;
    data['user_id'] = _userId;
    data['email'] = _email;
    data['username'] = _username;
    data['image'] = _image;
    data['is_complete'] = _isComplete;
    return data;
  }
}
