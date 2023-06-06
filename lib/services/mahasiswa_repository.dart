import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simor/models/kegiatan_model.dart';
import 'package:simor/models/kendala_model.dart';

class MahasiswaRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final String _userTokenKey = 'user_token';
  final String _kegiatanKey = 'kegiatan';

  MahasiswaRepository({required this.client, required this.sharedPreferences});

  final baseUrl = 'http://192.168.1.14:8000/api';

  Future<Either<String, void>> datang(String imagePath) async {
    try {
      final token = await getUserToken();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/mahasiswa/datang/create'),
      );
      request.headers['accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath('gambar', imagePath));

      var response = await client.send(request);
      if (response.statusCode == 200) {
        return const Right(null);
      }

      return Left(
        'Gagal mengirim gambar. Status code: ${response.statusCode}',
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> postKendala(String deskripsi) async {
    try {
      final token = await getUserToken();

      final response = await client.post(
        Uri.parse('$baseUrl/mahasiswa/kendala/create'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        },
        body: {'deskripsi': deskripsi},
      );

      if (response.statusCode == 200) {
        return const Right(null);
      }

      return Left(
        'Gagal mengirim deskripsi. Status code: ${response.statusCode}',
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, KendalaModel>> getKendala() async {
    try {
      final token = await getUserToken();

      final response = await client.get(
        Uri.parse('$baseUrl/mahasiswa/kendala/detail_kendala_by_tanggal'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        },
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return Right(KendalaModel.fromJson(data['data'][0]));
      }

      return Left(
        'Gagal mengambil deskripsi. Status code: ${response.statusCode}',
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> upFoto(String imagePath) async {
    try {
      final token = await getUserToken();

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$baseUrl/mahasiswa/pulang/create'),
      );
      request.headers['accept'] = 'application/json';
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(await http.MultipartFile.fromPath('gambar', imagePath));

      var response = await client.send(request);
      if (response.statusCode == 200) {
        return const Right(null);
      }

      return Left(
        'Gagal mengirim gambar. Status code: ${response.statusCode}',
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> upKegiatan() async {
    try {
      final token = await getUserToken();
      final listKegiatan = await getKegiatan();

      for (var kegiatan in listKegiatan) {
        var response = await client.post(
          Uri.parse('$baseUrl/mahasiswa/kegiatan/create'),
          headers: {
            'accept': 'application/json',
            'authorization': 'Bearer $token',
          },
          body: {
            'deskripsi': kegiatan.deskripsi,
            'jam_mulai': kegiatan.jam,
            'jam_selesai': kegiatan.jam,
          },
        );

        if (response.statusCode == 200) {
          await deleteAllKegiatan();
          return const Right(null);
        }
      }

      return const Left('Gagal mengirim');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(_userTokenKey) ?? '';
  }

  Future<void> saveKegiatan(KegiatanModel kegiatanModel) async {
    List<KegiatanModel> existingHistory = await getKegiatan();
    int initialIndex =
        existingHistory.indexWhere((k) => k.id == kegiatanModel.id);

    if (initialIndex != -1) {
      existingHistory.removeAt(initialIndex);
      existingHistory.insert(initialIndex, kegiatanModel);
    } else {
      existingHistory.add(kegiatanModel);
      initialIndex = existingHistory.length - 1;
    }

    final encodedHistory = json.encode(existingHistory);
    await sharedPreferences.remove(_kegiatanKey);
    await sharedPreferences.setString(_kegiatanKey, encodedHistory);
  }

  Future<List<KegiatanModel>> getKegiatan() async {
    final result = sharedPreferences.getString(_kegiatanKey);
    if (result != null) {
      final decodedHistory = json.decode(result);
      if (decodedHistory is List) {
        return List<KegiatanModel>.from(
          decodedHistory.map((item) => KegiatanModel.fromJson(item)),
        );
      }
    }
    return [];
  }

  Future<void> deleteAllKegiatan() async {
    await sharedPreferences.remove(_kegiatanKey);
  }
}
