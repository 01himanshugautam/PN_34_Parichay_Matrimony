import 'package:app/utils/constants/colors.constant.dart';
import 'package:app/utils/constants/images.constant.dart';
import 'package:app/view/basewidget/custom-button.widget.dart';
import 'package:app/view/screens/auth/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8.h),
            CircleAvatar(
              radius: 15.h,
              backgroundColor: AppColors.whiteColor,
            ),
            SizedBox(height: 19.h),
            Column(
              children: [
                CustomButton(
                  text: "REGISTER NOW",
                  width: 82.w,
                  height: 6.h,
                  fontSize: 3.h,
                ),
                SizedBox(height: 1.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "LOGIN",
                      width: 39.w,
                      height: 6.h,
                      fontSize: 3.h,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      ),
                    ),
                    CustomButton(
                      text: "SEARCH",
                      width: 39.w,
                      height: 6.h,
                      fontSize: 3.h,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
