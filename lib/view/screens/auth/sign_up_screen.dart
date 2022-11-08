import 'package:app/utils/constants/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:app/view/screens/dashboard/dashboard_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _username = TextEditingController();

  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Personal Details"),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.background2),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextField(
                  width: 100.w,
                  controller: _username,
                  hintText: 'Email*',
                  hintColor: AppColors.whiteColor,
                ),
                CustomTextField(
                  width: 100.w,
                  controller: _username,
                  hintText: 'Password*',
                  hintColor: AppColors.whiteColor,
                ),
                CustomTextField(
                  width: 100.w,
                  controller: _username,
                  hintText: 'Profile For*',
                  hintColor: AppColors.whiteColor,
                ),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gender *",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 2.h,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Row(
                      children: [
                        Radio(
                          activeColor: AppColors.primaryColor,
                          value: "Female",
                          groupValue: _gender,
                          onChanged: (value) {
                            debugPrint("Value $value");
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 2.h,
                            color: _gender == "Female"
                                ? AppColors.primaryColor
                                : AppColors.whiteColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 3.w),
                    Row(
                      children: [
                        Radio(
                          activeColor: AppColors.primaryColor,
                          value: "Male",
                          groupValue: _gender,
                          onChanged: (value) {
                            debugPrint("Value $value");
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 2.h,
                            color: _gender == "Male"
                                ? AppColors.primaryColor
                                : AppColors.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                CustomTextField(
                  width: 100.w,
                  controller: _username,
                  hintText: 'Name*',
                  hintColor: AppColors.whiteColor,
                  isPadding: false,
                ),
                SizedBox(height: 1.h),
                CustomTextField(
                  width: 100.w,
                  controller: _username,
                  hintText: 'Phone Number*',
                  hintColor: AppColors.whiteColor,
                ),
              ],
            ),
            CustomButton(
              width: 100.w,
              height: 6.h,
              text: 'Sign up',
              fontSize: 3.h,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
