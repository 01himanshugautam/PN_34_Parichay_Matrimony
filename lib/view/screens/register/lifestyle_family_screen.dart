import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:app/view/screens/dashboard/dashboard_screen.dart';
import 'package:app/view/screens/register/widgets/progress_bar_screen.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LifestyleFamilyScreen extends StatefulWidget {
  const LifestyleFamilyScreen({Key? key}) : super(key: key);

  @override
  State<LifestyleFamilyScreen> createState() => _LifestyleFamilyScreenState();
}

class _LifestyleFamilyScreenState extends State<LifestyleFamilyScreen> {
  final TextEditingController _username = TextEditingController();
  int? _minAge;

  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Lifestyle & Family"),
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
            Expanded(
              child: ListView(
                children: [
                  const ProgressBar(select: 3),
                  SizedBox(height: 1.h),
                  CustomDropDown(
                    title: "Family Type *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Father Occuption *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Mother Occuption *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Family Status *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Brother *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Sister *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Family Living In *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "State *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "City *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  Text(
                    "Contact Address *",
                    style: TextStyle(
                      fontSize: 2.h,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const CustomTextField(hintText: ""),
                  Text(
                    "About My Family *",
                    style: TextStyle(
                      fontSize: 2.h,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const CustomTextField(hintText: ""),
                  CustomDropDown(
                    title: "Dietary Habits *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Drinking Habits *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Smoking Habits *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Body Type *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Complexion *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Physical Status *",
                    items: const [1, 2],
                    value: _minAge,
                    color: AppColors.whiteColor,
                    // width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            CustomButton(
              width: 100.w,
              height: 6.h,
              text: 'Continue',
              fontSize: 3.h,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
