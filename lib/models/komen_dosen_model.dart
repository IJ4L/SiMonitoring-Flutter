import 'dart:convert';

KomenDosenModel komenDosenModelFromJson(String str) =>
    KomenDosenModel.fromJson(json.decode(str));

String komenDosenModelToJson(KomenDosenModel data) =>
    json.encode(data.toJson());

class KomenDosenModel {
  final Mahasiswa mahasiswa;
  final Lokasi lokasi;
  final Komen komen;

  KomenDosenModel({
    required this.mahasiswa,
    required this.lokasi,
    required this.komen,
  });

  factory KomenDosenModel.fromJson(Map<String, dynamic> json) =>
      KomenDosenModel(
        mahasiswa: Mahasiswa.fromJson(json["mahasiswa"]),
        lokasi: Lokasi.fromJson(json["lokasi"]),
        komen: Komen.fromJson(json["komen"]),
      );

  Map<String, dynamic> toJson() => {
        "mahasiswa": mahasiswa.toJson(),
        "lokasi": lokasi.toJson(),
        "komen": komen.toJson(),
      };
}

class Komen {
  final int id;
  final int kendalaId;
  final String author;
  final String deskripsi;
  final DateTime tanggal;

  Komen({
    required this.id,
    required this.kendalaId,
    required this.author,
    required this.deskripsi,
    required this.tanggal,
  });

  factory Komen.fromJson(Map<String, dynamic> json) => Komen(
        id: json["id"],
        kendalaId: json["kendala_id"],
        author: json["author"],
        deskripsi: json["deskripsi"],
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kendala_id": kendalaId,
        "author": author,
        "deskripsi": deskripsi,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
      };
}

class Lokasi {
  final int id;
  final String nama;

  Lokasi({
    required this.id,
    required this.nama,
  });

  factory Lokasi.fromJson(Map<String, dynamic> json) => Lokasi(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}

class Mahasiswa {
  final int id;
  final int lokasiId;
  final String nama;
  final String nim;

  Mahasiswa({
    required this.id,
    required this.lokasiId,
    required this.nama,
    required this.nim,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        id: json["id"],
        lokasiId: json["lokasi_id"],
        nama: json["nama"],
        nim: json["nim"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi_id": lokasiId,
        "nama": nama,
        "nim": nim,
      };
}
