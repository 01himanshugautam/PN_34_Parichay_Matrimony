// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:app/data/models/user.model.dart';
import 'package:app/provider/success_story_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/acceptance/acceptance_screen.dart';
import 'package:app/view/screens/contact/contact_screen.dart';
import 'package:app/view/screens/dashboard/widgets/custom_list_tile_widget.dart';
import 'package:app/view/screens/interest/interest_screen.dart';
import 'package:app/view/screens/membership_plan/membership_plan_screen.dart';
import 'package:app/view/screens/my_matches/my_matches_screen.dart';
import 'package:app/view/screens/plan/active_plan_screen.dart';
import 'package:app/view/screens/search/search_screen.dart';
import 'package:app/view/screens/settings/settings_screen.dart';
import 'package:app/view/screens/shortlist/shortlist_screen.dart';
import 'package:app/view/screens/story_success/success_story_screen.dart';
import 'package:app/view/screens/view_contact/view_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  Users user = Users();
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString('userData')!);
    setState(() {
      user = Users.fromJson(json);
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 20.h,
          padding: EdgeInsets.only(top: 3.h, left: 5.w),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            // image: DecorationImage(
            //   image: NetworkImage(user.image.toString()),
            //   fit: BoxFit.fill,
            //   opacity: .3,
            // ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 5.h,
                backgroundColor: AppColors.basicColor,
                backgroundImage: NetworkImage(user.image.toString()),
              ),
              SizedBox(width: 4.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 45.w,
                    child: Text(
                      "${user.name}",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 2.5.h,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${user.email}",
                        style: TextStyle(
                          fontSize: 1.8.h,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      // SizedBox(width: 2.w),
                      // Icon(
                      //   Icons.edit,
                      //   color: AppColors.whiteColor,
                      //   size: 2.h,
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // CustomListTile(
        //   title: 'Home',
        //   image: Images.home,
        //   onTap: () {},
        // ),
        CustomListTile(
          title: 'Search',
          image: Images.search,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          ),
        ),
        CustomListTile(
          title: 'My Matches',
          image: Images.matches,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyMatchesScreen(
                  userId: user.id.toString(),
                ),
              ),
            );
          },
          // trailing: true,
        ),
        CustomListTile(
          title: 'Shortlist',
          image: Images.star,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShortListScreen(
                  userId: user.id.toString(),
                ),
              ),
            );
          },
        ),
        CustomListTile(
          title: 'Interested',
          image: Images.view,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InterestScreen(
                  userId: user.id.toString(),
                ),
              ),
            );
          },
        ),
        CustomListTile(
          title: 'Acceptance',
          image: Images.view,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AcceptanceScreen(
                  userId: user.id.toString(),
                ),
              ),
            );
          },
        ),
        CustomListTile(
          title: 'Contact Viewed',
          image: Images.view,
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewContactScreen(
                  userId: user.id.toString(),
                ),
              ),
            );
          },
        ),
        CustomListTile(
          title: 'Success Stories',
          image: Images.success,
          onTap: () async {
            var response =
                await Provider.of<SuccessProvider>(context, listen: false)
                    .successStory();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SuccessStoryScreen(data: response['data']),
              ),
            );
          },
        ),
        CustomListTile(
          title: 'Active Plan',
          image: Images.plan,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => ActivePlanScreen(
                    userId: user.id.toString(),
                  )),
            ),
          ),
        ),
        CustomListTile(
          title: 'Settings',
          image: Images.settings,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingScreen()),
          ),
        ),

        CustomListTile(
          title: 'Upgrade Plan',
          image: Images.premium,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const MembershipScreen()),
            ),
          ),
        ),
        CustomListTile(
          title: 'Help & Support',
          image: Images.help,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactScreen()),
          ),
        ),
        CustomListTile(
          title: 'Logout',
          image: Images.logout,
          onTap: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            prefs.remove('userData');
            prefs.remove('is_login');
            Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false);
          },
        ),
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          child: Column(
            children: [
              Container(
                height: 2,
                color: AppColors.greyColor,
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Flat 70% OFF Till 24 Oct!',
                    style: TextStyle(fontSize: 2.h),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              CustomButton(
                text: 'Help Us : 8602777203',
                color: AppColors.primaryColor,
                textColor: AppColors.whiteColor,
                width: 60.w,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
