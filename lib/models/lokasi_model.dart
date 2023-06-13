import 'dart:convert';

LokasiModel lokasiModelFromJson(String str) =>
    LokasiModel.fromJson(json.decode(str));

class LokasiModel {
  final int id;
  final String nama;
  final String gambar;
  final String alamat;
  final String pembimbingLapangan;
  final String dosenPembimbing;
  final int pesentasiKehadiran;

  LokasiModel({
    required this.id,
    required this.nama,
    required this.gambar,
    required this.alamat,
    required this.pembimbingLapangan,
    required this.dosenPembimbing,
    required this.pesentasiKehadiran,
  });

  factory LokasiModel.fromJson(Map<String, dynamic> json) => LokasiModel(
        id: json["id"],
        nama: json["nama"],
        gambar: json["gambar"],
        alamat: json["alamat"],
        pembimbingLapangan: json["pembimbing_lapangan"],
        dosenPembimbing: json["dosen_pembimbing"],
        pesentasiKehadiran: json["pesentasi_kehadiran"],
      );
}
