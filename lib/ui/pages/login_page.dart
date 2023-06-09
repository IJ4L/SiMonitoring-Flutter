import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/cubit/pembimbing_cubit/pembimbing_cubit.dart';
import 'package:simor/shared/themes.dart';

import '../../cubit/auth_cubit/auth_cubit.dart';
import '../../cubit/loading_button_cubit.dart';
import '../../cubit/obscure_text_cubit.dart';
import '../widgets/form_input_with_title.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final authCUbit = context.read<AuthCubit>();
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthMahsiswa) {
            context.read<LodingButtonCubit>().toggleInit();
            Navigator.pushNamed(
              context,
              '/info-scan',
              arguments: {
                'title': 'Datang',
                'bg': 'bg_scan_1.svg',
                'card': 'bg_scan_In.svg',
                'type': true,
              },
            );
          }
          if (state is AuthPembimbing) {
            context.read<PembimbingCubit>().getMahasiswa();
            context.read<LodingButtonCubit>().toggleInit();
            Navigator.pushReplacementNamed(context, '/home-pembimbing');
          }
          if (state is AuthDosen) {
            Navigator.pushReplacementNamed(context, '/home-dosen');
          }
          if (state is AuthFailed) {
            context.read<LodingButtonCubit>().toggleInit();
          }
        },
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Stack(
            children: [
              Image.asset(
                "assets/images/backgorund.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        Image.asset(
                          "assets/images/logo.png",
                          height: 54.h,
                          width: 197.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 56.h),
                        Text(
                          'MONITORING',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 46.sp,
                          ),
                          textScaleFactor: 1,
                        ),
                        Text(
                          'PRAKTEK PENGENALAN LAPANGAN',
                          style: whiteTextStyle.copyWith(
                            fontSize: 16.sp,
                            fontWeight: light,
                          ),
                          textScaleFactor: 1,
                        ),
                        SizedBox(height: 48.h),
                        TextfieldMaker(
                          title: 'Username',
                          showIcon: false,
                          controller: usernameController,
                        ),
                        SizedBox(height: 16.h),
                        BlocBuilder<ObscureTextCubit, bool>(
                          builder: (context, state) {
                            return TextfieldMaker(
                              title: 'Password',
                              obscure: state,
                              showIcon: true,
                              icon: state
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              controller: passwordController,
                            );
                          },
                        ),
                        SizedBox(height: 32.h),
                        Container(
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () async {
                                context
                                    .read<LodingButtonCubit>()
                                    .toggleLoading();
                                await authCUbit.login(
                                  usernameController.text,
                                  passwordController.text,
                                );
                                final role = await authCUbit.getRole();
                                if (role == 'mahasiswa') {
                                  authCUbit.getDataMahasiswa();
                                }
                                if (role == 'pembimbing_lapangan') {
                                  authCUbit.getDataPembimbing();
                                }
                                if (role == 'dosen_pembimbing') {
                                  authCUbit.getDataDosen();
                                }
                              },
                              borderRadius: BorderRadius.circular(8.w),
                              child: SizedBox(
                                height: 40.h,
                                width: double.infinity,
                                child: BlocBuilder<LodingButtonCubit, bool>(
                                  builder: (context, state) {
                                    return Center(
                                      child: state
                                          ? SizedBox(
                                              height: 16.r,
                                              width: 16.r,
                                              child: CircularProgressIndicator(
                                                color: kPrimaryColor,
                                                strokeWidth: 3.r,
                                              ),
                                            )
                                          : Text(
                                              'Login',
                                              style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                              ),
                                              textScaleFactor: 1,
                                            ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
