part of 'get_kendala_dosen_cubit.dart';

sealed class GetKendalaDosenState extends Equatable {
  const GetKendalaDosenState();

  @override
  List<Object> get props => [];
}

final class GetKendalaDosenInitial extends GetKendalaDosenState {}
final class GetKendalaDosenLoading extends GetKendalaDosenState {}
final class GetKendalaDosenLoaded extends GetKendalaDosenState {
  final String kendala;

  const GetKendalaDosenLoaded({required this.kendala});

  @override
  List<Object> get props => [kendala];
}
final class GetKendalaDosenError extends GetKendalaDosenState {
  final String message;

  const GetKendalaDosenError({required this.message});

  @override
  List<Object> get props => [message];
}
