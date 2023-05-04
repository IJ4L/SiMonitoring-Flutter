import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/cubit/index_cubit.dart';
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
    final IndexCubit index = context.read<IndexCubit>();
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
                          const Infoprofile(
                            title: 'Nama Mahasiswa:',
                            value: 'John Doe',
                          ),
                          const Infoprofile(
                            title: 'Nim:',
                            value: '60900121070',
                          ),
                          const Infoprofile(
                            title: 'Tempat PPL:',
                            value: 'Makassar Digital Valley',
                          ),
                          const Infoprofile(
                            title: 'Dosen Pembimbing:',
                            value: 'Reza Maulana',
                          ),
                          SizedBox(height: 16.h),
                          Costumebutton(
                            title: 'Datang',
                            ontap: () => Navigator.pushNamed(
                              context,
                              '/take-picture',
                              arguments: {'type': true, 'inOut': true},
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Costumebutton(
                            title: 'Kegiatan',
                            ontap: () {
                              index.initial();
                              Navigator.pushNamed(
                                context,
                                '/kegiatan-mahasiswa',
                                arguments: {'type': true},
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          Costumebutton(
                            title: 'Kendala',
                            ontap: () {
                              index.initial();
                              Navigator.pushNamed(
                                context,
                                '/kegiatan-mahasiswa',
                                arguments: {'type': false},
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          Costumebutton(
                            title: 'Pulang',
                            ontap: () {
                              Navigator.pushNamed(
                                context,
                                '/take-picture',
                                arguments: {'inOut': false},
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80.h,
                left: 110.w,
                child: Container(
                  width: 139.r,
                  height: 139.r,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.circular(139.r / 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(139.r / 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
