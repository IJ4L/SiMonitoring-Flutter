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
    final ScrollController scrollController = ScrollController();
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
          DatePicker(scrollController: scrollController),
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
                    cardName('Dosen Pembimbing', 'Reza Maulana', true, 116),
                    cardName(
                        'Pembimbing Lapangan', 'Rini Apriliani', true, 116),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        contentPadding: EdgeInsets.zero,
                        insetPadding: EdgeInsets.zero,
                        content: dialogMahasiswa(context),
                      );
                    },
                  ),
                  child: Container(
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
                  ),
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

  Container dialogMahasiswa(BuildContext context) {
    return Container(
      height: 460.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Senin, 13 Juni 2022',
                  style: blackTextStyle.copyWith(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: kBlackColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 164.r,
            width: 164.r,
            margin: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(164.r / 2),
              border: Border.all(
                width: 4.r,
                color: kPrimaryColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardName('Jam Datang', '12.30', false, 86),
              cardName('Jam Pulang', '16.30', false, 86),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 16.w,
                  bottom: 12.h,
                  top: 22.h,
                ),
                child: Text(
                  'Deskripsi Kegiatan: ',
                  textScaleFactor: 1,
                  style: blackTextStyle.copyWith(
                    fontWeight: regular,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.r),
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  color: kSecondColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Center(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                      ),
                      SizedBox(width: 4.h),
                      Text(
                        '12.30',
                        style: whiteTextStyle,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16.r),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: kBlackColor),
            ),
            child: Text(
              "Lorem ipsum dolor sit amedo eiusmod empor incididunt ut sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              textScaleFactor: 1,
              style: blackTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container cardName(
      String title, String subtitle, bool bgColor, double width) {
    return Container(
      height: 40.h,
      width: width.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: bgColor ? kWhiteColor.withOpacity(0.2) : kPrimaryColor,
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
