import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropDown extends StatelessWidget {
  final String title;
  final String? hint;
  final List items;
  final dynamic value;
  final double? width;
  final Function(dynamic) onChanged;
  const CustomDropDown({
    Key? key,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.width,
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
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(
            width: width ?? 100.w,
            child: DropdownButton(
              hint: Text(hint ?? 'Any'),
              underline: Container(
                height: 1.5,
                color: AppColors.blackColor,
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
