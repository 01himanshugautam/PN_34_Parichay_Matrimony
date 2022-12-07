import 'dart:developer';

import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropDown extends StatelessWidget {
  final String? title;
  final String? hint;
  final List items;
  final dynamic value;
  final double? width;
  final bool isPadding;
  final Color? color;
  final Function(dynamic)? onChanged;
  const CustomDropDown({
    Key? key,
    this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.width,
    this.color,
    this.isPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("message $items");
    return Padding(
      padding: isPadding
          ? const EdgeInsets.only(bottom: 8.0)
          : const EdgeInsets.only(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 2.h,
                    color: color ?? AppColors.greyColor,
                  ),
                )
              : Container(),
          SizedBox(
            width: width ?? 100.w,
            child: DropdownButton(
              dropdownColor: AppColors.primaryColor3,
              hint: Text(hint ?? 'Any',
                  style: TextStyle(
                    fontSize: 2.h,
                    color: color ?? AppColors.greyColor,
                  )),
              style: TextStyle(
                fontSize: 2.h,
                color: color ?? AppColors.greyColor,
              ),
              underline: Container(
                height: 1.5,
                color: color ?? AppColors.blackColor,
              ),
              isExpanded: true,
              value: value,
              items: items.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text("$value"),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
