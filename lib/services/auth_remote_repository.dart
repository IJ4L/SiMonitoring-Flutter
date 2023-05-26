import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final String _userTokenKey = 'user_token';

  AuthRepository({required this.client, required this.sharedPreferences});

  Future<Either<String, void>> login(String username, String password) async {
    try {
      final response = await client.post(
        Uri.parse('http://192.168.123.197:8000/api/login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      String token = response.body;

      if (response.statusCode == 200) {
        await setToken(token);
      }

      return Left(response.statusCode.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> getDataUser(String token) async {
    try {
      final response = await client.get(
        Uri.parse('http://192.168.123.197:8000/api/me'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return Right(response.body);
      }

      return Left(response.statusCode.toString());
    } catch (e) {
      return Left(e.toString());
    }
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
