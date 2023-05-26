import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final int id;
  final String username;
  final String roles;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String nama;

  UserModel({
    required this.id,
    required this.username,
    required this.roles,
    required this.createdAt,
    required this.updatedAt,
    required this.nama,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        roles: json["roles"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "roles": roles,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nama": nama,
      };
}
