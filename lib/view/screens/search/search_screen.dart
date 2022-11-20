import 'package:app/view/basewidget/tab_buttom_widget.dart';
import 'package:app/view/screens/search/widgets/advance_search_screen.dart';
import 'package:app/view/screens/search/widgets/basic_search_screen.dart';
import 'package:app/view/screens/search/widgets/by_id_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
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
        // height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(Images.couples),
            //   fit: BoxFit.fill,
            //   opacity: 0.65,
            // ),
            ),
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabButton(
                  isSelected: basic,
                  text: "Basic\nSearch",
                  width: 30.w,
                  onTap: () {
                    setState(() {
                      basic = true;
                      advance = false;
                      byId = false;
                    });
                  },
                ),
                TabButton(
                  isSelected: advance,
                  text: "Advance\nSearch",
                  width: 30.w,
                  onTap: () {
                    setState(() {
                      basic = false;
                      advance = true;
                      byId = false;
                    });
                  },
                ),
                TabButton(
                  isSelected: byId,
                  text: "Search By\nProfile Id",
                  width: 30.w,
                  onTap: () {
                    setState(() {
                      basic = false;
                      advance = false;
                      byId = true;
                    });
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: basic
                  ? const BasicSearch()
                  : advance
                      ? const AdvanceSearch()
                      : const ByIdSearch(),
            ),
          ],
        ),
      ),
    );
  }
}
