import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MembershipCard extends StatelessWidget {
  const MembershipCard({
    Key? key,
    required this.plan,
    required this.price,
    required this.month,
    required this.member,
  }) : super(key: key);

  final String plan;
  final int price;
  final int month;
  final int member;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 90.w,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(.8.h * .8.w)),
      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
      child: Column(
        children: [
          Container(
            height: 7.h,
            width: 60.w,
            decoration: BoxDecoration(
                color: AppColors.whiteColor.withOpacity(.3),
                border: Border.all(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(2.h)),
            alignment: Alignment.center,
            child: Text(
              plan,
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 2.6.h,
                color: AppColors.blackColor,
              ),
            ),
          ),
          SizedBox(height: 2.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\u{20B9}$price",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 4.h,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                "/${month}MON",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 2.5.h,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            "Send Unlimited Personalized\nMessages *",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 2.h,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 2.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "View mobile numbers of ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 2.h,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "$member MEMBERS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 2.h,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              Text(
                "to contact them directly",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 2.h,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            "Profile tagged as 'Diamond'\nMember for better prominence",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 2.h,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "Chat with Prospects\nDirectly",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 2.h,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "View Unlimited Horoscopes",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 2.h,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 6.h),
          CustomButton(
            text: "GET NOW",
            color: AppColors.whiteColor,
            fontSize: 2.5.h,
            radius: 10.h,
            height: 6.h,
            width: 40.w,
          )
        ],
      ),
    );
  }
}
