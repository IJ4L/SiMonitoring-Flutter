import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../cubit/date_index_cubit.dart';
import '../../shared/themes.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  void _scrollTo(double offset) {
    if (offset <= widget.scrollController.position.maxScrollExtent &&
        offset >= widget.scrollController.position.minScrollExtent) {
      widget.scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<DateFilterCubit, int>(
          builder: (context, state) {
            return Container(
              height: 45.h,
              width: 250.w,
              margin: EdgeInsets.only(top: 16.h, left: 21.w, right: 21.w),
              child: NotificationListener(
                onNotification: (notification) {
                  if (notification is OverscrollIndicatorNotification) {
                    notification.disallowIndicator();
                  }
                  return false;
                },
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  controller: widget.scrollController,
                  itemBuilder: (context, index) {
                    final day = (index % 7);
                    return GestureDetector(
                      onTap: () =>
                          context.read<DateFilterCubit>().setDate(index),
                      child: Container(
                        height: 45.r,
                        width: 45.r,
                        decoration: BoxDecoration(
                          color: index == state ? kSecondColor : null,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              daysOfWeek[day],
                              style: blackTextStyle.copyWith(
                                fontSize: 12.sp,
                                color:
                                    index == state ? kWhiteColor : kBlackColor,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '${index + 1}',
                              style: blackTextStyle.copyWith(
                                fontSize: 16.sp,
                                color:
                                    index == state ? kWhiteColor : kBlackColor,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(width: 6.w),
                  itemCount: 45,
                ),
              ),
            );
          },
        ),
        GestureDetector(
          onTap: () {
            final currentPosition = widget.scrollController.position.pixels;
            final viewportWidth =
                widget.scrollController.position.viewportDimension;
            final itemWidth = 45.r;
            final scrollOffset = currentPosition + viewportWidth - itemWidth;
            _scrollTo(scrollOffset);
          },
          child: Container(
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
        ),
      ],
    );
  }
}
