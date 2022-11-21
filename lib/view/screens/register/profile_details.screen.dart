import 'dart:developer';
import 'dart:io';

import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/register/eduction_profession_screen.dart';
import 'package:app/view/screens/register/widgets/progress_bar_screen.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:app/view/screens/search/widgets/droop_api.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  final TextEditingController _username = TextEditingController();
  int? _minAge;
  String? minAge,
      maxAge,
      minHeight,
      maxHeight,
      marital,
      religion,
      caste,
      motherToungue,
      country,
      state,
      city;
  bool isMale = true;

  List countries = [
    {"id": "101", "name": "India"},
  ];
  List states = [
    {"id": "1", "name": "Andaman and Nicobar Islands"}
  ];
  List cities = [
    {"id": "1", "name": "Sed ea dolore offici"}
  ];
  List castes = [
    {"id": "251", "name": "Kudumbi", "status": "1"},
  ];
  List heights = [
    {"id": "1", "name": "4 feet", "value": "40", "name": "4 feet"},
  ];
  List religions = [
    {"id": "12", "name": "Hindu", "status": "1"},
  ];
  List languages = [
    {"id": "1", "name": "Hindi"},
  ];

  @override
  void initState() {
    super.initState();
    getCountry();
    getCaste();
    getReligion();
    getLanguage();
    getHeight();
  }

  getCaste() async {
    var castes =
        await Provider.of<SearchProvider>(context, listen: false).caste();
    log("castes $castes");
    setState(() {
      this.castes = castes['data'];
    });
  }

  getReligion() async {
    var religions =
        await Provider.of<SearchProvider>(context, listen: false).caste();
    setState(() {
      this.religions = religions['data'];
    });
    log("religions ${this.religions}");
  }

  getHeight() async {
    var heights =
        await Provider.of<SearchProvider>(context, listen: false).height();
    setState(() {
      this.heights = heights['data'];
    });
    log("heights ${this.heights}");
  }

  getLanguage() async {
    var languages =
        await Provider.of<SearchProvider>(context, listen: false).languages();
    setState(() {
      this.languages = languages['data'];
    });
    log("languages ${this.languages}");
  }

  getCountry() async {
    var countries =
        await Provider.of<SearchProvider>(context, listen: false).country();

    setState(() {
      this.countries = countries['data'];
    });
    // log("countries ${this.countries}");
  }

  getState(String id) async {
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

  String? _gender;
  String? _image;

  _imgFromCamera() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image!.path;
    });
    debugPrint(_image);
  }

  _imgFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image!.path;
    });
    debugPrint(_image);
  }

  _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            color: Colors.white,
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    debugPrint(_image);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Gallery'),
                  onTap: () {
                    _imgFromGallery();
                    debugPrint(_image);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                  const ProgressBar(select: 1),
                  SizedBox(height: 1.h),
                  GestureDetector(
                    onTap: () => _showPicker(context),
                    child: Column(
                      children: [
                        Container(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: _image == null
                                ? Image.asset(
                                    Images.user,
                                    height: 12.h,
                                    width: 23.w,
                                    fit: BoxFit.cover,
                                    color: AppColors.whiteColor,
                                  )
                                : Image.file(
                                    File("$_image"),
                                    height: 12.h,
                                    width: 23.w,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "Profile Image",
                          style: TextStyle(
                            fontSize: 2.h,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  CustomDropDownApi(
                    title: "Mother Toungue",
                    items: languages,
                    value: motherToungue,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        motherToungue = value;
                      });
                    },
                  ),
                  CustomDropDownApi(
                    title: "Religion",
                    items: religions,
                    value: religion,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        religion = value;
                      });
                    },
                  ),
                  CustomDropDownApi(
                    title: "Sub Caste/ Surname *",
                    items: castes,
                    value: caste,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        caste = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Marital Status",
                    items: const [
                      "Never Married",
                      "Awaiting Divorce",
                      "Divorced",
                      "Widowed",
                      "Annulled"
                    ],
                    value: marital,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        marital = '$value';
                      });
                    },
                  ),
                  CustomDropDownApi(
                    title: "Min. Height",
                    items: heights,
                    value: minHeight,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        minHeight = value;
                      });
                    },
                  ),
                  CustomDropDownApi(
                    title: "Country ",
                    id: true,
                    items: countries,
                    value: country,
                    color: AppColors.whiteColor,
                    onChanged: (value) {
                      debugPrint("Country $value");

                      setState(() {
                        state = null;
                        country = value;
                      });
                      getState(value);
                    },
                  ),
                  CustomDropDownApi(
                    title: "State",
                    items: states,
                    value: state,
                    color: AppColors.whiteColor,
                    id: true,
                    onChanged: (value) {
                      debugPrint("State $value");
                      setState(() {
                        state = value;
                        city = null;
                      });
                      getCity(value);
                    },
                  ),
                  CustomDropDownApi(
                    title: "City",
                    items: cities,
                    value: city,
                    color: AppColors.whiteColor,
                    id: true,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        city = value;
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
