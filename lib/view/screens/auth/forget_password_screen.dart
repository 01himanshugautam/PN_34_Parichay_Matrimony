import 'dart:developer';

import 'package:app/helper/common-function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Provide Email Phone"),
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
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              width: 90.w,
              controller: mobile,
              hintText: 'Phone Number *',
              hintColor: AppColors.whiteColor,
            ),
            CustomButton(
              width: 90.w,
              height: 6.h,
              text: 'GET OTP',
              fontSize: 3.h,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () async {
                var response =
                    await Provider.of<AuthProvider>(context, listen: false)
                        .otpSend("", mobile.text);
                log("Response $response");
                CommonFunctions.showFailedToast(response['msg'], context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
