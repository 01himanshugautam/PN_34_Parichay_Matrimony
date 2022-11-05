import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BasicSearch extends StatelessWidget {
  const BasicSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Basic Search",
          style: TextStyle(
            fontSize: 2.h,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
