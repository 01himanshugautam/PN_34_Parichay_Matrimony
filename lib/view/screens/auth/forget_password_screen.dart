// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';
import 'package:app/data/models/user.model.dart';
import 'package:app/helper/common_function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController mobile = TextEditingController();
  TextEditingController pinController = TextEditingController();
  final focusNode = FocusNode();
  bool isOtpSend = false, isLoading = false;
  String? otp, userId;

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
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
            !isOtpSend
                ? CustomTextField(
                    width: 90.w,
                    controller: mobile,
                    hintText: 'Phone Number *',
                    hintColor: AppColors.whiteColor,
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    child: Pinput(
                      length: 6,
                      showCursor: true,
                      controller: pinController,
                      focusNode: focusNode,
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsUserConsentApi,
                      listenForMultipleSmsOnAndroid: true,
                      hapticFeedbackType: HapticFeedbackType.lightImpact,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle:
                            const TextStyle(fontSize: 22, color: Colors.white),
                        decoration: BoxDecoration(
                          color: AppColors.basicColor,
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: AppColors.basicColor),
                        ),
                      ),
                      onCompleted: (value) async {
                        if (value == otp) {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          if (!mounted) return;
                          var response = await Provider.of<AuthProvider>(
                                  context,
                                  listen: false)
                              .profile(userId.toString());

                          if (response['success'] == true) {
                            String userData =
                                jsonEncode(Users.fromJson(response['data']));
                            prefs.setString('userData', userData);
                            prefs.setBool('is_login', true);
                            if (!mounted) return;
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home', (r) => false);
                          }
                        } else {
                          CommonFunctions.showErrorDialog(
                              "Error", "Invalid OTP!", context);
                        }
                        log(value);
                      },
                    ),
                  ),
            CustomButton(
              width: 90.w,
              height: 6.h,
              text: isOtpSend ? 'VERIFY OTP' : 'GET OTP',
              fontSize: 3.h,
              isLoading: isLoading,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                if (isOtpSend) {
                  setState(() {
                    isLoading = false;
                  });

                  // Navigator.pushNamed(context, '/changePassword');
                } else {
                  var response =
                      await Provider.of<AuthProvider>(context, listen: false)
                          .otpSend("", mobile.text);
                  log(response.toString());
                  setState(() {
                    isLoading = false;
                  });
                  log((response['otp'] == true).toString());
                  if (response['otp'] == true) {
                    if (!mounted) return;
                    focusNode.requestFocus();
                    CommonFunctions.showSuccessToast(response['msg'], context);
                    setState(() {
                      isOtpSend = true;
                      otp = response['otpUse'].toString();
                      userId = response['user_id'].toString();
                    });
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
