import 'dart:developer';

import 'package:app/helper/common_function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:app/view/screens/register/lifestyle_family_screen.dart';
import 'package:app/view/screens/register/widgets/progress_bar_screen.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:app/view/screens/search/widgets/droop_api.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EducationProfessionScreen extends StatefulWidget {
  String userId;
  EducationProfessionScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  State<EducationProfessionScreen> createState() =>
      _EducationProfessionScreenState();
}

class _EducationProfessionScreenState extends State<EducationProfessionScreen> {
  final TextEditingController college = TextEditingController();
  final TextEditingController about = TextEditingController();
  bool isLoading = false;
  String? education;
  String? job;
  String? occupation;
  String? income;

  List educations = [
    {"id": 1, "name": ""},
  ];
  List occupations = [
    {"id": "1", "name": ""}
  ];

  List incomes = [
    {"id": "1", "name": ""},
  ];
  List religions = [
    {"id": "12", "name": "", "status": "1"},
  ];
  List languages = [
    {"id": "1", "name": ""},
  ];

  getEducation() async {
    var educations =
        await Provider.of<SearchProvider>(context, listen: false).education();
    log("educations $educations");
    setState(() {
      this.educations = educations['data'];
    });
  }

  getOccupation() async {
    var occupations =
        await Provider.of<SearchProvider>(context, listen: false).occupations();
    log("occupations $occupations");
    setState(() {
      this.occupations = occupations['data'];
    });
  }

  getIncome() async {
    var incomes =
        await Provider.of<SearchProvider>(context, listen: false).income();
    log("incomes $incomes");
    setState(() {
      this.incomes = incomes['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEducation();
    getOccupation();
    getIncome();
  }

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
                  CustomDropDownApi(
                    title: "Highest Education *",
                    items: educations,
                    value: education,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        education = value;
                      });
                    },
                  ),
                  // CustomDropDown(
                  //   title: "College / School *",
                  //   items: const [1, 2],
                  //   value: _minAge,
                  //   color: AppColors.whiteColor,
                  //
                  //   onChanged: (value) {
                  //     debugPrint("Value $value");
                  //     setState(() {
                  //       _minAge = value;
                  //     });
                  //   },
                  // ),
                  CustomTextField(
                    controller: college,
                    hintText: "College / School *",
                    hintColor: AppColors.whiteColor,
                    borderColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 1.h),
                  CustomDropDown(
                    title: "Employed In *",
                    items: const [
                      "Government",
                      "Private",
                      "Business",
                      "Defence",
                      "Self Employed",
                      "Not Working",
                    ],
                    value: job,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        job = value;
                      });
                    },
                  ),
                  CustomDropDownApi(
                    title: "Occupation *",
                    items: occupations,
                    value: occupation,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        occupation = value;
                      });
                    },
                  ),
                  CustomDropDownApi(
                    title: "Annual Income *",
                    items: incomes,
                    value: income,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        income = value;
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
                  CustomTextField(
                    hintText: "",
                    controller: about,
                  ),
                ],
              ),
            ),
            CustomButton(
                width: 100.w,
                height: 6.h,
                text: 'Continue',
                fontSize: 3.h,
                isLoading: isLoading,
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  var data = {
                    'user_id': widget.userId,
                    'education': education,
                    'educationdetail': college.text,
                    'occupation': occupation,
                    'employee_in': job,
                    'income': income,
                    'myself': about.text,
                  };
                  log("$data");
                  var response =
                      await Provider.of<AuthProvider>(context, listen: false)
                          .lifeStyle(data);
                  setState(() {
                    isLoading = false;
                  });

                  if (response['success']['msg'] == 'true') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LifestyleFamilyScreen(
                          userId: widget.userId,
                          otp: "${response['success']['otp']}",
                        ),
                      ),
                    );
                    CommonFunctions.showSuccessToast(
                        "Profile Successfully Updated.", context);
                  } else {
                    CommonFunctions.showErrorDialog("Error", "Failed", context);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
