import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final double? height;
  final double? width;
  final double? iconSize;
  final double? radius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final bool? searchAble;
  final bool isPadding;
  final bool readOnly;
  final Icon? icon;
  CustomTextField({
    Key? key,
    required,
    required this.hintText,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
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
    this.readOnly = false,
  }) : super(key: key);
  FocusNode gfgFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    gfgFocusNode.requestFocus();
    return Padding(
      padding: isPadding
          ? const EdgeInsets.symmetric(vertical: 8.0)
          : const EdgeInsets.symmetric(vertical: 0),
      child: SizedBox(
        height: height ?? 5.5.h,
        width: width ?? 25.w,
        child: TextField(
          controller: controller,
          // focusNode: gfgFocusNode,
          autofocus: true,
          readOnly: readOnly,

          // expands: true,
          style: TextStyle(
            color: hintColor ?? AppColors.whiteColor,
            fontSize: 2.h,
          ),
          decoration: InputDecoration(
            prefixIcon: icon,
            contentPadding: const EdgeInsets.only(left: 10),
            filled: true,
            fillColor: backgroundColor ?? Colors.transparent,
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: 2.h,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.whiteColor, width: 1.5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.whiteColor, width: 1.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor ?? AppColors.whiteColor, width: 1.5),
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
          // onSubmitted: onSubmitted,
          onTap: onTap,
        ),
      ),
    );
  }
}
