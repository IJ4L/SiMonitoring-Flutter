import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simor/services/mahasiswa_repository.dart';
import 'package:simor/services/pebimbing_repository.dart';

part 'check_days_state.dart';

class CheckDaysCubit extends Cubit<CheckDaysState> {
  final PembimbingRepository pembimbingRepository;
  final MahasiswaRepository mahasiswaRepository;
  CheckDaysCubit(
      {required this.mahasiswaRepository, required this.pembimbingRepository})
      : super(CheckDaysInitial());

  Future<void> checkDaysPembimbing() async {
    emit(CheckDaysLoading());
    final result = await pembimbingRepository.checkDaysPembimbing();
    result.fold(
      (error) => emit(CheckDaysFailure(message: error)),
      (succes) => emit(CheckDayPembimbing(days: succes)),
    );
  }

  Future<void> checkDaysMahasiswa() async {
    emit(CheckDaysLoading());
    final result = await mahasiswaRepository.checkDaysMahasiswa();
    result.fold(
      (error) => emit(CheckDaysFailure(message: error)),
      (succes) => emit(CheckDayMahasiswa(days: succes)),
    );
  }

  @override
  void onChange(Change<CheckDaysState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
