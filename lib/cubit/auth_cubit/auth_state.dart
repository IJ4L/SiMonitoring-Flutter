part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String token;

  const AuthLoginSuccess({required this.token});

  @override
  List<Object> get props => [token];
}

class AuthLoginFailed extends AuthState {}
