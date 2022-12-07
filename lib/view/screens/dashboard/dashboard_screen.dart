import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:app/data/models/user.model.dart';
import 'package:app/helper/common-function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/dashboard/drawer.dart';
import 'package:app/view/screens/dashboard/widgets/column_text.dart';
import 'package:app/view/screens/dashboard/widgets/custom_card.dart';
import 'package:app/view/screens/search/search_result.dart';
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
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    profile();
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
    log("Response ${response['data']}");
    if (response['success'] == true) {
      String userData = jsonEncode(Users.fromJson(response['data']));

      prefs.setString('userData', userData);
      setState(() {
        user = Users.fromJson(response['data']);
      });
    }
    return user;
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
  String? _image;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:${imageFileList!.length}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
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
                  log("Response  ${response['profile']['data']}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchResult(
                        title: "Search",
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
            color: AppColors.backgroundColor2,
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
                          ),
                          SizedBox(width: 4.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 55.w,
                                child: Text(
                                  "${user.name}",
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
                                      'diet': diet.text,
                                      'drinking_habit': drink.text,
                                      'smoking_habit': smoke.text,
                                      'body_type': body.text,
                                      'height': height.text,
                                      'age': age.text,
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
                                    log("Save Data: $data");
                                    log("Response: ${response['data']['userid']}");
                                    await getUser(response['data']['userid']);
                                    setState(() {
                                      basicInformation = false;
                                    });
                                  } else {
                                    name.text = user.name.toString();
                                    gender.text = user.gender.toString();
                                    age.text = user.age.toString();
                                    marital.text =
                                        user.maritalstatus.toString();
                                    complexion.text =
                                        user.complexion.toString();
                                    physical.text =
                                        user.physicalstatus.toString();
                                    dob.text = user.dOB.toString();
                                    height.text = user.height.toString();
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
                                leftChildren: const [
                                  // ColumnText(
                                  //   text: 'Name',
                                  //   value: "${user.name}",
                                  //   controller: name,
                                  //   edit: basicInformation,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Gender',
                                  //   value: "${user.gender}",
                                  //   edit: basicInformation,
                                  //   controller: gender,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Age',
                                  //   value: "${user.age}",
                                  //   edit: basicInformation,
                                  //   controller: age,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Marital Status',
                                  //   value: "${user.maritalstatus}",
                                  //   edit: basicInformation,
                                  //   controller: marital,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Complexion',
                                  //   value: "${user.complexion}",
                                  //   edit: basicInformation,
                                  //   controller: complexion,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Physical Status',
                                  //   value: "${user.physicalstatus}",
                                  //   edit: basicInformation,
                                  //   controller: physical,
                                  // ),
                                ],
                                rightChildren: [
                                  // ColumnText(
                                  //   text: 'Date of Birth',
                                  //   value: "${user.dOB}",
                                  //   edit: basicInformation,
                                  //   controller: dob,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Height',
                                  //   value: "${user.height}",
                                  //   edit: basicInformation,
                                  //   controller: height,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Dietary Habits',
                                  //   value: "${user.diet}",
                                  //   edit: basicInformation,
                                  //   controller: diet,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Drinking Habits',
                                  //   value: "${user.drinkh}",
                                  //   edit: basicInformation,
                                  //   controller: drink,
                                  // ),
                                  // ColumnText(
                                  //   text: 'Smoking Habits',
                                  //   value: "${user.smokha}",
                                  //   edit: basicInformation,
                                  //   controller: smoke,
                                  // ),
                                  ColumnText(
                                    text: 'Body Type',
                                    value: "${user.btype}",
                                    edit: basicInformation,
                                    controller: body,
                                    dropDown: basicInformation,
                                    onChanged: (value) {
                                      debugPrint("Value $value");
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
                                    log("Save Data: $data");
                                    log("Response: $response");
                                    profile();

                                    log("Save Data: $data");
                                    setState(() {
                                      familyDetail = false;
                                    });
                                  } else {
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
                                    log("Edit");
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
                                  ),
                                  ColumnText(
                                    text: 'Father Occupation',
                                    value: "${user.fatheroccupation}",
                                    edit: familyDetail,
                                    controller: fOccupation,
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
                                    controller: mOccupation,
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
                                  ),
                                  ColumnText(
                                    text: 'Dietary Habits',
                                    value: "${user.diet}",
                                    edit: familyDetail,
                                    controller: diet,
                                  ),
                                  ColumnText(
                                    text: 'Family Status',
                                    value: "${user.famstatus}",
                                    edit: familyDetail,
                                    controller: fStatus,
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
                                    log("Save Data: $data");
                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);
                                    log("Save Data: $data");
                                    log("Response: $response");
                                    profile();
                                    setState(() {
                                      religionBackground = false;
                                    });
                                  } else {
                                    religion.text = user.religion.toString();
                                    motherToungue.text =
                                        user.mothertong.toString();
                                    subCaste.text = user.subcast.toString();
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
                                    controller: religion,
                                  ),
                                  ColumnText(
                                    text: 'Caste',
                                    value: "${user.caste}",
                                    edit: religionBackground,
                                    controller: caste,
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Mother Tounge',
                                    value: "${user.mothertong}",
                                    edit: religionBackground,
                                    controller: motherToungue,
                                  ),
                                  ColumnText(
                                    text: 'Sub Caste',
                                    value: "${user.subcast}",
                                    edit: religionBackground,
                                    controller: subCaste,
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
                                    log("Save Data: $data");
                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);
                                    log("Save Data: $data");
                                    log("Response: $response");
                                    profile();
                                    setState(() {
                                      educationCareer = false;
                                    });
                                  } else {
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
                                    controller: education,
                                  ),
                                  ColumnText(
                                    text: 'Employed In',
                                    value: "${user.employeeIn}",
                                    edit: educationCareer,
                                    controller: employedIn,
                                  ),
                                ],
                                rightChildren: [
                                  ColumnText(
                                    text: 'Occupation',
                                    value: "${user.occupation}",
                                    edit: educationCareer,
                                    controller: occupation,
                                  ),
                                  ColumnText(
                                    text: 'Annual Income',
                                    value: "${user.income}",
                                    edit: educationCareer,
                                    controller: annualIncome,
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
                                    log("Save Data: $data");
                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);
                                    log("Save Data: $data");
                                    log("Response: $response");
                                    profile();
                                    setState(() {
                                      location = false;
                                    });
                                  } else {
                                    country.text = user.country.toString();
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
                                    controller: country,
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
                                    log("Save Data: $data");
                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);
                                    log("Save Data: $data");
                                    log("Response: $response");
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
                                    log("Save Data: $data");
                                    var response =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .update(data);
                                    log("Save Data: $data");
                                    log("Response: $response");
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
                                log("Save Data: $data");
                                var response = await Provider.of<AuthProvider>(
                                        context,
                                        listen: false)
                                    .update(data);
                                log("Save Data: $data");
                                log("Response: $response");
                                profile();
                                setState(() {
                                  basicInformation2 = false;
                                });
                              } else {
                                email.text = user.email.toString();
                                phone.text = user.mobile.toString();
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
                                controller: height,
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
                                controller: complexion,
                              ),
                              ColumnText(
                                text: 'Religion',
                                value: "${user.religion}",
                                edit: basicInformation2,
                                controller: religion,
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
                              ),
                              ColumnText(
                                text: 'Marital Status',
                                value: "${user.maritalstatus}",
                                edit: basicInformation2,
                                controller: marital,
                              ),
                              ColumnText(
                                text: 'Drinking Habits',
                                value: "${user.drinkh}",
                                edit: basicInformation2,
                                controller: drink,
                              ),
                              ColumnText(
                                text: 'Smoking Habits',
                                value: "${user.smokha}",
                                edit: basicInformation2,
                                controller: smoke,
                              ),
                              ColumnText(
                                text: 'Education',
                                value: "${user.education}",
                                edit: basicInformation2,
                                controller: education,
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
              : Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              itemCount: imageFileList!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (BuildContext context, int index) {
                                return Image.file(
                                  File(imageFileList![index].path),
                                  fit: BoxFit.cover,
                                );
                              }),
                        ),
                      ),
                      CustomButton(
                        text: "Select Images",
                        radius: 10,
                        width: 30.w,
                        onPressed: selectImages,
                      ),
                      CustomButton(
                        text: "Upload",
                        color: AppColors.primaryColor,
                        radius: 10,
                        textColor: AppColors.whiteColor,
                        width: 30.w,
                        onPressed: () async {
                          var response = await Provider.of<AuthProvider>(
                                  context,
                                  listen: false)
                              .imageUpload("${user.id}", imageFileList);
                          CommonFunctions.showSuccessToast(
                              response['message'], context);
                          log("Response $response");
                          if (response['success'] == true) {
                            setState(() {
                              imageFileList = [];
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
