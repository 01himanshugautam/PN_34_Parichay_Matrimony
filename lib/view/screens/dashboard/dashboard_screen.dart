import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/dashboard/drawer.dart';
import 'package:app/view/screens/dashboard/widgets/column_text.dart';
import 'package:app/view/screens/dashboard/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
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
                    )),
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
                                  "Container Shah (PM6277)",
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
                                '35 yrs, 55',
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
                                '1234567890',
                                style: TextStyle(
                                  fontSize: 1.8.h,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.edit,
                        color: AppColors.whiteColor,
                        size: 3.5.h,
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
                      children: const [
                        CustomCard(
                          image: Images.people,
                          title: "Basic information",
                          leftChildren: [
                            ColumnText(
                              text: 'Name',
                              value: 'Container',
                            ),
                            ColumnText(
                              text: 'Gender',
                              value: 'Male',
                            ),
                            ColumnText(
                              text: 'Age',
                              value: '35',
                            ),
                            ColumnText(
                              text: 'Marital Status',
                              value: 'Never Married',
                            ),
                            ColumnText(
                              text: 'Complexion',
                              value: 'Fair',
                            ),
                            ColumnText(
                              text: 'Physical Status',
                              value: 'Normal',
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Date Off Birth',
                              value: '35',
                            ),
                            ColumnText(
                              text: 'Height',
                              value: "5'5'",
                            ),
                            ColumnText(
                              text: 'Dietary Habits',
                              value: 'Vegetarian',
                            ),
                            ColumnText(
                              text: 'Drinking Habits',
                              value: 'No',
                            ),
                            ColumnText(
                              text: 'Smoking Habits',
                              value: 'No',
                            ),
                            ColumnText(
                              text: 'Body Type',
                              value: 'Slim',
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.people,
                          title: "Family Details",
                          leftChildren: [
                            ColumnText(
                              text: 'Family Type',
                              value: 'Joint',
                            ),
                            ColumnText(
                              text: 'Father Occupation',
                              value: 'Passed Away',
                            ),
                            ColumnText(
                              text: 'Age',
                              value: '35',
                            ),
                            ColumnText(
                              text: 'Mother Occupation ',
                              value: 'Homemaker',
                            ),
                            ColumnText(
                              text: 'No of brothers',
                              value: '1',
                            ),
                            ColumnText(
                              text: 'How many brothers married',
                              value: '1',
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Family Values',
                              value: 'Liberal',
                            ),
                            ColumnText(
                              text: 'Family Income',
                              value: "Rs 7.5-10 Lakh",
                            ),
                            ColumnText(
                              text: 'Dietary Habits',
                              value: 'Vegetarian',
                            ),
                            ColumnText(
                              text: 'Family Status',
                              value: 'Middle Class',
                            ),
                            ColumnText(
                              text: 'No of Sister',
                              value: '1',
                            ),
                            ColumnText(
                              text: 'How many sister married',
                              value: '0',
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.people,
                          title: "Religion Background",
                          leftChildren: [
                            ColumnText(
                              text: 'Religion',
                              value: 'Hindu',
                            ),
                            ColumnText(
                              text: 'Caste',
                              value: 'Vaishnan',
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Mother Tounge',
                              value: 'Gujarati',
                            ),
                            ColumnText(
                              text: 'Sub Caste',
                              value: "5'58",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.people,
                          title: "Education & Career",
                          leftChildren: [
                            ColumnText(
                              text: 'Education',
                              value: 'MSW',
                            ),
                            ColumnText(
                              text: 'Employed In',
                              value: 'Private',
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Occupation',
                              value: 'HR Professional',
                            ),
                            ColumnText(
                              text: 'Annual Income',
                              value: "Rs 7-7.5 Lakh",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.people,
                          title: "Location",
                          leftChildren: [
                            ColumnText(
                              text: 'Country',
                              value: 'India',
                            ),
                            ColumnText(
                              text: 'State',
                              value: 'Not Filled',
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'City',
                              value: 'Delhi',
                            ),
                            ColumnText(
                              text: 'Postal Code',
                              value: "Not Filled",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.people,
                          title: "Astrology",
                          leftChildren: [
                            ColumnText(
                              text: 'Horoscope',
                              value: 'MSW',
                            ),
                            ColumnText(
                              text: 'Time of Birth',
                              value: 'Private',
                            ),
                            ColumnText(
                              text: 'Rishi/ Moon Sign',
                              value: "Don't now",
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Place of Birth',
                              value: 'Delhi',
                            ),
                            ColumnText(
                              text: 'Nakshtra',
                              value: "Utaea",
                            ),
                            ColumnText(
                              text: 'Manglik',
                              value: "Don't Know",
                            ),
                          ],
                        ),
                        CustomCard(
                          image: Images.people,
                          title: "Contact Details",
                          leftChildren: [
                            ColumnText(
                              text: 'Email id',
                              value: 'Not Filled',
                            ),
                          ],
                          rightChildren: [
                            ColumnText(
                              text: 'Mobile No.',
                              value: 'Not Filled',
                            ),
                          ],
                        ),
                      ],
                    )
                  : const CustomCard(
                      image: Images.people,
                      title: "Basic information",
                      leftChildren: [
                        ColumnText(
                          text: 'Age',
                          value: '35',
                        ),
                        ColumnText(
                          text: 'Height',
                          value: "5'5'",
                        ),
                        ColumnText(
                          text: 'Body type',
                          value: 'Never Married',
                        ),
                        ColumnText(
                          text: 'Complexion',
                          value: 'Fair',
                        ),
                        ColumnText(
                          text: 'Religion',
                          value: 'Normal',
                        ),
                        ColumnText(
                          text: 'Caste',
                          value: 'Normal',
                        ),
                        ColumnText(
                          text: 'Country',
                          value: 'Normal',
                        ),
                        ColumnText(
                          text: 'State',
                          value: 'Normal',
                        ),
                        ColumnText(
                          text: 'City',
                          value: 'Normal',
                        ),
                      ],
                      rightChildren: [
                        ColumnText(
                          text: 'Annual Income',
                          value: '35',
                        ),
                        ColumnText(
                          text: 'Marital Status',
                          value: 'Vegetarian',
                        ),
                        ColumnText(
                          text: 'Drinking Habits',
                          value: 'No',
                        ),
                        ColumnText(
                          text: 'Smoking Habits',
                          value: 'No',
                        ),
                        ColumnText(
                          text: 'Education',
                          value: 'Slim',
                        ),
                        ColumnText(
                          text: 'Mother Tongue',
                          value: 'Slim',
                        ),
                        ColumnText(
                          text: 'Manglik Status',
                          value: 'Slim',
                        ),
                        ColumnText(
                          text: 'Horoscope',
                          value: 'Slim',
                        ),
                        ColumnText(
                          text: 'Occupation',
                          value: 'Slim',
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
