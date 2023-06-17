import 'dart:convert';

DosenMahasiswaModel dosenMahasiswaModelFromJson(String str) =>
    DosenMahasiswaModel.fromJson(json.decode(str));

class DosenMahasiswaModel {
  final int id;
  final String nama;
  final String nim;
  final String gambar;
  final String pdf;
  final List<Kegiatan> kegiatan;
  final List<Ang> datang;
  final List<Ang> pulang;

  DosenMahasiswaModel({
    required this.id,
    required this.nama,
    required this.nim,
    required this.gambar,
    required this.pdf,
    required this.kegiatan,
    required this.datang,
    required this.pulang,
  });

  factory DosenMahasiswaModel.fromJson(Map<String, dynamic>? json) =>
      DosenMahasiswaModel(
        id: json?["id"] ?? 0,
        nama: json?["nama"] ?? '',
        nim: json?["nim"] ?? '',
        gambar: json?["gambar"] ?? '',
        pdf: json?["pdf"] ?? '',
        kegiatan: List<Kegiatan>.from(
            json?["kegiatan"]?.map((x) => Kegiatan.fromJson(x)) ?? []),
        datang:
            List<Ang>.from(json?["datang"]?.map((x) => Ang.fromJson(x)) ?? []),
        pulang:
            List<Ang>.from(json?["pulang"]?.map((x) => Ang.fromJson(x)) ?? []),
      );
}

class Ang {
  final int id;
  final int mahasiswaId;
  final String gambar;
  final String keterangan;
  final String jamDatang;
  final String jamPulang;

  Ang({
    required this.id,
    required this.mahasiswaId,
    required this.gambar,
    required this.keterangan,
    required this.jamDatang,
    required this.jamPulang,
  });

  factory Ang.fromJson(Map<String, dynamic>? json) => Ang(
        id: json?["id"] ?? 0,
        mahasiswaId: json?["mahasiswa_id"] ?? 0,
        gambar: json?["gambar"] ?? '',
        keterangan: json?["keterangan"] ?? '',
        jamDatang: json?["jam_datang"] ?? '',
        jamPulang: json?["jam_pulang"] ?? '',
      );
}

class Kegiatan {
  final int id;
  final int mahasiswaId;
  final String deskripsi;
  final String jamMulai;

  Kegiatan({
    required this.id,
    required this.mahasiswaId,
    required this.deskripsi,
    required this.jamMulai,
  });

  factory Kegiatan.fromJson(Map<String, dynamic>? json) => Kegiatan(
        id: json?["id"] ?? 0,
        mahasiswaId: json?["mahasiswa_id"] ?? 0,
        deskripsi: json?["deskripsi"] ?? '',
        jamMulai: json?["jam_mulai"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mahasiswa_id": mahasiswaId,
        "deskripsi": deskripsi,
        "jam_mulai": jamMulai,
      };
}
