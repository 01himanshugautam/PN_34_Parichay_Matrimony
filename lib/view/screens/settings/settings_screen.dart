import 'dart:convert';
import 'dart:developer';

import 'package:app/helper/common_function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  bool changePassword = false, deleteProfile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                changePassword = !changePassword;
                // deleteProfile = false;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 2.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    changePassword
                        ? Icons.arrow_drop_down
                        : Icons.arrow_drop_up,
                    size: 4.h,
                  )
                ],
              ),
            ),
          ),
          changePassword
              ? Column(
                  children: [
                    CustomTextField(
                      hintText: "Enter New Password",
                      hintColor: AppColors.blackColor,
                      width: 100.w,
                      height: 6.h,
                      borderColor: AppColors.blackColor.withOpacity(.2),
                      isPadding: false,
                      controller: password1,
                    ),
                    CustomTextField(
                      hintText: "Re-Enter New Password",
                      width: 100.w,
                      height: 6.h,
                      hintColor: AppColors.blackColor,
                      borderColor: AppColors.blackColor.withOpacity(.2),
                      isPadding: false,
                      controller: password2,
                    ),
                    CustomButton(
                      text: "Save Changes",
                      width: 100.w,
                      height: 6.h,
                      color: AppColors.primaryColor3,
                      textColor: AppColors.whiteColor,
                      isPadding: false,
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        Map json = jsonDecode(prefs.getString('userData')!);
                        if (password1.text.isNotEmpty &&
                            password2.text.isNotEmpty) {
                          if (password1.text == password2.text) {
                            var response = await Provider.of<AuthProvider>(
                                    context,
                                    listen: false)
                                .changePassword(
                                    json['id'].toString(), password1.text);
                            log(response);
                            Navigator.pop(context);
                            CommonFunctions.showSuccessToast(
                                "Update Password Successfully", context);
                          } else {
                            CommonFunctions.showErrorDialog(
                                "Error", "Password not Match", context);
                          }
                        }
                      },
                    ),
                  ],
                )
              : Container(),
          GestureDetector(
            onTap: () {
              setState(() {
                // changePassword = false;
                deleteProfile = !deleteProfile;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.w),
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delete Profile",
                    style: TextStyle(
                      fontSize: 2.h,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    deleteProfile ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    size: 4.h,
                  )
                ],
              ),
            ),
          ),
          deleteProfile
              ? Column(
                  children: [
                    CustomButton(
                      text: "Delete",
                      width: 100.w,
                      height: 6.h,
                      color: AppColors.primaryColor3,
                      textColor: AppColors.whiteColor,
                      isPadding: false,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
