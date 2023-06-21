import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/themes.dart';

class AkhirPplPage extends StatelessWidget {
  const AkhirPplPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'assets/images/img_appbar_dosen.svg',
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 50.h,
                left: 14.w,
                right: 14.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: kWhiteColor,
                      ),
                    ),
                    Container(
                      height: 40.r,
                      width: 40.r,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 72.h),
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                width: 1.0,
                color: kGreyColor.withOpacity(0.2),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  child: SvgPicture.asset(
                    'assets/icons/succes_orange.svg',
                    width: 140.r,
                    height: 140.r,
                  ),
                ),
                Text(
                  'PPL telah berakhir!',
                  style: blackTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: semiBold,
                  ),
                  textScaleFactor: 1,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Silahkan download rekapitulasi kegiatan!',
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: light,
                  ),
                  textScaleFactor: 1,
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  margin:
                      EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: kSecondColor),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/cloud_download.svg'),
                      SizedBox(width: 8.h),
                      Text(
                        'Unduh Rekapitulasi',
                        style: orangeTextStyle.copyWith(
                          fontSize: 14.sp,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
