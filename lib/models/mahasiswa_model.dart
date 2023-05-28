import 'dart:convert';

MahasiswaModel mahasiswaModelFromJson(String str) =>
    MahasiswaModel.fromJson(json.decode(str));

class MahasiswaModel {
  final String nama;
  final String roles;
  final String nim;
  final String dosenPembimbing;
  final String pembimbingLapangan;
  final String lokasi;
  final dynamic datang;
  final dynamic pulang;
  final List<dynamic> kegiatan;
  final dynamic kendala;

  MahasiswaModel({
    required this.nama,
    required this.roles,
    required this.nim,
    required this.dosenPembimbing,
    required this.pembimbingLapangan,
    required this.lokasi,
    required this.datang,
    required this.pulang,
    required this.kegiatan,
    required this.kendala,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) => MahasiswaModel(
        nama: json["nama"],
        roles: json["roles"],
        nim: json["nim"],
        dosenPembimbing: json["dosen_pembimbing"],
        pembimbingLapangan: json["pembimbing_lapangan"],
        lokasi: json["lokasi"],
        datang: json["datang"],
        pulang: json["pulang"],
        kegiatan: List<dynamic>.from(json["kegiatan"].map((x) => x)),
        kendala: json["kendala"],
      );
}
