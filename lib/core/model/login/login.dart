
class Login {
  int status;
  String message;
  UserData data;
  Misc misc;
  dynamic redirect;

  Login({
    required this.status,
    required this.message,
    required this.data,
    required this.misc,
    this.redirect,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json['status'],
        message: json['message'],
        data: UserData.fromJson(json['data']),
        misc: Misc.fromJson(json['misc']),
        redirect: json['redirect'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
        'misc': misc.toJson(),
        'redirect': redirect,
      };
}

class UserData {
  String name;
  String email;

  UserData({
    required this.name,
    required this.email,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

class Misc {
  String accessToken;

  Misc({
    required this.accessToken,
  });

  factory Misc.fromJson(Map<String, dynamic> json) => Misc(
        accessToken: json['access_token'],
      );

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
      };
}


