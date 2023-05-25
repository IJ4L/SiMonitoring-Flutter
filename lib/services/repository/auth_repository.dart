import 'package:dartz/dartz.dart';
import 'package:simor/services/data_source/auth_remote_data_source.dart';

abstract class AuthRepository {
  Future<Either<String, String>> login(String username, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      final result = await authRemoteDataSource.login(username, password);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
