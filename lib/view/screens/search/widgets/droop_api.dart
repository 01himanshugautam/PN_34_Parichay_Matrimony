import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropDownApi extends StatelessWidget {
  final String title;
  final String? hint;
  final List items;
  final dynamic value;
  final double? width;
  final Color? color;
  final bool id;
  final Function(dynamic) onChanged;
  const CustomDropDownApi({
    Key? key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.width,
    this.color,
    this.id = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 2.h,
              color: color ?? AppColors.greyColor,
            ),
          ),
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
                  value: id ? value['id'] : value['name'],
                  child: Text("${value['name']}"),
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
