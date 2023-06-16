import 'dart:convert';

DosenMahasiswaModel dosenMahasiswaModelFromJson(String str) =>
    DosenMahasiswaModel.fromJson(json.decode(str));

String dosenMahasiswaModelToJson(DosenMahasiswaModel data) =>
    json.encode(data.toJson());

class DosenMahasiswaModel {
  final int id;
  final String nama;
  final String nim;
  final String gambar;
  final dynamic pdf;
  final List<Ang> datang;
  final List<Ang> pulang;

  DosenMahasiswaModel({
    required this.id,
    required this.nama,
    required this.nim,
    required this.gambar,
    required this.pdf,
    required this.datang,
    required this.pulang,
  });

  factory DosenMahasiswaModel.fromJson(Map<String, dynamic> json) =>
      DosenMahasiswaModel(
        id: json["id"],
        nama: json["nama"],
        nim: json["nim"],
        gambar: json["gambar"],
        pdf: json["pdf"],
        datang: List<Ang>.from(json["datang"].map((x) => Ang.fromJson(x))),
        pulang: List<Ang>.from(json["pulang"].map((x) => Ang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nim": nim,
        "gambar": gambar,
        "pdf": pdf,
        "datang": List<dynamic>.from(datang.map((x) => x.toJson())),
        "pulang": List<dynamic>.from(pulang.map((x) => x.toJson())),
      };
}

class Ang {
  final String keterangan;

  Ang({
    required this.keterangan,
  });

  factory Ang.fromJson(Map<String, dynamic> json) => Ang(
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "keterangan": keterangan,
      };
}
