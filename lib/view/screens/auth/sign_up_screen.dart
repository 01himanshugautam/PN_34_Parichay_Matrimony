// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:app/helper/common_function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();
  String? _gender;
  String? profileFor;
  bool isLoading = false;

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
            Form(
              child: Expanded(
                child: ListView(
                  children: [
                    CustomTextField(
                      width: 100.w,
                      controller: name,
                      hintText: 'Name*',
                      hintColor: AppColors.whiteColor,
                      isPadding: false,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextField(
                      width: 100.w,
                      controller: email,
                      hintText: 'Email*',
                      hintColor: AppColors.whiteColor,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextField(
                      width: 100.w,
                      controller: password,
                      hintText: 'Password*',
                      hintColor: AppColors.whiteColor,
                    ),
                    SizedBox(height: 2.h),
                    CustomDropDown(
                      title: "Profile For*",
                      items: const [
                        "Self",
                        "Son",
                        "Daughter",
                        "Brother",
                        "Sister",
                        "Relative",
                        "Friends"
                      ],
                      value: profileFor,
                      color: AppColors.whiteColor,
                      onChanged: (value) {
                        setState(() {
                          profileFor = value;
                        });
                      },
                    ),
                    CustomTextField(
                      width: 100.w,
                      controller: phone,
                      hintText: 'Phone Number*',
                      hintColor: AppColors.whiteColor,
                    ),
                    SizedBox(height: 1.h),
                    CustomTextField(
                      width: 100.w,
                      controller: date,
                      hintText: 'Date of Birth*',
                      hintColor: AppColors.whiteColor,
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1970),
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            date.text = date.text = formattedDate;
                          });
                        }
                      },
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
                  ],
                ),
              ),
            ),
            CustomButton(
              width: 100.w,
              height: 6.h,
              text: 'Continue',
              fontSize: 3.h,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () async {
                if (name.text.isNotEmpty &&
                    email.text.isNotEmpty &&
                    password.text.isNotEmpty &&
                    phone.text.isNotEmpty &&
                    date.text.isNotEmpty &&
                    _gender != null &&
                    profileFor != null) {
                  setState(() {
                    isLoading = true;
                  });
                  var dateArray = date.text.split('-');
                  Map<String, dynamic> data = {
                    "fullname": name.text,
                    "email": email.text,
                    "password": password.text,
                    "profile_for": profileFor,
                    "phone": phone.text,
                    "gender": _gender,
                    "birth_date": dateArray[0],
                    "birth_month": dateArray[1],
                    "birth_year": dateArray[2]
                  };
                  var response =
                      await Provider.of<AuthProvider>(context, listen: false)
                          .register(data);
                  log(response.toString());
                  log("${response['data']['userid']}");
                  if (response['success'] == true) {
                    setState(() {
                      isLoading = false;
                    });

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ProfileDetailScreen(
                    //       userId: "${response['data']['userid']}",
                    //     ),
                    //   ),
                    // );
                    CommonFunctions.showSuccessToast(
                        "Profile Successfully Created.", context);
                  } else {
                    setState(() {
                      isLoading = false;
                    });
                    CommonFunctions.showErrorDialog(
                        "Error", response['message'], context);
                  }
                } else {
                  CommonFunctions.showSuccessToast(
                      "All fields are mandatory!", context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
