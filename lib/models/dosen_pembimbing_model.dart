import 'dart:convert';

DosenPembimbinfModel dosenPembimbinfModelFromJson(String str) =>
    DosenPembimbinfModel.fromJson(json.decode(str));

class DosenPembimbinfModel {
  final String nama;
  final String roles;

  DosenPembimbinfModel({
    required this.nama,
    required this.roles,
  });

  factory DosenPembimbinfModel.fromJson(Map<String, dynamic> json) =>
      DosenPembimbinfModel(
        nama: json["nama"],
        roles: json["roles"],
      );
}
