import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BasicSearch extends StatefulWidget {
  const BasicSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<BasicSearch> createState() => _BasicSearchState();
}

class _BasicSearchState extends State<BasicSearch> {
  int? _minAge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100.w,
          height: 70.h,
          child: ListView(
            children: [
              Row(
                children: [
                  Text(
                    "Search Profile For",
                    style: TextStyle(
                      fontSize: 2.2.h,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  CustomButton(
                    text: "Female",
                    color: AppColors.primaryColor,
                    textColor: AppColors.whiteColor,
                    height: 4.h,
                    radius: .5.h,
                    // onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDown(
                    title: "Max. Age",
                    items: const [1, 2],
                    value: _minAge,
                    width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Min. Age",
                    items: const [1, 2],
                    value: _minAge,
                    width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDown(
                    title: "Max. Height",
                    items: const [1, 2],
                    value: _minAge,
                    width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Min. Height",
                    items: const [1, 2],
                    value: _minAge,
                    width: 40.w,
                    onChanged: (value) {
                      debugPrint("Value $value");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                ],
              ),
              CustomDropDown(
                title: "Marital Status",
                items: const [1, 2],
                value: null,
                onChanged: (value) {
                  debugPrint("Value $value");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Religion",
                items: const [1, 2],
                value: null,
                onChanged: (value) {
                  debugPrint("Value $value");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Caste",
                items: const [1, 2],
                value: null,
                onChanged: (value) {
                  debugPrint("Value $value");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Mother Toungue",
                items: const [1, 2],
                value: null,
                onChanged: (value) {
                  debugPrint("Value $value");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Country",
                items: const [1, 2],
                value: null,
                onChanged: (value) {
                  debugPrint("Value $value");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "State",
                items: const [1, 2],
                value: null,
                onChanged: (value) {
                  debugPrint("Value $value");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "City",
                hint: "Select an option",
                items: const [1, 2],
                value: null,
                onChanged: (value) {
                  debugPrint("Value $value");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
