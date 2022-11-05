import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ByIdSearch extends StatefulWidget {
  const ByIdSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<ByIdSearch> createState() => _ByIdSearchState();
}

class _ByIdSearchState extends State<ByIdSearch> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Search By ID",
          style: TextStyle(
            fontSize: 2.h,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        CustomTextField(
          width: 90.w,
          controller: controller,
          hintText: 'Profile ID',
          hintColor: AppColors.whiteColor,
          isPadding: false,
        ),
      ],
    );
  }
}
