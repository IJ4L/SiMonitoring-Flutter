import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simor/shared/themes.dart';
import 'package:simor/ui/widgets/costume_button.dart';
import 'package:simor/ui/widgets/date_picker.dart';

class HomeDosenPage extends StatelessWidget {
  const HomeDosenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: whiteTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Reza Maulana',
                          style: whiteTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
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
          GestureDetector(
            onTap: () => showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  contentPadding: EdgeInsets.zero,
                  insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  content: Container(
                    height: 360.h,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CardKendala(fade: true),
                        Container(
                          margin: EdgeInsets.only(left: 16.w, bottom: 12.h),
                          child: Text(
                            'Kendala',
                            textScaleFactor: 1,
                            style: blackTextStyle.copyWith(
                              fontWeight: regular,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16.r),
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: kBlackColor),
                          ),
                          child: Text(
                            "Lorem ipsum dolor sit amedo eiusmod tempor incididunt uttempor incididunt uteiusmod tempor incididunt ut sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            textScaleFactor: 1,
                            style: blackTextStyle.copyWith(
                              fontWeight: regular,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 76.w),
                          child: Costumebutton(
                            title: 'Terima',
                            ontap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
            child: const CardKendala(fade: false),
          ),
          Container(
            margin: EdgeInsets.only(left: 16.w, bottom: 18.h),
            child: Text(
              'Lokasi PPL',
              textScaleFactor: 1,
              style: blackTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: medium,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return cardPpl(context);
              },
              separatorBuilder: (_, index) => SizedBox(height: 12.h),
              padding: EdgeInsets.only(
                right: 16.w,
                left: 16.w,
                bottom: 16.h,
                top: 4.h,
              ),
              itemCount: 7,
            ),
          )
        ],
      ),
    );
  }

  GestureDetector cardPpl(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/lokasi-ppl');
      },
      child: Container(
        height: 108.h,
        width: double.infinity,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 64.r,
              width: 64.r,
              margin: EdgeInsets.only(right: 20.w),
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(64.h / 2),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Makassar Digital Valley",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 12.sp,
                  ),
                  textScaleFactor: 1,
                ),
                Container(
                  width: 200.w,
                  margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
                  child: Text(
                    "Jl. A. P. Pettarani No.13, Sinrijala, Kec. Panakkukang, Kota Makassar",
                    overflow: TextOverflow.fade,
                    textScaleFactor: 1,
                    style: blackTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
                Container(
                  height: 0.5,
                  width: 200.w,
                  margin: EdgeInsets.only(bottom: 8.h),
                  color: kBlackColor.withOpacity(0.2),
                ),
                Row(
                  children: [
                    const Text(
                      'Presentase Kehadiran:',
                      textScaleFactor: 1,
                    ),
                    Container(
                      height: 16.h,
                      width: 32.w,
                      margin: EdgeInsets.only(left: 9.w),
                      decoration: BoxDecoration(
                        color: kSecondColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Text(
                          '80 %',
                          style: orangeTextStyle.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardKendala extends StatelessWidget {
  const CardKendala({
    super.key,
    required this.fade,
  });

  final bool fade;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: kYellowColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kYellowColor),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/error.svg',
            width: 24.r,
            height: 24.r,
          ),
          SizedBox(width: 14.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Info Kendala',
                style: yellowTextStyle.copyWith(fontWeight: semiBold),
                textScaleFactor: 1,
              ),
              SizedBox(height: 6.h),
              SizedBox(
                width: 220.w,
                child: Text(
                  'Jl. A. P. Pettarani No.13, Sinrijala, Kec. Panakkukang, Kota Makassar',
                  style: yellowTextStyle.copyWith(fontWeight: regular),
                  textScaleFactor: 1,
                  overflow: fade ? TextOverflow.fade : TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          fade
              ? const SizedBox()
              : const Icon(
                  Icons.close,
                  color: kYellowColor,
                  size: 24.0,
                ),
        ],
      ),
    );
  }
}
