import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simor/shared/themes.dart';
import 'package:simor/ui/widgets/costume_dialog.dart';

import '../../../cubit/index_cubit.dart';
import '../../widgets/form_input_kegiatan.dart';

class Kegiatanmahasiswa extends StatelessWidget {
  const Kegiatanmahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> page =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final IndexCubit index = context.read<IndexCubit>();
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
                  onTap: () => Navigator.pop(context),
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
        child: Column(
          children: [
            BlocBuilder<IndexCubit, int>(
              builder: (context, state) {
                final pageProveus = page['type'];
                return Container(
                  height: 200.h * state,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 12.h),
                  child: ListView.separated(
                    itemBuilder: (context, index) => FormInputKegiatan(
                      title: pageProveus == true
                          ? 'Deskripsi Kegiatan:'
                          : 'Kendala:',
                      wrong: pageProveus == true
                          ? 'Deskripsikan Rencana Kegiatanmu Hari Ini'
                          : 'Deskripsikan kendalamu hari ini',
                      waktu: pageProveus,
                    ),
                    separatorBuilder: (_, index) => SizedBox(height: 12.h),
                    itemCount: state,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  page['type'] == true
                      ? ButtonWithIcon(
                          title: 'Tambah',
                          icon: "assets/icons/add.svg",
                          color: kTransparantColor,
                          colorBorder: kSecondColor,
                          ontap: () => index.increment(),
                        )
                      : Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 2.5,
                          ),
                        ),
                  SizedBox(width: 16.h),
                  ButtonWithIcon(
                    title: "Simpan",
                    icon: "assets/icons/memory.svg",
                    colorBorder: kWhiteColor,
                    ontap: () => showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return Dialoginfo(
                          title: page['type'] == true
                              ? 'Rencana kegiatan\nberhasil di simpan'
                              : 'Kendala berhasil di simpan!',
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            // page['type'] == true ? SizedBox(height: 12.h) : const SizedBox(),
          ],
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
