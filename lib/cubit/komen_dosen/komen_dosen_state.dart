part of 'komen_dosen_cubit.dart';

sealed class KomenDosenState extends Equatable {
  const KomenDosenState();

  @override
  List<Object> get props => [];
}

final class KomenDosenInitial extends KomenDosenState {}

final class KomenDosenLoading extends KomenDosenState {}

final class KomenDosenLoaded extends KomenDosenState {
  final List<KomenDosenModel> komenDosenModel;
  const KomenDosenLoaded({required this.komenDosenModel});

  @override
  List<Object> get props => [komenDosenModel];
}

final class KomenDosenError extends KomenDosenState {
  final String message;

  const KomenDosenError({required this.message});

  @override
  List<Object> get props => [message];
}
