import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchById extends StatelessWidget {
  final TextEditingController controller;
  const SearchById({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Search By ID",
          style: TextStyle(
            fontSize: 2.h,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        CustomTextField(
          width: 90.w,
          controller: controller,
          hintText: 'Profile ID',
          hintColor: AppColors.whiteColor,
          isPadding: false,
        ),
      ],
    );
  }
}
