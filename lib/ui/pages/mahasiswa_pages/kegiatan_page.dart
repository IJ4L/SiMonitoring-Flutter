import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simor/shared/colors.dart';

import '../../widgets/form_input_kegiatan.dart';

class Kegiatanmahasiswa extends StatelessWidget {
  const Kegiatanmahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25.w),
                ),
                child: Image.asset(
                  "assets/images/backgorund.png",
                  width: MediaQuery.of(context).size.width,
                  height: 130.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 22.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
          Container(
            height: 160.h * 3,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 12.h),
            child: ListView.separated(
              itemBuilder: (context, index) => const FormInputKegiatan(),
              separatorBuilder: (_, index) => SizedBox(height: 12.h),
              itemCount: 3,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonWithIcon(
                  title: 'Tambah',
                  icon: "assets/icons/add.svg",
                  color: transparantColor,
                  colorBorder: secongColor,
                ),
                SizedBox(width: 16.h),
                const ButtonWithIcon(
                  title: "Simpan",
                  icon: "assets/icons/memory.svg",
                  colorBorder: whiteColor,
                )
              ],
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    super.key,
    required this.title,
    required this.icon,
    this.color = primaryColor,
    this.colorBorder = transparantColor,
  });

  final String icon, title;
  final Color color, colorBorder;

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
            onTap: () {},
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
                SizedBox(
                  width: 19.0.w,
                ),
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
