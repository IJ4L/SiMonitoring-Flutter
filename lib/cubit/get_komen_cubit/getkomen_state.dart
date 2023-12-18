part of 'getkomen_cubit.dart';

sealed class GetkomenState extends Equatable {
  const GetkomenState();

  @override
  List<Object> get props => [];
}

final class GetkomenInitial extends GetkomenState {}

final class GetkomenLoading extends GetkomenState {}

final class GetkomenLoaded extends GetkomenState {
  final List<KomenModel> komen;
  const GetkomenLoaded({required this.komen});

  @override
  List<Object> get props => [komen];
}

final class GetkomenError extends GetkomenState {
  final String message;
  const GetkomenError({required this.message});

  @override
  List<Object> get props => [message];
}
