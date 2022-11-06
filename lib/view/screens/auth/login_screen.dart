import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/auth/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:app/view/screens/dashboard/dashboard_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.couples),
            fit: BoxFit.fill,
            opacity: 0.65,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                CustomTextField(
                  width: 90.w,
                  controller: _username,
                  hintText: 'Email/Phone Number *',
                  hintColor: AppColors.whiteColor,
                ),
                CustomTextField(
                  width: 90.w,
                  controller: _password,
                  hintText: 'Password *',
                  hintColor: AppColors.whiteColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: "Forget password",
                      width: 30.w,
                      height: 3.h,
                      textColor: AppColors.whiteColor,
                      isPadding: true,
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen())),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                CustomButton(
                  width: 90.w,
                  height: 6.h,
                  text: 'Login',
                  fontSize: 3.h,
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen())),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New to Parichay password?",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 2.h),
                ),
                CustomButton(
                  text: "Register now!",
                  width: 25.w,
                  height: 3.h,
                  textColor: AppColors.primaryColor,
                  isPadding: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
