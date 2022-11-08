import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        title: const Text("Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        child: Column(
          children: [
            Container(
              height: 50.h,
              width: 100.w,
              color: AppColors.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              child: Column(
                children: [
                  Text(
                    "Contact Form",
                    style: TextStyle(fontSize: 2.5.h),
                  ),
                  SizedBox(height: 1.h),
                  CustomTextField(
                    hintText: "Name",
                    width: 100.w,
                    hintColor: AppColors.whiteColor,
                  ),
                  CustomTextField(
                    hintText: "Email",
                    width: 100.w,
                    hintColor: AppColors.whiteColor,
                  ),
                  CustomTextField(
                    hintText: "Subject",
                    width: 100.w,
                    hintColor: AppColors.whiteColor,
                  ),
                  CustomTextField(
                    hintText: "Message",
                    width: 100.w,
                    hintColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: 4.h),
                  CustomButton(
                    text: "Submit",
                    color: AppColors.whiteColor.withOpacity(.4),
                    radius: 10,
                    width: 40.w,
                    height: 6.h,
                    fontSize: 2.5.h,
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "If you have questions or comments, please get a hold of us in whichever way is most convenient. Ask away there is no reasonable question that our team can not answer.",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 2.2.h,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              "Customer Care",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 2.h,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: .5.h),
            Text(
              "+91-8602 777 203 ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 2.h,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: .5.h),
            Text(
              "Whatsapp Help: +91-9009021760",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 2.h,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
