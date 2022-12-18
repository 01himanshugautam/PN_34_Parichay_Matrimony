import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetNowScreen extends StatefulWidget {
  const GetNowScreen({
    super.key,
  });

  @override
  State<GetNowScreen> createState() => _GetNowScreenState();
}

class _GetNowScreenState extends State<GetNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Upgrade Plan"),
        elevation: 0,
      ),
      body: Column(
        children: [
          Image.asset(
            Images.bandDetails,
            height: 30.h,
            width: 100.w,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 3.h),
          Image.asset(Images.upiQr),
        ],
      ),
    );
  }
}
