import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:simor/models/dosen_pembimbing_model.dart';
import 'package:simor/models/mahasiswa_model.dart';

class AuthRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final String _userTokenKey = 'user_token';

  AuthRepository({required this.client, required this.sharedPreferences});

  final baseUrl = 'http://192.168.1.29:8000/api';

  Future<Either<String, void>> login(String username, String password) async {
    try {
      await removeUserToken();
      final response = await client.post(
        Uri.parse('$baseUrl/login'),
        headers: {'accept': 'application/json'},
        body: {'username': username, 'password': password},
      );

      String token = response.body;

      if (response.statusCode == 200) {
        await setToken(token);
        return const Right(null);
      }

      return Left(response.statusCode.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MahasiswaModel>> getDataMahasiswa() async {
    try {
      final token = await getUserToken();

      final response = await client.get(
        Uri.parse('$baseUrl/me'),
        headers: {'Authorization': 'Bearer $token'},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final model = MahasiswaModel(
          nama: data['data']['nama'],
          nim: data['data']['nim'],
          gambar: data['data']['gambar'],
          roles: data['data']['roles'],
          dosenPembimbing: data['data']['dosen_pembimbing'],
          pembimbingLapangan: data['data']['pembimbing_lapangan'],
          lokasi: data['data']['lokasi'],
        );
        return Right(model);
      }

      return Left(response.statusCode.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, DosenPembimbinfModel>> getDataDosenPembimbing() async {
    try {
      final token = await getUserToken();

      final response = await client.get(
        Uri.parse('$baseUrl/me'),
        headers: {'Authorization': 'Bearer $token'},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Right(DosenPembimbinfModel.fromJson(data['data']));
      }

      return Left(response.statusCode.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<String> getRoleUser() async {
    final token = await getUserToken();

    final response = await client.get(
      Uri.parse('$baseUrl/me'),
      headers: {'Authorization': 'Bearer $token'},
    );

    final data = jsonDecode(response.body);

    return data['data']['roles'];
  }

  Future<void> setToken(String token) {
    return sharedPreferences.setString(_userTokenKey, token);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(_userTokenKey) ?? "";
  }

  Future<void> removeUserToken() {
    return sharedPreferences.remove(_userTokenKey);
  }
}
