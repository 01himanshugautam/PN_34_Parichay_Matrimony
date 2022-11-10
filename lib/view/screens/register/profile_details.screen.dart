import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/register/eduction_profession_screen.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final TextEditingController _username = TextEditingController();
  int? _minAge;

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
            Expanded(
              child: ListView(
                children: [
                  CustomDropDown(
                    title: "Mother Toungue *",
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
                    title: "Religion *",
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
                    title: "Caste *",
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
                    title: "Sub Caste/ Surname *",
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
                    title: "Marital Status *",
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
                    title: "Height *",
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
                    title: "Country *",
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
                    builder: (context) => const EducationProfessionScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
