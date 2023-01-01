// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'package:app/data/models/user.model.dart';
import 'package:app/helper/common_function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/search_provider.dart';
import 'package:app/provider/user_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/dashboard/drawer.dart';
import 'package:app/view/screens/dashboard/widgets/column_text.dart';
import 'package:app/view/screens/dashboard/widgets/custom_card.dart';
import 'package:app/view/screens/search/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectIndex = 0;
  bool isAboutMeTab = true;
  Users user = Users();

  TextEditingController name = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController employeeIn = TextEditingController();
  TextEditingController marital = TextEditingController();
  TextEditingController complexion = TextEditingController();
  TextEditingController physical = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController diet = TextEditingController();
  TextEditingController smoke = TextEditingController();
  TextEditingController drink = TextEditingController();
  TextEditingController body = TextEditingController();

  TextEditingController familyType = TextEditingController();
  TextEditingController fOccupation = TextEditingController();
  TextEditingController fAge = TextEditingController();
  TextEditingController mOccupation = TextEditingController();
  TextEditingController nBrother = TextEditingController();
  TextEditingController mBrother = TextEditingController();
  TextEditingController fValue = TextEditingController();
  TextEditingController fIncome = TextEditingController();
  TextEditingController fHabit = TextEditingController();
  TextEditingController fStatus = TextEditingController();
  TextEditingController nSister = TextEditingController();
  TextEditingController mSister = TextEditingController();

  TextEditingController religion = TextEditingController();
  TextEditingController motherToungue = TextEditingController();
  TextEditingController caste = TextEditingController();
  TextEditingController subCaste = TextEditingController();

  TextEditingController education = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController employedIn = TextEditingController();
  TextEditingController annualIncome = TextEditingController();

  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController postalCode = TextEditingController();

  TextEditingController horoscope = TextEditingController();
  TextEditingController pob = TextEditingController();
  TextEditingController tob = TextEditingController();
  TextEditingController nakshtra = TextEditingController();
  TextEditingController rishi = TextEditingController();
  TextEditingController manglik = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  List userImages = [];
  String active = '';

  List countries = [
    {"id": "101", "name": ""},
  ];
  List states = [
    {"id": "1", "name": ""}
  ];
  List cities = [
    {"id": "1", "name": ""}
  ];
  List castes = [
    {"id": "251", "name": "", "status": "1"},
  ];
  List heights = [
    {"id": "1", "name": "", "value": "40"},
  ];
  List religions = [
    {"id": "12", "name": "", "status": "1"},
  ];
  List languages = [
    {"id": "1", "name": ""},
  ];

  List educations = [
    {"id": 1, "name": ""},
  ];
  List occupations = [
    {"id": "1", "name": ""}
  ];

  List incomes = [
    {"id": "1", "name": ""},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    profile();
    getUserImages();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  profile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString('userData')!);

    setState(() {
      user = Users.fromJson(json);
    });
    var response = await Provider.of<AuthProvider>(context, listen: false)
        .profile("${user.id}");

    if (response['success'] == true) {
      String userData = jsonEncode(Users.fromJson(response['data']));

      prefs.setString('userData', userData);
      setState(() {
        user = Users.fromJson(response['data']);
      });
    }
    return user;
  }

  getHeight() async {
    var heights =
        await Provider.of<SearchProvider>(context, listen: false).height();

    setState(() {
      this.heights = heights;
    });
  }

  getCountry() async {
    var countries =
        await Provider.of<SearchProvider>(context, listen: false).country();

    setState(() {
      this.countries = countries['data'];
    });
    log("countries ${this.countries}");
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
        await Provider.of<SearchProvider>(context, listen: false).religion();
    setState(() {
      this.religions = religions['data'];
    });
    // log("religions ${this.religions}");
  }

  getLanguage() async {
    var languages =
        await Provider.of<SearchProvider>(context, listen: false).languages();
    setState(() {
      this.languages = languages['data'];
    });
    // log("languages ${this.languages}");
  }

  getState(String id) async {
    var states =
        await Provider.of<SearchProvider>(context, listen: false).state(id);
    // log("States $states");
    setState(() {
      this.states = states['data'];
    });
  }

  getCity(String id) async {
    var cities =
        await Provider.of<SearchProvider>(context, listen: false).city(id);
    // log("Cities $cities");
    setState(() {
      this.cities = cities['data'];
    });
  }

  getUser(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response =
        await Provider.of<AuthProvider>(context, listen: false).profile(userId);
    if (response['success'] == true) {
      String userData = jsonEncode(Users.fromJson(response['data']));
      log("User ${response['data']}");
      prefs.setString('userData', userData);
      setState(() {
        user = Users.fromJson(response['data']);
      });
    }
  }

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

  getUserImages() async {
    var userImages = await Provider.of<UserProvider>(context, listen: false)
        .userImages(user.id.toString());
    setState(() {
      this.userImages = userImages['data'];
    });
    log("User Images ${this.userImages}");
  }

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      var response = await Provider.of<AuthProvider>(context, listen: false)
          .imageUpload(user.id.toString(), imageFileList);
      log("Image Upload $response");
      CommonFunctions.showSuccessToast(response['message'], context);
      getUserImages();
    }
    setState(() {});
  }

  final ScrollController _scrollController = ScrollController();
  bool profileEdit = false,
      basicInformation = false,
      basicInformation2 = false,
      familyDetail = false,
      religionBackground = false,
      educationCareer = false,
      location = false,
      astrology = false,
      contactInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        elevation: 0,
        actions: [
          Center(
            child: SizedBox(
              height: 5.3.h,
              width: 65.w,
              child: TextField(
                style: TextStyle(color: AppColors.whiteColor),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.whiteColor.withOpacity(.3),
                  contentPadding: EdgeInsets.only(top: 1.h, left: 2.w),
                  hintText: "Find your partner",
                  hintStyle: TextStyle(color: AppColors.whiteColor),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.whiteColor,
                  ),
                ),
                onSubmitted: (value) async {
                  var response =
                      await Provider.of<SearchProvider>(context, listen: false)
                          .filterById(value);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResult(
                        data: response['profile']['data'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 2.w),
        ],
      ),
      drawer: const HomeDrawer(),
      body: ListView(
        children: [
          Container(
            height: 35.h,
            padding: EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor2,
              image: DecorationImage(
                image: NetworkImage(user.image.toString()),
                fit: BoxFit.fill,
                opacity: .2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 5.h,
                            backgroundColor: AppColors.basicColor,
                            backgroundImage:
                                NetworkImage(user.image.toString()),
                          ),
                          SizedBox(width: 4.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 60.w,
                                child: Text(
                                  user.name.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 2.5.h,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                '${user.age} yrs, 55',
                                style: TextStyle(
                                  fontSize: 1.8.h,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 1.8.h,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                '${user.mobile}',
                                style: TextStyle(
                                  fontSize: 1.8.h,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     setState(() {
                      //       profileEdit = true;
                      //     });
                      //   },
                      //   child: Icon(
                      //     Icons.edit,
                      //     color: AppColors.whiteColor,
                      //     size: 3.5.h,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // SizedBox(height: 1.h),
                Container(
                  // height: 10.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                      // color: AppColors.whiteColor,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: AppColors.greyColor.withOpacity(.6),
                      //     blurRadius: 10,
                      //   )
                      // ],
                      ),
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.h),
                  child: Text(
                    user.aboutMe == null ? '' : user.aboutMe.toString(),
                    maxLines: 5,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 1.7.h,
                      color: AppColors.whiteColor.withOpacity(.6),
                    ),
                  ),
                ),
                TabBar(
                  onTap: (value) {
                    setState(() {
                      selectIndex = value;
                    });
                  },
                  controller: _tabController,
                  indicatorColor: AppColors.primaryColor,
                  labelColor: AppColors.whiteColor,
                  unselectedLabelColor: AppColors.whiteColor,
                  tabs: const [
                    Tab(text: "My Profile"),
                    // Tab(text: "Message"),
                    Tab(text: "Photo"),
                  ],
                )
              ],
            ),
          ),
          selectIndex == 0
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAboutMeTab = true;
                            });
                          },
                          child: Container(
                            height: 7.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: isAboutMeTab == true
                                      ? AppColors.primaryColor
                                      : AppColors.appColor,
                                  width: isAboutMeTab == true ? 4 : 2,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text("About me"),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() => setState(() {
                                isAboutMeTab = false;
                              })),
                          child: Container(
                            height: 7.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: isAboutMeTab == false
                                      ? AppColors.primaryColor
                                      : AppColors.appColor,
                                  width: isAboutMeTab == false ? 4 : 2,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: const Text("Partner Preferences "),
                          ),
                        ),
                      ],
                    ),
                    isAboutMeTab
                        ? Column(
                            children: [
                              CustomCard(
                                image: Images.people,
                                title: "Basic information",
                                isEdit: basicInformation,
                                onEdit: () async {
                                  if (basicInformation) {
                                    var data = {
                                      "user_id": user.id,
                                      'name': name.text,
                                      'dob': dob.text == 'null' ? '' : dob.text,
                                      'gender': gender.text,
                                      'diet': diet.text,
                                      'drinking_habit': drink.text,
                                      'smoking_habit': smoke.text,
                                      'body_type': body.text,
                                      'height': height.text,
                                      "complexion": complexion.text,
                                      "drink": drink.text,
                                      "smoke": smoke.text,
                                      "maritalstatus": marital.text,
                                      "physical_status": physical.text
                                    };
                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);
                                    profile();
                                    if (response['success'] == true) {
                                      CommonFunctions.showSuccessToast(
                                          "Profile Update Successfully",
                                          context);
                                    }
                                    setState(() {
                                      basicInformation = false;
                                    });
                                  } else {
                                    getHeight();
                                    name.text = user.name.toString();
                                    gender.text = user.gender.toString();
                                    age.text = user.age.toString();
                                    marital.text =
                                        user.maritalstatus.toString();
                                    employeeIn.text =
                                        user.employeeIn.toString();
                                    complexion.text =
                                        user.complexion.toString();
                                    physical.text =
                                        user.physicalstatus.toString();
                                    dob.text = user.dob.toString();
                                    height.text = CommonFunctions()
                                        .convertHeight(user.height.toString());
                                    diet.text = user.diet.toString();
                                    drink.text = user.drinkh.toString();
                                    smoke.text = user.smokha.toString();
                                    body.text = user.bodyType.toString();
                                    log("Edit");
                                    setState(() {
                                      basicInformation = true;
                                    });
                                  }
                                },
                                leftChildren: [
                                  ColumnText(
                                    text: 'Name',
                                    value: "${user.name}",
                                    controller: name,
                                    edit: basicInformation,
                                  ),
                                  ColumnText(
                                    text: 'Gender',
                                    value: user.gender.toString(),
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: gender,
                                    items: const [
                                      "Male",
                                      "Female",
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        gender.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Employed In',
                                    value: "${user.employeeIn}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: employeeIn,
                                    items: const [
                                      "Government",
                                      "Private",
                                      "Business",
                                      "Defence",
                                      "Self Employed",
                                      "Not Working",
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        employeeIn.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Marital Status',
                                    value: "${user.maritalstatus}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: marital,
                                    items: const [
                                      "Never Married",
                                      "Awaiting Divorce",
                                      "Divorced",
                                      "Widowed",
                                      "Annulled"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        marital.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Complexion',
                                    value: "${user.complexion}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: complexion,
                                    items: const [
                                      "Fair",
                                      'Not Fair',
                                      "Wheatish",
                                      "Wheatish Brown",
                                      "Dark"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        complexion.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Physical Status',
                                    value: "${user.physicalstatus}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: physical,
                                    items: const [
                                      "Normal",
                                      "HIV Positive",
                                      "Physically Challenged"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        physical.text = value;
                                      });
                                    },
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Date of Birth',
                                    value: "${user.dob}",
                                    edit: basicInformation,
                                    controller: dob,
                                  ),
                                  ColumnText(
                                    text: 'Height',
                                    value: CommonFunctions()
                                        .convertHeight("${user.height}"),
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: height,
                                    items: heights,
                                    api: true,
                                    onChanged: (value) {
                                      setState(() {
                                        height.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Dietary Habits',
                                    value: "${user.diet}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: diet,
                                    items: const [
                                      "Vegetarian",
                                      "Non Veg",
                                      "jain",
                                      "Eggetarian"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        diet.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Drinking Habits',
                                    value: "${user.drinkh}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: drink,
                                    items: const ['Yes', 'No', 'Occasionally'],
                                    onChanged: (value) {
                                      setState(() {
                                        drink.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Smoking Habits',
                                    value: "${user.smokha}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: smoke,
                                    items: const ['Yes', 'No', 'Occasionally'],
                                    onChanged: (value) {
                                      setState(() {
                                        smoke.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Body Type',
                                    value: "${user.btype}",
                                    edit: basicInformation,
                                    dropDown: basicInformation,
                                    controller: body,
                                    items: const [
                                      "Slim",
                                      "Average",
                                      "Athletic",
                                      "Heavy"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        body.text = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              CustomCard(
                                image: Images.family,
                                title: "Family Details",
                                isEdit: familyDetail,
                                onEdit: () async {
                                  if (familyDetail) {
                                    var data = {
                                      'family_type': familyType.text,
                                      'father_occupation': fOccupation.text,
                                      'age': age.text,
                                      'mother_occupation': mOccupation.text,
                                      'brother': nBrother.text,
                                      'brother_married': mBrother.text,
                                      'famvalue': fValue.text,
                                      'famincome': fIncome.text,
                                      'diet': diet.text,
                                      'famstatus': fStatus.text,
                                      'sister': nSister.text,
                                      'sister_married': mSister.text,
                                    };
                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);

                                    profile();

                                    setState(() {
                                      familyDetail = false;
                                    });
                                  } else {
                                    getIncome();
                                    familyType.text =
                                        user.familytype.toString();
                                    fOccupation.text =
                                        user.fatheroccupation.toString();
                                    age.text = user.age.toString();
                                    mOccupation.text =
                                        user.motheroccupation.toString();
                                    nBrother.text = user.noofbrother.toString();
                                    mBrother.text = user.married1.toString();
                                    fValue.text = user.famvalue.toString();
                                    fIncome.text = user.famincome.toString();
                                    diet.text = user.diet.toString();
                                    fStatus.text = user.famstatus.toString();
                                    nSister.text = user.noofsisters.toString();
                                    mSister.text = user.married.toString();

                                    setState(() {
                                      familyDetail = true;
                                    });
                                  }
                                },
                                leftChildren: [
                                  ColumnText(
                                    text: 'Family Type',
                                    value: "${user.familytype}",
                                    edit: familyDetail,
                                    controller: familyType,
                                    dropDown: familyDetail,
                                    items: const ["Joint", "Nuclear", "Other"],
                                    onChanged: (value) {
                                      setState(() {
                                        familyType.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Father Occupation',
                                    value: "${user.fatheroccupation}",
                                    edit: familyDetail,
                                    dropDown: familyDetail,
                                    controller: fOccupation,
                                    items: const [
                                      "Employed",
                                      "Business Man",
                                      "Not Employed",
                                      "Retired",
                                      "Passed Away"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        fOccupation.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Age',
                                    value: "${user.age}",
                                    edit: familyDetail,
                                    controller: age,
                                  ),
                                  ColumnText(
                                    text: 'Mother Occupation ',
                                    value: "${user.motheroccupation}",
                                    edit: familyDetail,
                                    dropDown: familyDetail,
                                    controller: mOccupation,
                                    items: const [
                                      "Home Worker",
                                      "Employed",
                                      "Business Man",
                                      "Not Employed",
                                      "Retired",
                                      "Passed Away",
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        mOccupation.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'No of brothers',
                                    value: "${user.noofbrother}",
                                    edit: familyDetail,
                                    controller: nBrother,
                                  ),
                                  ColumnText(
                                    text: 'How many brothers married',
                                    value: "${user.married1}",
                                    edit: familyDetail,
                                    controller: mBrother,
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Family Values',
                                    value: "${user.famvalue}",
                                    edit: familyDetail,
                                    controller: fValue,
                                  ),
                                  ColumnText(
                                    text: 'Family Income',
                                    value: "${user.famincome}",
                                    edit: familyDetail,
                                    controller: fIncome,
                                    dropDown: familyDetail,
                                    api: true,
                                    items: incomes,
                                    onChanged: (value) {
                                      setState(() {
                                        fIncome.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Dietary Habits',
                                    value: "${user.diet}",
                                    edit: familyDetail,
                                    dropDown: familyDetail,
                                    controller: diet,
                                    items: const [
                                      "Vegetarian",
                                      "Non Veg",
                                      "jain",
                                      "Eggetarian"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        diet.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Family Status',
                                    value: "${user.famstatus}",
                                    edit: familyDetail,
                                    dropDown: familyDetail,
                                    controller: fStatus,
                                    items: const [
                                      "Upper Middle",
                                      "Rich Affluent",
                                      "Middle Class"
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        fStatus.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'No of Sister',
                                    value: "${user.noofsisters}",
                                    edit: familyDetail,
                                    controller: nSister,
                                  ),
                                  ColumnText(
                                    text: 'How many sister married',
                                    value: "${user.married}",
                                    edit: familyDetail,
                                    controller: mSister,
                                  ),
                                ],
                              ),
                              CustomCard(
                                image: Images.religion,
                                title: "Religion Background",
                                isEdit: religionBackground,
                                onEdit: () async {
                                  if (religionBackground) {
                                    var data = {
                                      'religion[]': religion.text,
                                      'caste': caste.text,
                                      'subcast': subCaste.text,
                                      'mothertong': motherToungue.text,
                                    };

                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);

                                    profile();
                                    setState(() {
                                      religionBackground = false;
                                    });
                                  } else {
                                    getReligion();
                                    getLanguage();
                                    getCaste();
                                    religion.text = user.religion.toString();
                                    motherToungue.text =
                                        user.mothertong.toString();
                                    subCaste.text = user.subcast.toString();
                                    caste.text = user.caste.toString();
                                    religion.text = user.religion.toString();

                                    setState(() {
                                      religionBackground = true;
                                    });
                                  }
                                },
                                leftChildren: [
                                  ColumnText(
                                    text: 'Religion',
                                    value: "${user.religion}",
                                    edit: religionBackground,
                                    dropDown: religionBackground,
                                    items: religions,
                                    api: true,
                                    controller: religion,
                                    onChanged: (value) {
                                      setState(() {
                                        religion.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Caste',
                                    value: "${user.caste}",
                                    edit: religionBackground,
                                    dropDown: religionBackground,
                                    items: castes,
                                    api: true,
                                    controller: caste,
                                    onChanged: (value) {
                                      setState(() {
                                        caste.text = value;
                                      });
                                    },
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Mother Tounge',
                                    value: "${user.mothertong}",
                                    edit: religionBackground,
                                    dropDown: religionBackground,
                                    controller: motherToungue,
                                    api: true,
                                    items: languages,
                                    onChanged: (value) {
                                      setState(() {
                                        motherToungue.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Sub Caste',
                                    value: "${user.subcast}",
                                    edit: religionBackground,
                                    dropDown: religionBackground,
                                    items: castes,
                                    api: true,
                                    controller: subCaste,
                                    onChanged: (value) {
                                      setState(() {
                                        caste.text = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              CustomCard(
                                image: Images.education,
                                title: "Education & Career",
                                isEdit: educationCareer,
                                onEdit: () async {
                                  if (educationCareer) {
                                    var data = {
                                      'employee_in': employedIn.text,
                                      'education': education.text,
                                      'occupation': occupation.text,
                                      'income': annualIncome.text,
                                    };

                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);

                                    profile();
                                    setState(() {
                                      educationCareer = false;
                                    });
                                  } else {
                                    getEducation();
                                    getOccupation();
                                    getIncome();
                                    employedIn.text =
                                        user.employeeIn.toString();
                                    education.text = user.education.toString();
                                    occupation.text =
                                        user.occupation.toString();
                                    annualIncome.text = user.income.toString();
                                    setState(() {
                                      educationCareer = true;
                                    });
                                  }
                                },
                                leftChildren: [
                                  ColumnText(
                                    text: 'Education',
                                    value: "${user.education}",
                                    edit: educationCareer,
                                    dropDown: educationCareer,
                                    controller: education,
                                    api: true,
                                    items: educations,
                                    onChanged: (value) {
                                      setState(() {
                                        education.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Employed In',
                                    value: "${user.employeeIn}",
                                    edit: educationCareer,
                                    dropDown: educationCareer,
                                    controller: employedIn,
                                    items: const [
                                      "Government",
                                      "Private",
                                      "Business",
                                      "Defence",
                                      "Self Employed",
                                      "Not Working",
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        employedIn.text = value;
                                      });
                                    },
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Occupation',
                                    value: "${user.occupation}",
                                    edit: educationCareer,
                                    dropDown: educationCareer,
                                    controller: occupation,
                                    api: true,
                                    items: occupations,
                                    onChanged: (value) {
                                      setState(() {
                                        occupation.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'Annual Income',
                                    value: "${user.income}",
                                    edit: educationCareer,
                                    dropDown: educationCareer,
                                    controller: annualIncome,
                                    api: true,
                                    items: incomes,
                                    onChanged: (value) {
                                      setState(() {
                                        annualIncome.text = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              CustomCard(
                                image: Images.location,
                                title: "Location",
                                isEdit: location,
                                onEdit: () async {
                                  if (location) {
                                    var data = {
                                      'country': country.text,
                                      'state': state.text,
                                      'city': city.text,
                                      'postalCode': postalCode.text,
                                    };

                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);

                                    profile();
                                    setState(() {
                                      location = false;
                                    });
                                  } else {
                                    getCountry();
                                    country.text = user.country != ""
                                        ? user.country.toString()
                                        : 'null';
                                    state.text = user.state.toString();
                                    city.text = user.city.toString();
                                    postalCode.text =
                                        user.postalCode.toString();
                                    setState(() {
                                      location = true;
                                    });
                                  }
                                },
                                leftChildren: [
                                  ColumnText(
                                    text: 'Country',
                                    value: "${user.country}",
                                    edit: location,
                                    dropDown: location,
                                    controller: country,
                                    api: true,
                                    items: countries,
                                    onChanged: (value) {
                                      setState(() {
                                        motherToungue.text = value;
                                      });
                                    },
                                  ),
                                  ColumnText(
                                    text: 'State',
                                    value: "${user.state}",
                                    edit: location,
                                    controller: state,
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'City',
                                    value: "${user.city}",
                                    edit: location,
                                    controller: city,
                                  ),
                                  ColumnText(
                                    text: 'Postal Code',
                                    value: "${user.postalCode}",
                                    edit: location,
                                    controller: postalCode,
                                  ),
                                ],
                              ),
                              CustomCard(
                                image: Images.horoscope,
                                title: "Astrology",
                                isEdit: astrology,
                                onEdit: () async {
                                  if (astrology) {
                                    var data = {
                                      'timeOfBirth': tob.text,
                                      'rashi': rishi.text,
                                      'manglik': manglik.text,
                                      'nakshtra': nakshtra.text,
                                      'birthplace': pob.text,
                                      'horoscope': horoscope.text,
                                    };

                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);

                                    profile();
                                    setState(() {
                                      astrology = false;
                                    });
                                  } else {
                                    horoscope.text = user.horoscope.toString();
                                    tob.text = user.timeOfBirth.toString();
                                    rishi.text = user.rashi.toString();
                                    pob.text = user.birthplace.toString();
                                    nakshtra.text = user.nakshtra.toString();
                                    manglik.text = user.manglik.toString();
                                    setState(() {
                                      astrology = true;
                                    });
                                  }
                                },
                                leftChildren: [
                                  ColumnText(
                                    text: 'Horoscope',
                                    value: "${user.horoscope}",
                                    edit: astrology,
                                    controller: horoscope,
                                  ),
                                  ColumnText(
                                    text: 'Time of Birth',
                                    value: "${user.timeOfBirth}",
                                    edit: astrology,
                                    controller: tob,
                                  ),
                                  ColumnText(
                                    text: 'Rishi/ Moon Sign',
                                    value: "${user.rashi}",
                                    edit: astrology,
                                    controller: rishi,
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Place of Birth',
                                    value: "${user.birthplace}",
                                    edit: astrology,
                                    controller: pob,
                                  ),
                                  ColumnText(
                                    text: 'Nakshtra',
                                    value: "${user.nakshtra}",
                                    edit: astrology,
                                    controller: nakshtra,
                                  ),
                                  ColumnText(
                                    text: 'Manglik',
                                    value: "${user.manglik}",
                                    edit: astrology,
                                    controller: manglik,
                                  ),
                                ],
                              ),
                              CustomCard(
                                image: Images.people,
                                title: "Contact Information",
                                isEdit: contactInfo,
                                onEdit: () async {
                                  if (contactInfo) {
                                    var data = {
                                      'email': email.text,
                                      'mobile': phone.text,
                                    };

                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);

                                    profile();
                                    setState(() {
                                      contactInfo = false;
                                    });
                                  } else {
                                    email.text = user.email.toString();
                                    phone.text = user.mobile.toString();
                                    setState(() {
                                      contactInfo = true;
                                    });
                                  }
                                },
                                leftChildren: [
                                  ColumnText(
                                    text: 'Email id',
                                    value: "${user.email}",
                                    edit: contactInfo,
                                    controller: email,
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Mobile No.',
                                    value: "${user.mobile}",
                                    edit: contactInfo,
                                    controller: phone,
                                  ),
                                ],
                              ),
                            ],
                          )
                        : CustomCard(
                            image: Images.people,
                            title: "Basic information",
                            isEdit: basicInformation2,
                            onEdit: () async {
                              if (basicInformation2) {
                                var data = {
                                  'age': age.text,
                                  'height': height.text,
                                  'email': email.text,
                                  'manglik': manglik.text,
                                  'complexion': complexion.text,
                                  'religion': religion.text,
                                  'caste': caste.text,
                                  'country': country.text,
                                  'state': state.text,
                                  'city': city.text,
                                  'income': annualIncome.text,
                                  'drink': drink.text,
                                  'smoke': smoke.text,
                                  'education': education.text,
                                  'horoscope': horoscope.text,
                                  'occupation': occupation.text,
                                };

                                var response = await Provider.of<AuthProvider>(
                                        context,
                                        listen: false)
                                    .update(data);

                                profile();
                                setState(() {
                                  basicInformation2 = false;
                                });
                              } else {
                                getHeight();
                                getReligion();
                                age.text = user.age.toString();
                                height.text = user.height.toString();
                                body.text = user.bodyType.toString();
                                complexion.text = user.complexion.toString();
                                religion.text = user.religion.toString();
                                caste.text = user.caste.toString();
                                country.text = user.country.toString();
                                state.text = user.state.toString();
                                annualIncome.text = user.income.toString();
                                marital.text = user.maritalstatus.toString();
                                drink.text = user.drinkh.toString();
                                smoke.text = user.smokha.toString();
                                education.text = user.education.toString();
                                motherToungue.text = user.mothertong.toString();
                                manglik.text = user.manglik.toString();
                                horoscope.text = user.horoscope.toString();
                                occupation.text = user.occupation.toString();
                                setState(() {
                                  basicInformation2 = true;
                                });
                              }
                            },
                            leftChildren: [
                              ColumnText(
                                text: 'Age',
                                value: "${user.age}",
                                edit: basicInformation2,
                                controller: age,
                              ),
                              ColumnText(
                                text: 'Height',
                                value: "${user.height}",
                                edit: basicInformation2,
                                dropDown: basicInformation2,
                                controller: height,
                                items: heights,
                                api: true,
                                onChanged: (value) {
                                  setState(() {
                                    height.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Body type',
                                value: "${user.bodyType}",
                                edit: basicInformation2,
                                controller: body,
                              ),
                              ColumnText(
                                text: 'Complexion',
                                value: "${user.complexion}",
                                edit: basicInformation2,
                                dropDown: basicInformation2,
                                controller: complexion,
                                items: const [
                                  "Fair",
                                  'Not Fair',
                                  "Wheatish",
                                  "Wheatish Brown",
                                  "Dark"
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    complexion.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Religion',
                                value: "${user.religion}",
                                edit: basicInformation2,
                                controller: religion,
                                dropDown: basicInformation2,
                                items: religions,
                                api: true,
                                onChanged: (value) {
                                  setState(() {
                                    religion.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Caste',
                                value: "${user.caste}",
                                edit: basicInformation2,
                                controller: caste,
                              ),
                              ColumnText(
                                text: 'Country',
                                value: "${user.country}",
                                edit: basicInformation2,
                                controller: country,
                              ),
                              ColumnText(
                                text: 'State',
                                value: "${user.state}",
                                edit: basicInformation2,
                                controller: state,
                              ),
                              ColumnText(
                                text: 'City',
                                value: "${user.city}",
                                edit: basicInformation2,
                                controller: city,
                              ),
                            ],
                            rightChildren: [
                              ColumnText(
                                text: 'Annual Income',
                                value: "${user.income}",
                                edit: basicInformation2,
                                controller: annualIncome,
                                dropDown: basicInformation2,
                                api: true,
                                items: incomes,
                                onChanged: (value) {
                                  setState(() {
                                    annualIncome.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Marital Status',
                                value: "${user.maritalstatus}",
                                edit: basicInformation2,
                                dropDown: basicInformation2,
                                controller: marital,
                                items: const [
                                  "Never Married",
                                  "Awaiting Divorce",
                                  "Divorced",
                                  "Widowed",
                                  "Annulled"
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    marital.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Drinking Habits',
                                value: "${user.drinkh}",
                                edit: basicInformation2,
                                dropDown: basicInformation2,
                                controller: drink,
                                items: const ['Yes', 'No', 'Occasionally'],
                                onChanged: (value) {
                                  setState(() {
                                    drink.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Smoking Habits',
                                value: "${user.smokha}",
                                edit: basicInformation2,
                                dropDown: basicInformation2,
                                controller: smoke,
                                items: const ['Yes', 'No', 'Occasionally'],
                                onChanged: (value) {
                                  setState(() {
                                    drink.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Education',
                                value: "${user.education}",
                                edit: basicInformation2,
                                dropDown: basicInformation2,
                                controller: education,
                                api: true,
                                items: educations,
                                onChanged: (value) {
                                  setState(() {
                                    education.text = value;
                                  });
                                },
                              ),
                              ColumnText(
                                text: 'Mother Tongue',
                                value: "${user.mothertong}",
                                edit: basicInformation2,
                                controller: motherToungue,
                              ),
                              ColumnText(
                                text: 'Manglik Status',
                                value: "${user.manglik}",
                                edit: basicInformation2,
                                controller: manglik,
                              ),
                              ColumnText(
                                text: 'Horoscope',
                                value: "${user.horoscope}",
                                edit: basicInformation2,
                                controller: horoscope,
                              ),
                              ColumnText(
                                text: 'Occupation',
                                value: "${user.occupation}",
                                edit: basicInformation2,
                                controller: occupation,
                              ),
                            ],
                          ),
                  ],
                )
              // : selectIndex == 1
              //     ? const Text("Message")
              : Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: GridView.builder(
                          itemCount: userImages.length + 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    active = index.toString();
                                  });
                                },
                                child: Column(
                                  children: [
                                    userImages.length > index
                                        ? Stack(
                                            children: [
                                              Image.network(
                                                userImages[index]['image'],
                                                fit: BoxFit.fill,
                                                height: 13.h,
                                                width: 30.w,
                                              ),
                                              active == index.toString()
                                                  ? Positioned(
                                                      bottom: 10,
                                                      width: 30.w,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () async {
                                                              log("Set Profile");

                                                              var response = await Provider.of<
                                                                          UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .setProfileImage(
                                                                      user.id
                                                                          .toString(),
                                                                      userImages[
                                                                              index]
                                                                          [
                                                                          'id']);
                                                              CommonFunctions
                                                                  .showSuccessToast(
                                                                      response[
                                                                          'message'],
                                                                      context);
                                                              getUserImages();
                                                              profile();

                                                              // log(response);
                                                            },
                                                            child: Icon(
                                                              Icons.done,
                                                              color: AppColors
                                                                  .greenColor,
                                                              size: 4.h,
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              log("Delete Photo");
                                                              var response = await Provider.of<
                                                                          UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .deleteImage(
                                                                      userImages[
                                                                              index]
                                                                          [
                                                                          'id']);
                                                              CommonFunctions
                                                                  .showSuccessToast(
                                                                      "Photo detected successfully",
                                                                      context);
                                                              getUserImages();
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              color: AppColors
                                                                  .primaryColor,
                                                              size: 4.h,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          )
                                        : GestureDetector(
                                            onTap: selectImages,
                                            child: Icon(
                                              Icons.add_a_photo,
                                              size: 1.5.h * 1.5.w,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
