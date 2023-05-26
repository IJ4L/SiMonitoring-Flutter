import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/themes.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 45.h,
          width: 250.w,
          margin: EdgeInsets.only(top: 16.h, left: 21.w, right: 21.w),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                height: 45.r,
                width: 45.r,
                decoration: BoxDecoration(
                  color: index == 0 ? kSecondColor : null,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sel',
                      style: blackTextStyle.copyWith(
                        fontSize: 12.sp,
                        color: index == 0 ? kWhiteColor : kBlackColor,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${index + 1}',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.sp,
                        color: index == 0 ? kWhiteColor : kBlackColor,
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (_, index) => SizedBox(width: 6.w),
            itemCount: 30,
          ),
        ),
        Container(
          height: 45.r,
          width: 45.r,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/icons/next_date.svg',
                width: 40.r,
                height: 20.r,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
