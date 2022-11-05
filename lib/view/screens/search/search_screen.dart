import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/search/widgets/by_id_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/dashboard/dashboard_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _username = TextEditingController();

  bool basic = true, advance = false, byId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Search"),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.couples),
            fit: BoxFit.fill,
            opacity: 0.65,
          ),
        ),
        padding: EdgeInsets.only(bottom: 3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          basic = true;
                          advance = false;
                          byId = false;
                        });
                      },
                      child: Container(
                        height: 6.h,
                        width: 26.w,
                        decoration: BoxDecoration(
                          color: basic
                              ? AppColors.primaryColor3
                              : AppColors.primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Basic\nSearch",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 2.h,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          basic = false;
                          advance = true;
                          byId = false;
                        });
                      },
                      child: Container(
                        height: 6.h,
                        width: 26.w,
                        decoration: BoxDecoration(
                          color: advance
                              ? AppColors.primaryColor3
                              : AppColors.primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Advance\nSearch",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 2.h,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          basic = false;
                          advance = false;
                          byId = true;
                        });
                      },
                      child: Container(
                        height: 6.h,
                        width: 26.w,
                        decoration: BoxDecoration(
                          color: byId
                              ? AppColors.primaryColor3
                              : AppColors.primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Search By\nProfile Id",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 2.h,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 2.h),
                  child: SearchById(
                    controller: _username,
                  ),
                ),
              ],
            ),
            CustomButton(
              width: 90.w,
              height: 6.h,
              text: 'Search',
              fontSize: 3.h,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
