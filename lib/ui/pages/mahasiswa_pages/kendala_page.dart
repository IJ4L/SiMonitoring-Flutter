import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simor/cubit/mahasiswa_cubit/mahasiswa_cubit.dart';
import 'package:simor/shared/themes.dart';

import '../../widgets/costume_dialog.dart';

class KendalaMahasiswa extends StatefulWidget {
  const KendalaMahasiswa({super.key});

  @override
  State<KendalaMahasiswa> createState() => _KendalaMahasiswaState();
}

class _KendalaMahasiswaState extends State<KendalaMahasiswa> {
  @override
  Widget build(BuildContext context) {
    final kendalaCubit = context.read<MahasiswaCubit>();
    TextEditingController kendalaController = TextEditingController();
    final fromkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(
          height: 130.h,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/backgorund.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.w)),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home-mahasiswa',
                      (route) => false,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 55.h,
                  width: 202.w,
                  fit: BoxFit.fill,
                ),
                const SizedBox(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20.w, top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kendala:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: kTextInfoColor,
                    ),
                    textScaleFactor: 1,
                  ),
                  BlocBuilder<MahasiswaCubit, MahasiswaState>(
                    builder: (context, state) {
                      if (state is MahasiswaGetKendala) {
                        return Container(
                          height: 16.h,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          decoration: BoxDecoration(
                            color: state.kendala.status != 0
                                ? Colors.green
                                : kSecondColor,
                            borderRadius: BorderRadius.circular(4.w),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/clock.svg",
                                height: 10.r,
                                width: 10.r,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(width: 8.w),
                              state.kendala.status != 0
                                  ? Text(
                                      'Diterima',
                                      style: whiteTextStyle,
                                    )
                                  : Text(
                                      'Belum di terima',
                                      style: whiteTextStyle,
                                    )
                            ],
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
              BlocConsumer<MahasiswaCubit, MahasiswaState>(
                listener: (context, state) {
                  if (state is MahasiswaGetKendala) {
                    kendalaController.text = state.kendala.deskripsi;
                  }
                },
                builder: (context, state) {
                  if (state is MahasiswaGetKendala) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: TextFormField(
                        controller: kendalaController,
                        maxLines: 7,
                        cursorColor: kBlackColor,
                        readOnly: true,
                        style: TextStyle(color: kGreyColor.withOpacity(0.6)),
                        decoration: InputDecoration(
                          hintText: 'Deskripsikan Rencana Kegiatanmu Hari Ini',
                          hintStyle: TextStyle(
                            color: kGreyColor.withOpacity(0.4),
                            fontStyle: FontStyle.italic,
                            fontSize: 12.sp,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                              color: kGreyColor.withOpacity(0.6),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                              color: kGreyColor.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return Form(
                    key: fromkey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: TextFormField(
                        controller: kendalaController,
                        maxLines: 7,
                        cursorColor: kBlackColor,
                        style: const TextStyle(color: kBlackColor),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan Mengisi From Kendala!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Deskripsikan Rencana Kegiatanmu Hari Ini',
                          hintStyle: TextStyle(
                            color: kGreyColor.withOpacity(0.4),
                            fontStyle: FontStyle.italic,
                            fontSize: 12.sp,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: kTextInfoColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                              color: kTextInfoColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  BlocBuilder<MahasiswaCubit, MahasiswaState>(
                    builder: (context, state) {
                      if (state is MahasiswaGetKendala) {
                        return Container();
                      }
                      return Container(
                        height: 42.h,
                        width: MediaQuery.of(context).size.width / 2.2,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: kPrimaryColor),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (fromkey.currentState!.validate()) {
                                kendalaCubit.kirimKendala(
                                  kendalaController.text,
                                );
                                context.read<MahasiswaCubit>().cekKendala();
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    kendalaCubit.kirimKendala(
                                      kendalaController.text,
                                    );
                                    return const Dialoginfo(
                                      title:
                                          'Kendala kegiatan\nberhasil di simpan',
                                    );
                                  },
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Kirim',
                                  style: TextStyle(
                                    color: kWhiteColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                  textScaleFactor: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
