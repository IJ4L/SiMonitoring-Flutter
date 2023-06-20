import 'dart:convert';

PenilaianModel penilaianModelFromJson(String str) =>
    PenilaianModel.fromJson(json.decode(str));

class PenilaianModel {
  final int id;
  final String nama;
  final String nim;
  final String gambar;
  final int status;

  PenilaianModel({
    required this.id,
    required this.nama,
    required this.nim,
    required this.gambar,
    required this.status,
  });

  factory PenilaianModel.fromJson(Map<String, dynamic> json) => PenilaianModel(
        id: json["id"],
        nama: json["nama"],
        nim: json["nim"],
        gambar: json["gambar"],
        status: json["status"],
      );
}
