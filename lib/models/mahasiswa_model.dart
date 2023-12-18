import 'dart:convert';

MahasiswaModel articleModelFromJson(String str) =>
    MahasiswaModel.fromJson(json.decode(str));

class MahasiswaModel {
  final String idPpl;
  final String nama;
  final String nim;
  final String gambar;
  final String roles;
  final int keterangan;
  final String dosenPembimbing;
  final String pembimbingLapangan;
  final String lokasi;

  MahasiswaModel({
    required this.idPpl,
    required this.nama,
    required this.nim,
    required this.gambar,
    required this.roles,
    required this.keterangan,
    required this.dosenPembimbing,
    required this.pembimbingLapangan,
    required this.lokasi,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) => MahasiswaModel(
        idPpl: json["id_PPL"],
        nama: json["nama"],
        nim: json["nim"],
        gambar: json["gambar"],
        roles: json["roles"],
        keterangan: json["keterangan"],
        dosenPembimbing: json["dosen_pembimbing"],
        pembimbingLapangan: json["pembimbing_lapangan"],
        lokasi: json["lokasi"],
      );
}
