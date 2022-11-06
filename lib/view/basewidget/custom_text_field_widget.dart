import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final double? height;
  final double? width;
  final double? iconSize;
  final double? radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final bool? searchAble;
  final bool isPadding;
  final Icon? icon;
  const CustomTextField({
    Key? key,
    required,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.radius,
    this.height,
    this.width,
    this.backgroundColor,
    this.hintColor,
    this.borderColor,
    this.searchAble,
    this.iconSize,
    this.icon,
    this.isPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding
          ? const EdgeInsets.symmetric(vertical: 8.0)
          : const EdgeInsets.symmetric(vertical: 0),
      child: SizedBox(
        height: height ?? 5.5.h,
        width: width ?? 25.w,
        child: TextField(
          controller: controller,
          // expands: true,
          style: TextStyle(
            color: hintColor ?? AppColors.whiteColor,
            fontSize: 2.h,
          ),
          decoration: InputDecoration(
            prefixIcon: icon,
            // contentPadding: const EdgeInsets.only(left: 0, top: 0),
            filled: true,
            fillColor: backgroundColor ?? Colors.transparent,
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: 2.h,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor, width: 1.5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor, width: 1.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.blackColor, width: 1.5),
            ),
            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(radius ?? 100),
            //   borderSide: BorderSide(
            //     color: backgroundColor ?? AppColors.whiteColor,
            //   ),
            // ),
            // disabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(radius ?? 100),
            //   borderSide: BorderSide(
            //     color: backgroundColor ?? AppColors.backgroundColor2,
            //   ),
            // ),
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(radius ?? 100),
            //   borderSide: BorderSide(
            //     color: backgroundColor ?? AppColors.backgroundColor2,
            //   ),
            // ),
          ),
          onChanged: onChanged,
          onSubmitted: onSubmitted,
        ),
      ),
    );
  }
}
