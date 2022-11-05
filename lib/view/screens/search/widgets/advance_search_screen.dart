import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdvanceSearch extends StatefulWidget {
  const AdvanceSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<AdvanceSearch> createState() => _AdvanceSearchState();
}

class _AdvanceSearchState extends State<AdvanceSearch> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Advance Search",
          style: TextStyle(
            fontSize: 2.h,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
