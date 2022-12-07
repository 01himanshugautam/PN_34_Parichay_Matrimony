// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/screens/search/search_result.dart';
import 'package:app/view/screens/search/widgets/custom_dropdown.dart';
import 'package:app/view/screens/search/widgets/droop_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BasicSearch extends StatefulWidget {
  const BasicSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<BasicSearch> createState() => _BasicSearchState();
}

class _BasicSearchState extends State<BasicSearch> {
  String? minAge,
      maxAge,
      minHeight,
      maxHeight,
      marital,
      religion,
      caste,
      motherToungue,
      country,
      state,
      city;
  bool isMale = true;

  List countries = [
    {"id": "101", "name": ""},
  ];
  List states = [
    {"id": "1", "name": ""}
  ];
  List cities = [
    {"id": "1", "name": ""}
  ];
  List castes = [
    {"id": "251", "name": "", "status": "1"},
  ];
  List heights = [
    {"id": "1", "name": "", "value": "40"},
  ];
  List religions = [
    {"id": "12", "name": "", "status": "1"},
  ];
  List languages = [
    {"id": "1", "name": ""},
  ];

  @override
  void initState() {
    super.initState();
    getCountry();
    getCaste();
    getReligion();
    getLanguage();
    getHeight();
  }

  getCountry() async {
    var countries =
        await Provider.of<SearchProvider>(context, listen: false).country();

    setState(() {
      this.countries = countries['data'];
    });
    log("countries ${this.countries}");
  }

  getCaste() async {
    var castes =
        await Provider.of<SearchProvider>(context, listen: false).caste();
    // log("castes $castes");
    setState(() {
      this.castes = castes['data'];
    });
  }

  getReligion() async {
    var religions =
        await Provider.of<SearchProvider>(context, listen: false).religion();
    setState(() {
      this.religions = religions['data'];
    });
    // log("religions ${this.religions}");
  }

  getHeight() async {
    var heights =
        await Provider.of<SearchProvider>(context, listen: false).height();
    setState(() {
      this.heights = heights['data'];
    });
    // log("heights ${this.heights}");
  }

  getLanguage() async {
    var languages =
        await Provider.of<SearchProvider>(context, listen: false).languages();
    setState(() {
      this.languages = languages['data'];
    });
    // log("languages ${this.languages}");
  }

  getState(String id) async {
    var states =
        await Provider.of<SearchProvider>(context, listen: false).state(id);
    // log("States $states");
    setState(() {
      this.states = states['data'];
    });
  }

  getCity(String id) async {
    var cities =
        await Provider.of<SearchProvider>(context, listen: false).city(id);
    // log("Cities $cities");
    setState(() {
      this.cities = cities['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                          text: isMale ? "Male" : "Female",
                          color: AppColors.primaryColor,
                          textColor: AppColors.whiteColor,
                          height: 4.h,
                          radius: .5.h,
                          onPressed: () {
                            setState(() {
                              isMale = !isMale;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropDown(
                          title: "Min. Age ",
                          items: [for (var i = 18; i <= 80; i++) "$i"],
                          value: minAge,
                          width: 40.w,
                          onChanged: (value) {
                            debugPrint("Value $value");
                            setState(() {
                              minAge = '$value';
                            });
                          },
                        ),
                        CustomDropDown(
                          title: "Max. Age ",
                          items: [for (var i = 70; i >= 18; --i) "$i"],
                          value: maxAge,
                          width: 40.w,
                          color: AppColors.greyColor,
                          onChanged: (value) {
                            debugPrint("Value $value");
                            setState(() {
                              maxAge = "$value";
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropDownApi(
                          title: "Min. Height",
                          items: heights,
                          value: minHeight,
                          width: 40.w,
                          onChanged: (value) {
                            debugPrint("Value $value");
                            setState(() {
                              minHeight = value;
                            });
                          },
                        ),
                        CustomDropDownApi(
                          title: "Max. Height",
                          items: List.from(heights.reversed),
                          value: maxHeight,
                          width: 40.w,
                          onChanged: (value) {
                            debugPrint("Value $value");
                            setState(() {
                              maxHeight = value;
                            });
                          },
                        ),
                      ],
                    ),
                    CustomDropDown(
                      title: "Marital Status",
                      items: const [
                        "Never Married",
                        "Awaiting Divorce",
                        "Divorced",
                        "Widowed",
                        "Annulled"
                      ],
                      value: marital,
                      onChanged: (value) {
                        debugPrint("Value $value");
                        setState(() {
                          marital = '$value';
                        });
                      },
                    ),
                    CustomDropDownApi(
                      title: "Religion",
                      items: religions,
                      value: religion,
                      onChanged: (value) {
                        debugPrint("Value $value");
                        setState(() {
                          religion = value;
                        });
                      },
                    ),
                    CustomDropDownApi(
                      title: "Caste",
                      items: castes,
                      value: caste,
                      onChanged: (value) {
                        debugPrint("Value $value");
                        setState(() {
                          caste = value;
                        });
                      },
                    ),
                    CustomDropDownApi(
                      title: "Mother Toungue",
                      items: languages,
                      value: motherToungue,
                      onChanged: (value) {
                        debugPrint("Value $value");
                        setState(() {
                          motherToungue = value;
                        });
                      },
                    ),
                    CustomDropDownApi(
                      title: "Country ",
                      id: true,
                      items: countries,
                      value: country,
                      onChanged: (value) {
                        debugPrint("Value $value");

                        setState(() {
                          state = null;
                          country = value;
                        });
                        getState(value);
                      },
                    ),
                    CustomDropDownApi(
                      title: "State",
                      items: states,
                      value: state,
                      id: true,
                      onChanged: (value) {
                        debugPrint("Value $value");

                        setState(() {
                          city = null;
                          state = value;
                        });
                        getCity(value);
                      },
                    ),
                    CustomDropDownApi(
                      title: "City",
                      hint: "Select an option",
                      items: cities,
                      value: city,
                      id: true,
                      onChanged: (value) {
                        debugPrint("Value $value");
                        setState(() {
                          city = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          CustomButton(
            width: 90.w,
            height: 6.h,
            text: 'Search',
            fontSize: 3.h,
            color: AppColors.primaryColor,
            textColor: AppColors.whiteColor,
            onPressed: () async {
              var data = {
                'lookingfor': isMale ? "male" : "female",
                'minage': minAge ?? '',
                'maxage': maxAge ?? '',
                'min_height': minHeight ?? '',
                'max_height': maxHeight ?? '',
                'religion': religion ?? "",
                'cast[]': caste ?? '',
                'language[]': motherToungue ?? '',
                'city[]': city ?? '',
                'country[]': motherToungue ?? '',
                'religionstate[]': state ?? '',
              };
              // log("Data $data");
              var response =
                  await Provider.of<SearchProvider>(context, listen: false)
                      .filter(data);
              debugPrint("Response ${response['success'][0][0]}");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResult(
                    title: "Search",
                    data: response['success'][0]['data'],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
