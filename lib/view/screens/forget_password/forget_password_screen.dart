import 'package:app/helper/common_function.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isLoading = false;
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Change Password"),
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
        padding: EdgeInsets.only(bottom: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextField(
                  hintText: "Enter New Password",
                  width: 90.w,
                  controller: newPassword,
                  hintColor: AppColors.whiteColor,
                ),
                CustomTextField(
                  hintText: "Enter New Password",
                  width: 90.w,
                  controller: confirmPassword,
                  hintColor: AppColors.whiteColor,
                ),
              ],
            ),
            CustomButton(
              text: "Submit",
              width: 90.w,
              height: 6.h,
              fontSize: 3.h,
              isLoading: isLoading,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                if (newPassword.text.isNotEmpty &&
                    confirmPassword.text.isNotEmpty) {
                  if (newPassword.text == confirmPassword.text) {
                    setState(() {
                      isLoading = true;
                    });
                    Navigator.pushNamed(context, '/login');
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    CommonFunctions.showErrorDialog(
                        "Error", "Password Not Matched!", context);
                  }
                } else {
                  CommonFunctions.showErrorDialog(
                      "Error", "Enter New Password", context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
