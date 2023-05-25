import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simor/services/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());
    final result = await authRepository.login(username, password);
    result.fold(
      (error) => AuthLoginFailed(),
      (token) {
        if (kDebugMode) {
          print(token);
        }
      },
    );
  }
}
