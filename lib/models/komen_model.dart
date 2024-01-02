import 'dart:convert';

KomenModel komenModelFromJson(String str) =>
    KomenModel.fromJson(json.decode(str));

class KomenModel {
  final int id;
  final int kendalaId;
  final String author;
  final String deskripsi;
  final DateTime tanggal;
  final DateTime createdAt;
  final DateTime updatedAt;

  KomenModel({
    required this.id,
    required this.kendalaId,
    required this.author,
    required this.deskripsi,
    required this.tanggal,
    required this.createdAt,
    required this.updatedAt,
  });

  factory KomenModel.fromJson(Map<String, dynamic> json) => KomenModel(
        id: json["id"],
        kendalaId: json["kendala_id"],
        author: json["author"],
        deskripsi: json["deskripsi"] ?? "komen ini kosong",
        tanggal: DateTime.parse(json["tanggal"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
