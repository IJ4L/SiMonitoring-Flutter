import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/themes.dart';
import '../../widgets/costume_card_mhs.dart';
import '../../widgets/date_picker.dart';

class LokasiPplPage extends StatelessWidget {
  const LokasiPplPage({super.key});

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
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 14.h, left: 16.w, right: 16.w),
            child: Row(
              children: [
                const Spacer(),
                Text(
                  'Juni',
                  style: blackTextStyle.copyWith(fontSize: 16.sp),
                  textScaleFactor: 1,
                ),
                SizedBox(width: 8.w),
                const Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
          ),
          const DatePicker(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(20.r),
              image: const DecorationImage(
                image: AssetImage('assets/images/backgorund.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 54.r,
                      width: 54.r,
                      margin: EdgeInsets.only(right: 20.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: kBlackColor, width: 2),
                        borderRadius: BorderRadius.circular(54.h / 2),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Makassar Digital Valley",
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 12.sp,
                          ),
                          textScaleFactor: 1,
                        ),
                        Container(
                          width: 220.w,
                          margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
                          child: Text(
                            "Jl. A. P. Pettarani No.13, Sinrijala, Kec. Panakkukang, Kota Makassar",
                            style: whiteTextStyle.copyWith(
                              fontWeight: light,
                              fontSize: 10.sp,
                            ),
                            textScaleFactor: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 21.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cardName('Dosen Pembimbing', 'Reza Maulana'),
                    cardName('Pembimbing Lapangan', 'Rini Apriliani'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: const CostumeCardMhs(),
                );
              },
              separatorBuilder: (_, index) => SizedBox(height: 12.h),
              itemCount: 6,
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
            ),
          )
        ],
      ),
    );
  }

  Container cardName(String title, String subtitle) {
    return Container(
      height: 40.h,
      width: 116.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: kWhiteColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: whiteTextStyle.copyWith(
              fontWeight: light,
              fontSize: 8.sp,
            ),
            textScaleFactor: 1,
          ),
          SizedBox(height: 2.h),
          Text(
            subtitle,
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 12.sp,
            ),
            textScaleFactor: 1,
          ),
        ],
      ),
    );
  }
}
