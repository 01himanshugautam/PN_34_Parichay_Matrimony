import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/contact/contact_screen.dart';
import 'package:app/view/screens/dashboard/widgets/custom_list_tile_widget.dart';
import 'package:app/view/screens/membership_plan/membership_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 20.h,
          width: 70.w,
          padding: EdgeInsets.only(top: 3.h, left: 5.w),
          color: AppColors.primaryColor,
          child: Row(
            children: [
              CircleAvatar(
                radius: 5.h,
                backgroundColor: AppColors.basicColor,
              ),
              SizedBox(width: 4.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 45.w,
                    child: Text(
                      'PM6277',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 3.h,
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
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 1.8.h,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.edit,
                        color: AppColors.whiteColor,
                        size: 2.h,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomListTile(
          title: 'Home',
          image: Images.home,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Search',
          image: Images.search,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Advance Search',
          image: Images.advanceSearch,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Search by Profile ID',
          image: Images.idSearch,
          onTap: () {},
        ),
        CustomListTile(
          title: 'My Matches',
          image: Images.matches,
          onTap: () {},
          trailing: true,
        ),
        CustomListTile(
          title: 'Shortlisted',
          image: Images.star,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Profile Visitors',
          image: Images.view,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Success Stories',
          image: Images.success,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Inbox',
          image: Images.inbox,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Settings',
          image: Images.settings,
          onTap: () {},
        ),
        CustomListTile(
          title: 'Help & Support',
          image: Images.help,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ContactScreen())),
        ),
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
                  text: 'UPGRADE PLANS',
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  width: 60.w,
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const MembershipScreen())),
                      ))
            ],
          ),
        ),
      ],
    ));
  }
}
