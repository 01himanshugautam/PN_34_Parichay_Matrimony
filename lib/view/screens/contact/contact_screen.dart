import 'dart:async';

import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_map_iframe/google_map_iframe.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        title: const Text("Contact"),
      ),
      body: ListView(
        children: [
          Padding(
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
                Container(
                  height: 40.h,
                  width: 100.w,
                  alignment: Alignment.center,
                  child: GoogleMapIframe(
                    apiKey: 'AIzaSyAQnYinSuCc5pBRQxDsH2jeSWO5E7vcNto',
                  ).fromLatLng('10.305385', '77.923029'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
