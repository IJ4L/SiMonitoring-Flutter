import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MahasiswaRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final String _userTokenKey = 'user_token';
  final String _kegiatanKey = 'user_token';

  MahasiswaRepository({required this.client, required this.sharedPreferences});

  final baseUrl = 'http://192.168.1.7:8000/api';

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

  Future<String> saveKegiatan() async {
    return sharedPreferences.getString(_kegiatanKey) ?? '';
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(_userTokenKey) ?? '';
  }
}
