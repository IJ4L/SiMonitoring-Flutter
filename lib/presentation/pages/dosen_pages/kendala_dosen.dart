import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simor/cubit/get_kendala_dosen/get_kendala_dosen_cubit.dart';
import 'package:simor/cubit/get_komen_cubit/getkomen_cubit.dart';
import 'package:simor/cubit/mahasiswa_cubit/mahasiswa_cubit.dart';
import 'package:simor/cubit/post_komen_dosen/post_komen_dosen_cubit.dart';
import 'package:simor/cubit/texfield_cubit.dart';
import 'package:simor/presentation/widgets/costume_button.dart';
import 'package:simor/shared/themes.dart';

class KendalaDosen extends StatefulWidget {
  const KendalaDosen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KendalaMahasiswaState createState() => _KendalaMahasiswaState();
}

class _KendalaMahasiswaState extends State<KendalaDosen> {
  late TextEditingController kendalaController;
  final TextEditingController feedbackController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetkomenCubit>().getKomen();
    kendalaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final GetKendalaDosenCubit kendalaCubit =
        context.read<GetKendalaDosenCubit>();
    final textFieldCubit = context.read<TextfieldCubit>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 255, 255, 255),
      appBar: buildAppBar(),
      body: buildBody(kendalaCubit, textFieldCubit),
      resizeToAvoidBottomInset: false,
    );
  }

  PreferredSizeWidget buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(130.h),
      child: Container(
        height: 130.h,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/backgorund.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.w)),
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 40.h,
                width: 180.w,
                fit: BoxFit.cover,
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(
      GetKendalaDosenCubit kendalaCubit, TextfieldCubit textFieldCubit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildKendalaRow(kendalaCubit),
          buildKendalaTextField(kendalaCubit, textFieldCubit),
          buildListKomen(),
        ],
      ),
    );
  }

  Widget buildListKomen() {
    return Expanded(
      child: BlocBuilder<GetkomenCubit, GetkomenState>(
        builder: (context, state) {
          if (state is GetkomenLoaded) {
            final data = state.komen;
            return ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return buildListKomenItem(data[index].deskripsi);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget buildListKomenItem(String komen) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        komen,
        style: blackTextStyle.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: kTextInfoColor,
        ),
        textScaleFactor: 1,
      ),
    );
  }

  Widget buildKendalaRow(GetKendalaDosenCubit kendalaCubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Kendala:',
          style: blackTextStyle.copyWith(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: kTextInfoColor,
          ),
          textScaleFactor: 1,
        ),
        BlocBuilder<MahasiswaCubit, MahasiswaState>(
          builder: (context, state) {
            if (state is MahasiswaGetKendala) {
              final data = state.kendala;
              final isAccepted = data.status != 0;
              return buildStatusContainer(isAccepted);
            }
            return Container();
          },
        ),
      ],
    );
  }

  Widget buildStatusContainer(bool isAccepted) {
    return Container(
      height: 24.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: isAccepted ? kGreenColor : kSecondColor,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/icons/clock.svg",
            height: 10.r,
            width: 10.r,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 8.w),
          Text(
            isAccepted ? 'Diterima' : 'Belum diterima',
            style: whiteTextStyle.copyWith(fontSize: 10.sp),
            textScaleFactor: 1,
          ),
        ],
      ),
    );
  }

  Widget buildKendalaTextField(
      GetKendalaDosenCubit kendalaCubit, TextfieldCubit textFieldCubit) {
    return BlocConsumer<GetKendalaDosenCubit, GetKendalaDosenState>(
      listener: (context, state) {
        if (state is GetKendalaDosenLoaded) {
          kendalaController.text = state.kendala;
        }
      },
      builder: (context, state) {
        return buildKendalaContainer();
      },
    );
  }

  Widget buildKendalaContainer() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 210,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              TextFormField(
                controller: kendalaController,
                maxLines: 7,
                cursorColor: kBlackColor,
                readOnly: true,
                style: TextStyle(color: kGreyColor.withOpacity(0.6)),
                decoration: buildInputDecoration(),
              ),
              buildFeedbackContainer(),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: kTransparantColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: kTransparantColor),
      ),
    );
  }

  Widget buildFeedbackContainer() {
    return GestureDetector(
      onTap: () {
        buildFeedbackBottomSheet();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          "Berikan feedback kepada mahasiswa ...",
        ),
      ),
    );
  }

  void buildFeedbackBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return buildBottomSheetContainer();
      },
    );
  }

  Widget buildBottomSheetContainer() {
    final String kendalaId =
        ModalRoute.of(context)!.settings.arguments as String;

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: 270.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: feedbackController,
                  cursorColor: kBlackColor,
                  style: const TextStyle(color: kBlackColor),
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  decoration: buildFeedbackInputDecoration(),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: Costumebutton(
                    title: "Kirim",
                    ontap: () {
                      Navigator.pop(context);
                      context
                          .read<PostKomenDosenCubit>()
                          .postKomen(feedbackController.text, kendalaId);
                      context.read<GetkomenCubit>().getKomen();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildFeedbackInputDecoration() {
    return InputDecoration(
      hintText: 'Deskripsikan Rencana Kegiatanmu Hari Ini',
      hintStyle: TextStyle(
        color: kGreyColor.withOpacity(0.4),
        fontStyle: FontStyle.italic,
        fontSize: 12.sp,
      ),
      fillColor: kGreyColor.withOpacity(0.2),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kTransparantColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: kTransparantColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
    );
  }

  Widget buildDefaultKendalaTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: TextFormField(
            controller: kendalaController,
            cursorColor: kBlackColor,
            style: const TextStyle(color: kBlackColor),
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            decoration: buildInputDecorationWithBorders(kTextInfoColor),
          ),
        ),
        buildTextFieldErrorMessage(),
      ],
    );
  }

  InputDecoration buildInputDecorationWithBorders(Color borderColor) {
    return InputDecoration(
      hintText: 'Deskripsikan Rencana Kegiatanmu Hari Ini',
      hintStyle: TextStyle(
        color: kGreyColor.withOpacity(0.4),
        fontStyle: FontStyle.italic,
        fontSize: 12.sp,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(
          color: borderColor,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: kRedColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(color: kRedColor),
      ),
    );
  }

  Widget buildTextFieldErrorMessage() {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, bottom: 10.h, left: 10.w),
      child: BlocBuilder<TextfieldCubit, bool>(
        builder: (context, state) {
          return Text(
            state ? '' : 'Masukkan Kendala',
            style: whiteTextStyle.copyWith(color: kRedColor),
          );
        },
      ),
    );
  }
}
