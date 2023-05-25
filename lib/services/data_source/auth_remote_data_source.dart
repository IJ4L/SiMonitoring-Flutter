import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<String> login(String username, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<String> login(String username, String password) async {
    try {
      final result = await http.post(
        Uri.parse('http://191.168.1.27:8000/api/login'),
        body: {
          'username': username,
          'password': password,
        },
      );

      if (result.statusCode == 200) {
        return result.body;
      }

      return 'Gagal Login';
    } catch (e) {
      throw e.toString();
    }
  }
}
