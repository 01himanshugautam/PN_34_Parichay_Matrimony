import 'dart:convert';
import 'dart:developer';
import 'package:app/data/models/user.model.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/dashboard/drawer.dart';
import 'package:app/view/screens/dashboard/widgets/column_text.dart';
import 'package:app/view/screens/dashboard/widgets/custom_card.dart';
import 'package:app/view/screens/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
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

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
    if (response['success'] == true) {
      String user = jsonEncode(Users.fromJson(response['data']));
      prefs.setString('userData', user);
    }
  }

  final ScrollController _scrollController = ScrollController();
  bool profileEdit = false, basicInformation = false, familyDetail = false;

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
                      InkWell(
                        onTap: () {
                          setState(() {
                            profileEdit = true;
                          });
                        },
                        child: Icon(
                          Icons.edit,
                          color: AppColors.whiteColor,
                          size: 3.5.h,
                        ),
                      ),
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
                    Tab(text: "Message"),
                    Tab(text: "Photo"),
                  ],
                )
              ],
            ),
          ),
          // selectIndex == 0
          //     ?
          Column(
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
                          onEdit: () {
                            if (basicInformation) {
                              var data = {
                                'name': name.text,
                              };
                              log("Save Data: $data");
                              setState(() {
                                basicInformation = false;
                              });
                            } else {
                              name.text = user.name.toString();
                              gender.text = user.gender.toString();
                              age.text = user.age.toString();
                              marital.text = user.maritalstatus.toString();
                              complexion.text = user.complexion.toString();
                              physical.text = user.physicalstatus.toString();
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
                          leftChildren: [
                            ColumnText(
                              text: 'Name',
                              value: "${user.name}",
                              controller: name,
                              edit: basicInformation,
                            ),
                            ColumnText(
                              text: 'Gender',
                              value: "${user.gender}",
                              edit: basicInformation,
                              controller: gender,
                            ),
                            ColumnText(
                              text: 'Age',
                              value: "${user.age}",
                              edit: basicInformation,
                              controller: age,
                            ),
                            ColumnText(
                              text: 'Marital Status',
                              value: "${user.maritalstatus}",
                              edit: basicInformation,
                              controller: marital,
                            ),
                            ColumnText(
                              text: 'Complexion',
                              value: "${user.complexion}",
                              edit: basicInformation,
                              controller: complexion,
                            ),
                            ColumnText(
                              text: 'Physical Status',
                              value: "${user.physicalType}",
                              edit: basicInformation,
                              controller: physical,
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Date of Birth',
                              value: "${user.dOB}",
                              edit: basicInformation,
                              controller: dob,
                            ),
                            ColumnText(
                              text: 'Height',
                              value: "${user.height}",
                              edit: basicInformation,
                              controller: height,
                            ),
                            ColumnText(
                              text: 'Dietary Habits',
                              value: "${user.diet}",
                              edit: basicInformation,
                              controller: diet,
                            ),
                            ColumnText(
                              text: 'Drinking Habits',
                              value: "${user.drinkh}",
                              edit: basicInformation,
                              controller: drink,
                            ),
                            ColumnText(
                              text: 'Smoking Habits',
                              value: "${user.smokha}",
                              edit: basicInformation,
                              controller: smoke,
                            ),
                            ColumnText(
                              text: 'Body Type',
                              value: "${user.bodyType}",
                              edit: basicInformation,
                              controller: body,
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.family,
                          title: "Family Details",
                          onEdit: () {
                            if (familyDetail) {
                              var data = {
                                'name': name.text,
                              };
                              log("Save Data: $data");
                              setState(() {
                                familyDetail = false;
                              });
                            } else {
                              name.text = user.name.toString();
                              gender.text = user.gender.toString();
                              age.text = user.age.toString();
                              marital.text = user.maritalstatus.toString();
                              complexion.text = user.complexion.toString();
                              physical.text = user.physicalstatus.toString();
                              dob.text = user.dOB.toString();
                              height.text = user.height.toString();
                              diet.text = user.diet.toString();
                              drink.text = user.drinkh.toString();
                              smoke.text = user.smokha.toString();
                              body.text = user.bodyType.toString();
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
                            ),
                            ColumnText(
                              text: 'Father Occupation',
                              value: "${user.fatheroccupation}",
                            ),
                            ColumnText(
                              text: 'Age',
                              value: "${user.age}",
                            ),
                            ColumnText(
                              text: 'Mother Occupation ',
                              value: "${user.motheroccupation}",
                            ),
                            ColumnText(
                              text: 'No of brothers',
                              value: "${user.noofbrother}",
                            ),
                            ColumnText(
                              text: 'How many brothers married',
                              value: "${user.married1}",
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Family Values',
                              value: "${user.famvalue}",
                            ),
                            ColumnText(
                              text: 'Family Income',
                              value: "${user.famincome}",
                            ),
                            ColumnText(
                              text: 'Dietary Habits',
                              value: "${user.diet}",
                            ),
                            ColumnText(
                              text: 'Family Status',
                              value: "${user.famstatus}",
                            ),
                            ColumnText(
                              text: 'No of Sister',
                              value: "${user.noofsisters}",
                            ),
                            ColumnText(
                              text: 'How many sister married',
                              value: "${user.married}",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.religion,
                          title: "Religion Background",
                          leftChildren: [
                            ColumnText(
                              text: 'Religion',
                              value: "${user.religion}",
                            ),
                            ColumnText(
                              text: 'Caste',
                              value: "${user.caste}",
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Mother Tounge',
                              value: "${user.mothertong}",
                            ),
                            ColumnText(
                              text: 'Sub Caste',
                              value: "${user.subcast}",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.education,
                          title: "Education & Career",
                          leftChildren: [
                            ColumnText(
                              text: 'Education',
                              value: "${user.education}",
                            ),
                            ColumnText(
                              text: 'Employed In',
                              value: "${user.employeeIn}",
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Occupation',
                              value: "${user.occupation}",
                            ),
                            ColumnText(
                              text: 'Annual Income',
                              value: "${user.income}",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.location,
                          title: "Location",
                          leftChildren: [
                            ColumnText(
                              text: 'Country',
                              value: "${user.country}",
                            ),
                            ColumnText(
                              text: 'State',
                              value: "${user.state}",
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'City',
                              value: "${user.city}",
                            ),
                            ColumnText(
                              text: 'Postal Code',
                              value: "${user.postalCode}",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.horoscope,
                          title: "Astrology",
                          leftChildren: [
                            ColumnText(
                              text: 'Horoscope',
                              value: "${user.horoscope}",
                            ),
                            ColumnText(
                              text: 'Time of Birth',
                              value: "${user.timeOfBirth}",
                            ),
                            ColumnText(
                              text: 'Rishi/ Moon Sign',
                              value: "${user.rashi}",
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Place of Birth',
                              value: "${user.birthplace}",
                            ),
                            ColumnText(
                              text: 'Nakshtra',
                              value: "${user.nakshtra}",
                            ),
                            ColumnText(
                              text: 'Manglik',
                              value: "${user.manglik}",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.people,
                          title: "Contact Information",
                          leftChildren: [
                            ColumnText(
                              text: 'Email id',
                              value: "${user.email}",
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Mobile No.',
                              value: "${user.mobile}",
                            ),
                          ],
                        ),
                      ],
                    )
                  : CustomCard(
                      image: Images.people,
                      title: "Basic information",
                      leftChildren: [
                        ColumnText(
                          text: 'Age',
                          value: "${user.age}",
                        ),
                        ColumnText(
                          text: 'Height',
                          value: "${user.height}",
                        ),
                        ColumnText(
                          text: 'Body type',
                          value: "${user.bodyType}",
                        ),
                        ColumnText(
                          text: 'Complexion',
                          value: "${user.complexion}",
                        ),
                        ColumnText(
                          text: 'Religion',
                          value: "${user.religion}",
                        ),
                        ColumnText(
                          text: 'Caste',
                          value: "${user.caste}",
                        ),
                        ColumnText(
                          text: 'Country',
                          value: "${user.country}",
                        ),
                        ColumnText(
                          text: 'State',
                          value: "${user.state}",
                        ),
                        ColumnText(
                          text: 'City',
                          value: "${user.city}",
                        ),
                      ],
                      rightChildren: [
                        ColumnText(
                          text: 'Annual Income',
                          value: "${user.income}",
                        ),
                        ColumnText(
                          text: 'Marital Status',
                          value: "${user.maritalstatus}",
                        ),
                        ColumnText(
                          text: 'Drinking Habits',
                          value: "${user.drinkh}",
                        ),
                        ColumnText(
                          text: 'Smoking Habits',
                          value: "${user.smokha}",
                        ),
                        ColumnText(
                          text: 'Education',
                          value: "${user.education}",
                        ),
                        ColumnText(
                          text: 'Mother Tongue',
                          value: "${user.mothertong}",
                        ),
                        ColumnText(
                          text: 'Manglik Status',
                          value: "${user.manglik}",
                        ),
                        ColumnText(
                          text: 'Horoscope',
                          value: "${user.horoscope}",
                        ),
                        ColumnText(
                          text: 'Occupation',
                          value: "${user.occupation}",
                        ),
                      ],
                    ),
            ],
          )
          // : selectIndex == 1
          //     ? const Text("Message")
          //     : const Text("Photo"),
        ],
      ),
    );
  }
}
