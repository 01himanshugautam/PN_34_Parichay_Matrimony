import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ColumnText extends StatelessWidget {
  const ColumnText({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 1.8.h,
            color: AppColors.blackColor,
          ),
        ),
        Text(
          value != 'null' ? value : "Not Filled",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 1.6.h,
            color: value != 'null'
                ? AppColors.blackColor.withOpacity(.8)
                : AppColors.primaryColor.withOpacity(.8),
          ),
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
