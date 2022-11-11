import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:app/view/screens/register/lifestyle_family_screen.dart';
import 'package:app/view/screens/register/widgets/progress_bar_screen.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EducationProfessionScreen extends StatefulWidget {
  const EducationProfessionScreen({Key? key}) : super(key: key);

  @override
  State<EducationProfessionScreen> createState() =>
      _EducationProfessionScreenState();
}

class _EducationProfessionScreenState extends State<EducationProfessionScreen> {
  final TextEditingController _username = TextEditingController();
  int? _minAge;

  String? _gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Education & Profession"),
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
                  const ProgressBar(select: 2),
                  SizedBox(height: 1.h),
                  CustomDropDown(
                    title: "Highest Education *",
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
                    title: "College / School *",
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
                    title: "Employed In *",
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
                    title: "Occuption *",
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
                    title: "Annual Income *",
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
                    "Express Yourself *",
                    style: TextStyle(
                      fontSize: 2.h,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const CustomTextField(hintText: ""),
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
                      builder: (context) => const LifestyleFamilyScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
