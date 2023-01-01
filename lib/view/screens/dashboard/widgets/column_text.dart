import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ColumnText extends StatelessWidget {
  ColumnText({
    Key? key,
    required this.text,
    required this.value,
    this.onChanged,
    this.controller,
    this.edit = false,
    this.dropDown = false,
    this.api = false,
    this.id = false,
    this.items = const [],
  }) : super(key: key);

  final String text;
  final dynamic value;
  final bool edit, dropDown, api, id;
  final Function(dynamic)? onChanged;
  final List items;
  TextEditingController? controller = TextEditingController();
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
        edit
            ? (!dropDown
                ? SizedBox(
                    height: 3.h,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 1.6.h,
                        color: AppColors.blackColor.withOpacity(.8),
                      ),
                      controller: controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                : CustomDropDown(
                    items: items,
                    value: controller!.text != 'null'
                        ? controller!.text
                        : api
                            ? items[0]['name']
                            : items[0],
                    color: AppColors.blackColor,
                    onChanged: onChanged,
                    api: api,
                    id: id,
                    isPadding: false,
                  ))
            : Text(
                value != 'null' ? value : "Not Filled ",
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
