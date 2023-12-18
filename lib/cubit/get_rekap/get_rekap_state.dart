part of 'get_rekap_cubit.dart';

sealed class GetRekapState extends Equatable {
  const GetRekapState();

  @override
  List<Object> get props => [];
}

final class GetRekapInitial extends GetRekapState {}

final class GetRekapLoading extends GetRekapState {}

final class GetRekapLoaded extends GetRekapState {
  final String url;

  const GetRekapLoaded(this.url);

  @override
  List<Object> get props => [url];
}

final class GetRekapError extends GetRekapState {
  final String message;

  const GetRekapError(this.message);

  @override
  List<Object> get props => [message];
}
