import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/auth/login_screen.dart';
import 'package:app/view/screens/auth/sign_up_screen.dart';
import 'package:app/view/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 1.h),
          Container(
            height: 15.h,
            width: 70.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.logo),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
            width: 100.w,
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage(Images.background3),
            //     fit: BoxFit.fitWidth,
            //   ),
            // ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 72.h,
                  padding: EdgeInsets.only(top: 3.h),
                  child: Image.asset(
                    Images.background3,
                    fit: BoxFit.fill,
                    // height: 72.h,
                    width: 100.w,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: "REGISTER NOW",
                      width: 82.w,
                      height: 5.5.h,
                      radius: 3.h,
                      enableBoxShadow: true,
                      fontSize: 2.5.h,
                      color: AppColors.whiteColor,
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: "LOGIN",
                          width: 39.w,
                          height: 5.5.h,
                          radius: 3.h,
                          enableBoxShadow: true,
                          fontSize: 2.5.h,
                          color: AppColors.whiteColor,
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
                          height: 5.5.h,
                          radius: 3.h,
                          enableBoxShadow: true,
                          fontSize: 2.5.h,
                          color: AppColors.whiteColor,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
