import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.select,
  }) : super(key: key);

  final int select;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 7.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: select == 1 ? AppColors.primaryColor : AppColors.whiteColor,
          ),
          alignment: Alignment.center,
          child: Text(
            "1",
            style: TextStyle(
              fontSize: 2.h,
              color: select == 1 ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ),
        Container(
          width: 15.h,
          height: 3,
          color: AppColors.whiteColor,
        ),
        Container(
          height: 5.h,
          width: 7.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: select == 2 ? AppColors.primaryColor : AppColors.whiteColor,
          ),
          alignment: Alignment.center,
          child: Text(
            "2",
            style: TextStyle(
              fontSize: 2.h,
              color: select == 2 ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ),
        Container(
          width: 15.h,
          height: 3,
          color: AppColors.whiteColor,
        ),
        Container(
          height: 5.h,
          width: 7.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: select == 3 ? AppColors.primaryColor : AppColors.whiteColor,
          ),
          alignment: Alignment.center,
          child: Text(
            "3",
            style: TextStyle(
              fontSize: 2.h,
              color: select == 3 ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
