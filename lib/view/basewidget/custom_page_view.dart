import 'package:app/data/models/user.model.dart';
import 'package:app/helper/common_function.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/screens/profile/profile_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomPageView extends StatefulWidget {
  final data;
  const CustomPageView({super.key, required this.data});

  @override
  State<CustomPageView> createState() => _SearchResultState();
}

class _SearchResultState extends State<CustomPageView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

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
      body: widget.data.length == 0
          ? Center(
              child: Text(
              "Data Not Found!",
              style: TextStyle(
                fontSize: 2.h,
                color: AppColors.blackColor,
              ),
            ))
          : GestureDetector(
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
                itemCount: widget.data.length,
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 100.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.h, horizontal: 1.5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.blackColor.withOpacity(.6),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        ((widget.data[index]['image'] != ""
                                                ? widget.data[index]['image']
                                                : 'https://iidamidamerica.org/wp-content/uploads/2020/12/male-placeholder-image.jpeg') ??
                                            'https://iidamidamerica.org/wp-content/uploads/2020/12/male-placeholder-image.jpeg'),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${widget.data[index]['name']}",
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 2.h,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 35.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Age / Height",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  "Religion / Caste",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  "Mother Tongue",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  "Education",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  "Occupation",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  "Income",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  "Location",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  "Marital Status",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ":  ${widget.data[index]['age']} ${widget.data[index]['height']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  ": ${widget.data[index]['religion']} ${widget.data[index]['caste']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  ": ${widget.data[index]['mothertong']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  ": ${widget.data[index]['education']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  ": ${widget.data[index]['occupation']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  ": ${widget.data[index]['income']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  ": ${widget.data[index]['contactaddress']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 1.8.h,
                                                    color: AppColors.blackColor,
                                                  ),
                                                ),
                                                SizedBox(height: 1.h),
                                                Text(
                                                  ": ${widget.data[index]['maritalstatus']}",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          CommonFunctions.showSuccessToast(
                                              "Interest Sent Successfully..",
                                              context);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.thumb_up,
                                                color: AppColors.whiteColor),
                                            Text(
                                              "Express Interest",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 1.5.h,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          CommonFunctions.showSuccessToast(
                                              "Shortlisted Successfully..",
                                              context);
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.notes,
                                                color: AppColors.whiteColor),
                                            Text(
                                              "Shortlist",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 1.5.h,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileViewScreen(
                                              user: Users.fromJson(
                                                  widget.data[index]),
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.remove_red_eye,
                                                color: AppColors.whiteColor),
                                            Text(
                                              "View Profile",
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 1.5.h,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.verified_user,
                                              color: AppColors.whiteColor),
                                          Text(
                                            "View",
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
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
