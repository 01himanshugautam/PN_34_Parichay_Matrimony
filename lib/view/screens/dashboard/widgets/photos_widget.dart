// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:app/helper/common_function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/user_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhotosWidget extends StatefulWidget {
  const PhotosWidget({Key? key, required this.userId}) : super(key: key);
  final String userId;
  @override
  State<PhotosWidget> createState() => _PhotosWidgetState();
}

class _PhotosWidgetState extends State<PhotosWidget> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  List userImages = [];
  String active = '';

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
      var response = await Provider.of<AuthProvider>(context, listen: false)
          .imageUpload(widget.userId, imageFileList);
      log("Image Upload $response");
      CommonFunctions.showSuccessToast(response['message'], context);
      getUserImages();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUserImages();
  }

  getUserImages() async {
    var userImages = await Provider.of<UserProvider>(context, listen: false)
        .userImages(widget.userId);
    setState(() {
      this.userImages = userImages['data'];
    });
    log("User Images ${this.userImages}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: GridView.builder(
              itemCount: userImages.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        active = index.toString();
                      });
                    },
                    child: Column(
                      children: [
                        userImages.length > index
                            ? Stack(
                                children: [
                                  Image.network(
                                    userImages[index]['image'],
                                    fit: BoxFit.fill,
                                    height: 13.h,
                                    width: 30.w,
                                  ),
                                  active == index.toString()
                                      ? Positioned(
                                          bottom: 10,
                                          width: 30.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () async {
                                                  log("Set Profile");

                                                  var response = await Provider
                                                          .of<UserProvider>(
                                                              context,
                                                              listen: false)
                                                      .setProfileImage(
                                                          widget.userId,
                                                          userImages[index]
                                                              ['id']);
                                                  CommonFunctions
                                                      .showSuccessToast(
                                                          response['message'],
                                                          context);
                                                  getUserImages();

                                                  log("Response: $response");
                                                  // log(response);
                                                },
                                                child: Icon(
                                                  Icons.done,
                                                  color: AppColors.greenColor,
                                                  size: 4.h,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  log("Delete Photo");
                                                  var response = await Provider
                                                          .of<UserProvider>(
                                                              context,
                                                              listen: false)
                                                      .deleteImage(
                                                          userImages[index]
                                                              ['id']);
                                                  CommonFunctions.showSuccessToast(
                                                      "Photo detected successfully",
                                                      context);
                                                  getUserImages();
                                                  log("Response: $response");
                                                },
                                                child: Icon(
                                                  Icons.close,
                                                  color: AppColors.primaryColor,
                                                  size: 4.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                ],
                              )
                            : GestureDetector(
                                onTap: selectImages,
                                child: Icon(
                                  Icons.add_a_photo,
                                  size: 1.5.h * 1.5.w,
                                ),
                              ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
