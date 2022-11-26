import 'dart:convert';
import 'dart:developer';

import 'package:app/data/models/user.model.dart';
import 'package:app/helper/common-function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:app/view/screens/register/widgets/progress_bar_screen.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:app/view/screens/search/widgets/droop_api.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LifestyleFamilyScreen extends StatefulWidget {
  String userId;
  String otp;
  LifestyleFamilyScreen({
    Key? key,
    required this.userId,
    required this.otp,
  }) : super(key: key);

  @override
  State<LifestyleFamilyScreen> createState() => _LifestyleFamilyScreenState();
}

class _LifestyleFamilyScreenState extends State<LifestyleFamilyScreen> {
  final TextEditingController about = TextEditingController();
  final TextEditingController address = TextEditingController();
  String? diet,
      drink,
      smoke,
      body,
      complexion,
      physical,
      fType,
      fOccupation,
      mOccupation,
      fStatus,
      brother,
      sister,
      fLiving,
      state,
      city;
  List countries = [
    {"id": "101", "name": ""},
  ];
  List states = [
    {"id": "1", "name": ""}
  ];
  List cities = [
    {"id": "1", "name": ""}
  ];

  getCountry() async {
    var countries =
        await Provider.of<SearchProvider>(context, listen: false).country();

    setState(() {
      this.countries = countries['data'];
    });
    // log("countries ${this.countries}");
  }

  getState(String id) async {
    log("Id $id");
    var states =
        await Provider.of<SearchProvider>(context, listen: false).state(id);
    log("States $states");
    setState(() {
      this.states = states['data'];
    });
  }

  getCity(String id) async {
    var cities =
        await Provider.of<SearchProvider>(context, listen: false).city(id);
    log("Cities $cities");
    setState(() {
      this.cities = cities['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountry();
  }

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
                    items: const ["Joint", "Nuclear", "Other"],
                    value: fType,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        fType = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Father Occupation *",
                    items: const [
                      "Employed",
                      "Business Man",
                      "Not Employed",
                      "Retired",
                      "Passed Away",
                    ],
                    value: fOccupation,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        fOccupation = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Mother Occupation *",
                    items: const [
                      "Home Worker",
                      "Employed",
                      "Business Man",
                      "Not Employed",
                      "Retired",
                      "Passed Away",
                    ],
                    value: mOccupation,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        mOccupation = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Family Status *",
                    items: const [
                      "Upper Middle",
                      "Rich Affluent",
                      "Middle Class"
                    ],
                    value: fStatus,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        fStatus = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Brother *",
                    items: const ["1", "2", "3", "3+"],
                    value: brother,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        brother = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Sister *",
                    items: const ["1", "2", "3", "3+"],
                    value: sister,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        sister = value;
                      });
                    },
                  ),
                  CustomDropDownApi(
                    title: "Family Living In *",
                    items: countries,
                    value: fLiving,
                    id: true,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        state = null;
                        fLiving = value;
                      });
                      getState(value);
                    },
                  ),
                  CustomDropDownApi(
                    title: "State *",
                    items: states,
                    value: state,
                    id: true,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        city = null;
                        state = value;
                      });
                      getCity(value);
                    },
                  ),
                  CustomDropDownApi(
                    title: "City *",
                    items: cities,
                    value: city,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        city = value;
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
                    items: const [
                      "Vegetarian",
                      "Non Veg",
                      "jain",
                      "Eggetarian"
                    ],
                    value: diet,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        diet = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Drinking Habits *",
                    items: const ['Yes', 'No', 'Occasionally'],
                    value: drink,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        drink = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Smoking Habits *",
                    items: const ['Yes', 'No', 'Occasionally'],
                    value: smoke,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        smoke = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Body Type *",
                    items: const ["Slim", "Average", "Athletic", "Heavy"],
                    value: body,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        body = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Complexion *",
                    items: const [
                      "Fair",
                      'Not Fair',
                      "Wheatish",
                      "Wheatish Brown",
                      "Dark"
                    ],
                    value: complexion,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        complexion = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Physical Status *",
                    items: const [
                      "Normal",
                      "HIV Positive",
                      "Physically Challenged"
                    ],
                    value: physical,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        physical = value;
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
              onPressed: () async {
                Map<String, dynamic> data = {
                  'user_id': widget.userId,
                  'familytype': fType,
                  'fatheroccupation': fOccupation,
                  'motheroccupation': mOccupation,
                  'familystatus': fStatus,
                  'familyvalues': "",
                  'famincome': "",
                  'noofbrother': "$brother",
                  'married1': "",
                  'noofsisters': "$sister",
                  'married': "",
                  'famcountry': fLiving,
                  'famstate': state,
                  'famcity': city,
                  'contactaddress': address.text,
                  'myfamily': fType,
                  'diet': drink,
                  'drinkh': drink,
                  'smokha': smoke,
                  'btype': body,
                  'complexion': complexion,
                  'physicalstatus': physical,
                  'physical_type': "",
                  'otp': widget.otp
                };
                var response =
                    await Provider.of<AuthProvider>(context, listen: false)
                        .lifeStyle(data);
                log("Response $response");
                if (response['success']['msg'] == 'true') {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  var userResponse =
                      await Provider.of<AuthProvider>(context, listen: false)
                          .profile(widget.userId);
                  String user =
                      jsonEncode(Users.fromJson(userResponse['data']));
                  prefs.setString('userData', user);
                  prefs.setBool('is_login', true);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (r) => false);
                  CommonFunctions.showSuccessToast(
                      "Profile Successfully Updated.", context);
                } else {
                  CommonFunctions.showErrorDialog(
                      "Error", response['message'], context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
