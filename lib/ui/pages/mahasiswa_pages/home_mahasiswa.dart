import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/cubit/auth_cubit/auth_cubit.dart';
import 'package:simor/cubit/come_out_cubit/come_out_cubit.dart';
import 'package:simor/cubit/mahasiswa_cubit/mahasiswa_cubit.dart';
import 'package:simor/shared/themes.dart';
import 'package:simor/ui/widgets/costume_button.dart';

import '../../widgets/costume_card.dart';

class Homemahasiswa extends StatefulWidget {
  const Homemahasiswa({super.key});

  @override
  State<Homemahasiswa> createState() => _HomemahasiswaState();
}

class _HomemahasiswaState extends State<Homemahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 780.h,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/backgorund.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Positioned.fill(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 634.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.w),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SizedBox(height: 100.h),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              if (state is AuthMahsiswa) {
                                final data = state.mahasiswaModel;
                                return Column(
                                  children: [
                                    Infoprofile(
                                      title: 'Nama Mahasiswa:',
                                      value: data.nama,
                                    ),
                                    Infoprofile(
                                      title: 'Nim:',
                                      value: data.nim,
                                    ),
                                    Infoprofile(
                                      title: 'Tempat PPL:',
                                      value: data.lokasi,
                                    ),
                                    Infoprofile(
                                      title: 'Dosen Pembimbing:',
                                      value: data.pembimbingLapangan,
                                    ),
                                  ],
                                );
                              }
                              return Container();
                            },
                          ),
                          SizedBox(height: 16.h),
                          BlocBuilder<ComeOutCubit, ComeOutState>(
                            builder: (context, state) {
                              if (state is ComeOutDatang) {
                                final data = state.datangModel.keterangan;
                                return Column(
                                  children: [
                                    data == 'null'
                                        ? Costumebutton(
                                            title: 'Datang',
                                            ontap: () => Navigator.pushNamed(
                                              context,
                                              '/take-picture',
                                              arguments: {
                                                'type': true,
                                                'inOut': true
                                              },
                                            ),
                                          )
                                        : Costumebutton(
                                            title: 'Datang',
                                            colorButton: kDisableColor,
                                            ontap: () {},
                                          ),
                                    SizedBox(height: 10.h),
                                    data != 'null'
                                        ? Costumebutton(
                                            title: 'Kegiatan',
                                            ontap: () {
                                              context
                                                  .read<MahasiswaCubit>()
                                                  .getKegiatan();
                                              Navigator.pushNamed(
                                                context,
                                                '/kegiatan-mahasiswa',
                                              );
                                            },
                                          )
                                        : Costumebutton(
                                            title: 'Kegiatan',
                                            colorButton: kDisableColor,
                                            ontap: () {},
                                          ),
                                    SizedBox(height: 10.h),
                                    data != 'null'
                                        ? Costumebutton(
                                            title: 'Kendala',
                                            ontap: () {
                                              context
                                                  .read<MahasiswaCubit>()
                                                  .cekKendala();
                                              Navigator.pushNamed(
                                                context,
                                                '/kendala-mahasiswa',
                                              );
                                            },
                                          )
                                        : Costumebutton(
                                            title: 'Kendala',
                                            colorButton: kDisableColor,
                                            ontap: () {},
                                          ),
                                    SizedBox(height: 10.h),
                                    data != 'null'
                                        ? Costumebutton(
                                            title: 'Pulang',
                                            ontap: () {
                                              Navigator.pushNamed(
                                                context,
                                                '/take-picture',
                                                arguments: {'inOut': false},
                                              );
                                            },
                                          )
                                        : Costumebutton(
                                            title: 'Pulang',
                                            colorButton: kDisableColor,
                                            ontap: () {},
                                          ),
                                  ],
                                );
                              }
                              return Container();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80.h,
                left: 110.w,
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthMahsiswa) {
                      final data = state.mahasiswaModel;
                      return Container(
                        width: 139.r,
                        height: 139.r,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data.gambar),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(139.r / 2),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
