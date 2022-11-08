import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.isSelected,
    required this.text,
    required this.onTap,
    this.width,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final double? width;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: width ?? 23.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor3 : AppColors.primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 2.h,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
