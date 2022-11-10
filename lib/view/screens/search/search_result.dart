import 'dart:developer';

import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // The PageController allows us to instruct the PageView to change pages.
    _pageController = PageController();
  }

  void _goForward() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  String a = 'nothing';
  void _goBack() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Search"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.basicColor,
        child: const Icon(Icons.search),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails dragEndDetails) {
          if (dragEndDetails.primaryVelocity! < 0) {
            debugPrint('Move page forwards');
            _goForward();
          } else if (dragEndDetails.primaryVelocity! > 0) {
            debugPrint('Move page backwards');
            _goBack();
          }
        },
        child: PageView.builder(
          itemCount: 10,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            log("Index $index");
            return SizedBox(
              height: 100.h,
              width: 100.w,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.basicColor.withOpacity(.3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45.h,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Example ABCD(PM2321)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 2.h,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 35.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Age / Height",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Religion / Caste",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Mother Tongue",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Education",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Occupation",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Income",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Location",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            "Marital Status",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 35.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ": 31 years, (5'5)",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            ": Hindu/Jat",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            ": Hindi",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            ": Not Specified",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            ": Not Specified",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            ": Rs. 4 - 5 Lakh",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            ": Karnal(Haryana)",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          SizedBox(height: 1.h),
                                          Text(
                                            ": Never Married",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 1.8.h,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Container(
                            height: 7.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: AppColors.primaryColor,
                            ),

                            // padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.thumb_up,
                                        color: AppColors.whiteColor),
                                    Text(
                                      "Express Interest",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 1.5.h,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.notes,
                                        color: AppColors.whiteColor),
                                    Text(
                                      "Shortlist",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 1.5.h,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.remove_red_eye,
                                        color: AppColors.whiteColor),
                                    Text(
                                      "View Profile",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 1.5.h,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.verified_user,
                                        color: AppColors.whiteColor),
                                    Text(
                                      "View",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 1.5.h,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
