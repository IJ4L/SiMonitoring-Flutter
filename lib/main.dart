import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simor/cubit/index_cubit.dart';
import 'package:simor/ui/pages/dosen_pages/home_dosen_page.dart';
import 'package:simor/ui/pages/dosen_pages/lokasi_ppl_page.dart';
import 'package:simor/ui/pages/login_page.dart';
import 'package:simor/ui/pages/mahasiswa_pages/home_mahasiswa.dart';
import 'package:simor/ui/pages/mahasiswa_pages/kegiatan_page.dart';
import 'package:simor/ui/pages/mahasiswa_pages/take_picture_page.dart';
import 'package:simor/ui/pages/pembimbing_pages/choice_scan.dart';
import 'package:simor/ui/pages/pembimbing_pages/home_pembimbing.dart';
import 'package:simor/ui/pages/scan_card_page.dart';
import 'package:simor/ui/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => IndexCubit()),
        ],
        child: MaterialApp(
          title: 'SiMonitoring',
          theme: ThemeData(fontFamily: 'Montserrat'),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => const Splashscreen(),
            '/login': (context) => const Loginpage(),
            '/scan-card': (context) => const Scancard(),
            '/home-mahasiswa': (context) => const Homemahasiswa(),
            '/take-picture': (context) => const CameraPage(),
            '/kegiatan-mahasiswa': (context) => const Kegiatanmahasiswa(),
            '/home-pembimbing': (context) => const Homepembimbing(),
            '/choice-scan': (context) => const ChoiceScan(),
            '/home-dosen': (context) => const HomeDosenPage(),
            '/lokasi-ppl': (context) => const LokasiPplPage(),
          },
        ),
      ),
    );
  }
}
