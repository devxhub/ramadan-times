import 'dart:convert';

class SignInResponse {
  final bool? success;
  final String? token;
  final User? user;

  const SignInResponse({
    this.success,
    this.token,
    this.user,
  });

  SignInResponse copyWith({
    bool? success,
    String? token,
    User? user,
  }) =>
      SignInResponse(
        success: success ?? this.success,
        token: token ?? this.token,
        user: user ?? this.user,
      );

  factory SignInResponse.fromRawJson(String str) => SignInResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
    success: json["success"],
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? image;

  User({
    this.id,
    this.name,
    this.email,
    this.image,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? image,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        image: image ?? this.image,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "image": image,
  };
}
