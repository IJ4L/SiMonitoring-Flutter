import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/shared/colors.dart';
import 'package:simor/ui/widgets/costume_button.dart';

import '../../widgets/costume_card.dart';

class Homemahasiswa extends StatefulWidget {
  const Homemahasiswa({super.key});

  @override
  State<Homemahasiswa> createState() => _HomemahasiswaState();
}

class _HomemahasiswaState extends State<Homemahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 780.h,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/backgorund.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Positioned.fill(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 634.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.w),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          SizedBox(height: 100.h),
                          const Infoprofile(
                              title: 'Nama Mahasiswa:', value: 'John Doe'),
                          const Infoprofile(
                              title: 'Nim:', value: '60900121070'),
                          const Infoprofile(
                            title: 'Tempat PPL:',
                            value: 'Makassar Digital Valley',
                          ),
                          const Infoprofile(
                            title: 'Dosen Pembimbing:',
                            value: 'Reza Maulana',
                          ),
                          SizedBox(height: 16.h),
                          Costumebutton(
                            title: 'Datang',
                            ontap: () => Navigator.pushNamed(
                              context,
                              'take-picture',
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Costumebutton(title: 'Kegiatan', ontap: () {}),
                          SizedBox(height: 10.h),
                          Costumebutton(title: 'Kendala', ontap: () {}),
                          SizedBox(height: 10.h),
                          Costumebutton(title: 'Pulang', ontap: () {}),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 80.h,
                left: 100.w,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(139.r / 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(139.r / 2),
                    child: Image.network(
                      "https://images.unsplash.com/flagged/photo-1559502867-c406bd78ff24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                      width: 139.r,
                      height: 139.r,
                      fit: BoxFit.cover,
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
