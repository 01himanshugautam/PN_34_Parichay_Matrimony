import 'dart:convert';
import 'dart:developer';
import 'package:app/data/models/user.model.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/screens/membership_plan/membership_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivePlanScreen extends StatefulWidget {
  final String userId;
  const ActivePlanScreen({super.key, required this.userId});

  @override
  State<ActivePlanScreen> createState() => _ActivePlanScreenState();
}

class _ActivePlanScreenState extends State<ActivePlanScreen> {
  Users user = Users();
  bool isLoading = false;

  getUser() async {
    setState(() {
      isLoading = true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await Provider.of<AuthProvider>(context, listen: false)
        .profile(widget.userId);

    if (response['success'] == true) {
      String userData = jsonEncode(Users.fromJson(response['data']));
      prefs.setString('userData', userData);
      setState(() {
        user = Users.fromJson(response['data']);
        isLoading = false;
      });
      if (user.plandate == null && user.planedate == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MembershipScreen(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Membership Packages"),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Container(
                height: 65.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(.8.h * .8.w)),
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: Column(
                  children: [
                    Container(
                      height: 6.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor.withOpacity(.3),
                          border: Border.all(color: AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(2.h)),
                      alignment: Alignment.center,
                      child: Text(
                        user.plantype.toString(),
                        style: TextStyle(
                          fontSize: 2.6.h,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\u{20B9} ${user.planprice}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 4.h,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          "/${user.planmonth}MON",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 2.5.h,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.whiteColor),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Text(
                        "22 days Left",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 2.h,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 55.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            "Start On",
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 35.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            user.plandate.toString(),
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 55.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            "Ending On",
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 35.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            user.planedate.toString(),
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 55.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            "Total Contact",
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 35.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            user.plannocontact.toString(),
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 55.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            "Remaining Contact",
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 35.w,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: AppColors.whiteColor),
                              right: BorderSide(color: AppColors.whiteColor),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 2.h, horizontal: 2.w),
                          child: Text(
                            user.usercontact.toString(),
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
