import 'package:app/view/screens/dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        actions: [
          Center(
            child: SizedBox(
              height: 5.5.h,
              width: 50.w,
              child: TextField(
                style: TextStyle(color: AppColors.whiteColor),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.whiteColor.withOpacity(.3),
                    contentPadding: EdgeInsets.only(top: 1.h, left: 2.w),
                    hintText: "Find your partner",
                    hintStyle: TextStyle(color: AppColors.whiteColor),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.whiteColor,
                    )),
              ),
            ),
          ),
          SizedBox(width: 5.w),
        ],
      ),
      drawer: const HomeDrawer(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [],
          ),
        ],
      ),
    );
  }
}
