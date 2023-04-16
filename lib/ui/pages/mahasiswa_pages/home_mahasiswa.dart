import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homemahasiswa extends StatelessWidget {
  const Homemahasiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/backgorund.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 550.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.w),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80.h,
            left: 100.w,
            child: Column(
              children: [
                Container(
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
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
