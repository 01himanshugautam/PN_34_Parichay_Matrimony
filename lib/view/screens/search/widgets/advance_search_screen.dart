import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
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
                    onPressed: () {},
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
                      debugPrint("Hello");
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
                      debugPrint("Hello");
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
                      debugPrint("Hello");
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
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Manglik Status",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Religion",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Caste",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Mother Toungue",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Country",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "State",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "City",
                hint: "Select an option",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropDown(
                    title: "Max. Income",
                    items: const [1, 2],
                    value: _minAge,
                    width: 40.w,
                    onChanged: (value) {
                      debugPrint("Hello");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                  CustomDropDown(
                    title: "Min. Income",
                    items: const [1, 2],
                    value: _minAge,
                    width: 40.w,
                    onChanged: (value) {
                      debugPrint("Hello");
                      setState(() {
                        _minAge = value;
                      });
                    },
                  ),
                ],
              ),
              CustomDropDown(
                title: "Highest Education",
                hint: "Any",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Occupation",
                hint: "Any",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Diet",
                hint: "Any",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "Smoke",
                hint: "Any",
                items: const [1, 2],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
                  setState(() {
                    _minAge = value;
                  });
                },
              ),
              CustomDropDown(
                title: "HIV",
                hint: "Any",
                items: const ['Yes', 'No'],
                value: _minAge,
                onChanged: (value) {
                  debugPrint("Hello");
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
