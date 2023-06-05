import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simor/models/kegiatan_model.dart';

class MahasiswaRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final String _userTokenKey = 'user_token';
  final String _kegiatanKey = 'kegiatan';

  MahasiswaRepository({required this.client, required this.sharedPreferences});

  final baseUrl = 'http://192.168.234.197:8000/api';

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
      } else {
        return Left(
          'Gagal mengirim gambar. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(_userTokenKey) ?? '';
  }

  Future<void> saveKegiatan(KegiatanModel kegiatanModel) async {
    List<KegiatanModel> existingHistory = await getKegiatan();
    final index = existingHistory.indexWhere((k) => k.id == kegiatanModel.id);
    if (index != -1) {
      existingHistory[index] = kegiatanModel;
      final encodedHistory = json.encode(existingHistory);
      await sharedPreferences.setString(_kegiatanKey, encodedHistory);
    } else {
      existingHistory.add(kegiatanModel);
      final encodedHistory = json.encode(existingHistory);
      await sharedPreferences.setString(_kegiatanKey, encodedHistory);
    }
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

  Future<void> deleteHistory() async {
    await sharedPreferences.remove(_kegiatanKey);
  }
}
