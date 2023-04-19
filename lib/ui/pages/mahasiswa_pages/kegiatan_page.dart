import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/shared/colors.dart';

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
                top: 65.h,
                left: 22.w,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 45.h),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 55.h,
                    width: 202.w,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 14.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deskripsi Kegiatan:',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: textInfoColor,
                  ),
                  textScaleFactor: 1,
                ),
                Container(
                  height: 24.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: secongColor,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/clock.png",
                        height: 14.r,
                        width: 14.r,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Pilih Waktu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Deskripsikan Rencana Kegiatanmu Hari Ini',
                hintStyle: TextStyle(
                  color: greyColor.withOpacity(0.4),
                  fontStyle: FontStyle.italic,
                  fontSize: 12.sp,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(color: textInfoColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: const BorderSide(
                    color: textInfoColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 42.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: secongColor,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add, color: secongColor),
                            SizedBox(
                              width: 19.0.w,
                            ),
                            Text(
                              'Tambah',
                              style: TextStyle(
                                color: secongColor,
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
                ),
                SizedBox(width: 16.h),
                Expanded(
                  child: Container(
                    height: 42.h,
                    width: 154,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/memory.png",
                              width: 16.r,
                              height: 16.r,
                              fit: BoxFit.fill,
                              color: whiteColor,
                            ),
                            SizedBox(
                              width: 19.0.w,
                            ),
                            Text(
                              'Tambah',
                              style: TextStyle(
                                color: whiteColor,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
