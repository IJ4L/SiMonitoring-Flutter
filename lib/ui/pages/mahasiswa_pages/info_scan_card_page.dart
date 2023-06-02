import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simor/cubit/auth_cubit/auth_cubit.dart';
import 'package:simor/shared/themes.dart';

class InfoScan extends StatefulWidget {
  const InfoScan({super.key});

  @override
  State<InfoScan> createState() => _InfoScanState();
}

class _InfoScanState extends State<InfoScan> {
  @override
  void initState() {
    // context.read<AuthCubit>().checkDatang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        // onTap: () => context.read<AuthCubit>().checkDatang(),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamed(context, '/home-mahasiswa');
            }
          },
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/${item['bg']}",
                height: 202.h,
                fit: BoxFit.fill,
              ),
              SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 54.h,
                        width: 197.w,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 36.h),
                    SvgPicture.asset(
                      'assets/images/${item['card']}',
                      width: 320.w,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 45.h),
                    Text(
                      'Scan Kartu Anda!',
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                      textScaleFactor: 1,
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/vector_scan.png",
                      width: 120.r,
                      height: 120.r,
                      fit: BoxFit.fill,
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 60.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: Text(
                        'Silahkan Scan Kartu Anda Pada Perangkat Pembimbing Lapangan ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                        textScaleFactor: 1,
                      ),
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
