import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simor/cubit/mahasiswa_cubit/mahasiswa_cubit.dart';
import 'package:simor/cubit/time_cubit.dart';
import 'package:simor/models/kegiatan_model.dart';
import 'package:simor/shared/themes.dart';
import 'package:simor/ui/widgets/costume_dialog.dart';

import '../../widgets/form_input_kegiatan.dart';

class Kegiatanmahasiswa extends StatefulWidget {
  const Kegiatanmahasiswa({super.key});

  @override
  State<Kegiatanmahasiswa> createState() => _KegiatanmahasiswaState();
}

class _KegiatanmahasiswaState extends State<Kegiatanmahasiswa> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _addTextField();
    context.read<MahasiswaCubit>().getKegiatan();
    context.read<TimeCubit>().addnew();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addTextField() {
    _controllers.add(TextEditingController());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocListener<MahasiswaCubit, MahasiswaState>(
        listener: (context, state) {
          if (state is MahasiswaGetkegiatan) {
            if (state.kegiatan.isNotEmpty) {
              _controllers.clear();
              for (var i = 0; i < state.kegiatan.length; i++) {
                final data = state.kegiatan[i];
                _controllers.add(TextEditingController(text: data.deskripsi));
                context.read<TimeCubit>().addTime(data.jam, i);
              }
            }
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<MahasiswaCubit, MahasiswaState>(
                builder: (context, state) {
                  if (state is MahasiswaGetkegiatan) {
                    return Container(
                      height: 160.h * _controllers.length,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 12.h),
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return FormInputKegiatan(
                            controller: _controllers[index],
                            title: 'Deskripsi Kegiatan:',
                            index: index,
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(height: 12.h),
                        itemCount: _controllers.length,
                      ),
                    );
                  }
                  return Container();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWithIcon(
                      title: 'Tambah',
                      icon: "assets/icons/add.svg",
                      color: kTransparantColor,
                      colorBorder: kSecondColor,
                      ontap: () {
                        _addTextField();
                        context.read<TimeCubit>().addnew();
                      },
                    ),
                    SizedBox(width: 16.h),
                    ButtonWithIcon(
                      title: "Simpan",
                      icon: "assets/icons/memory.svg",
                      colorBorder: kWhiteColor,
                      ontap: () {
                        for (var i = 0; i < _controllers.length; i++) {
                          context.read<MahasiswaCubit>().saveKegiatan(
                                KegiatanModel(
                                  id: i.toString(),
                                  jam: context.read<TimeCubit>().state[i],
                                  deskripsi: _controllers[i].text,
                                ),
                              );
                        }
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return const Dialoginfo(
                              title: 'Rencana kegiatan\nberhasil di simpan',
                            );
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.title,
    required this.icon,
    this.color = kPrimaryColor,
    this.colorBorder = kTransparantColor,
    required this.ontap,
  });

  final String icon, title;
  final Color color, colorBorder;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 42.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: colorBorder),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: ontap,
            borderRadius: BorderRadius.circular(8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 16.r,
                  height: 16.r,
                  fit: BoxFit.fill,
                ),
                SizedBox(width: 19.w),
                Text(
                  title,
                  style: TextStyle(
                    color: colorBorder,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                  textScaleFactor: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
