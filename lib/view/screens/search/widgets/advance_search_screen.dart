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

class AdvanceSearch extends StatefulWidget {
  const AdvanceSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<AdvanceSearch> createState() => _AdvanceSearchState();
}

class _AdvanceSearchState extends State<AdvanceSearch> {
  String? minAge,
      maxAge,
      minHeight,
      maxHeight,
      marital,
      religion,
      manglik,
      caste,
      motherToungue,
      country,
      state,
      city,
      occupation,
      minIncome,
      maxIncome,
      eduction,
      diet,
      smoke,
      hiv,
      income,
      education,
      job;

  bool isMale = true;
  List countries = [
    {"id": "101", "name": "India"},
  ];
  List states = [
    {"id": "1", "name": "Andaman and Nicobar Islands"}
  ];
  List cities = [
    {"id": "1", "name": "Sed ea dolore offici"}
  ];
  List castes = [
    {"id": "251", "name": "Kudumbi", "status": "1"},
  ];
  List heights = [
    {"id": "1", "name": "4 feet", "value": "40", "name": "4 feet"},
  ];
  List religions = [
    {"id": "12", "name": "Hindu", "status": "1"},
  ];
  List languages = [
    {"id": "1", "name": "Hindi"},
  ];

  List educations = [
    {"id": 1, "name": "Aeronautical Engineering"},
  ];
  List occupations = [
    {"id": "1", "name": "Sed ea dolore offici"}
  ];

  List incomes = [
    {"id": "1", "name": "Rs 1 Lakh"},
  ];

  getEducation() async {
    var educations =
        await Provider.of<SearchProvider>(context, listen: false).education();
    log("educations $educations");
    setState(() {
      this.educations = educations['data'];
    });
  }

  getOccupation() async {
    var occupations =
        await Provider.of<SearchProvider>(context, listen: false).occupations();
    log("occupations $occupations");
    setState(() {
      this.occupations = occupations['data'];
    });
  }

  getIncome() async {
    var incomes =
        await Provider.of<SearchProvider>(context, listen: false).income();
    log("incomes $incomes");
    setState(() {
      this.incomes = incomes['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    getCountry();
    getCaste();
    getReligion();
    getLanguage();
    getHeight();
    getEducation();
    getOccupation();
    getIncome();
  }

  getCountry() async {
    var countries =
        await Provider.of<SearchProvider>(context, listen: false).country();

    setState(() {
      this.countries = countries['data'];
    });
    // log("countries ${this.countries}");
  }

  getCaste() async {
    var castes =
        await Provider.of<SearchProvider>(context, listen: false).caste();
    log("castes $castes");
    setState(() {
      this.castes = castes['data'];
    });
  }

  getReligion() async {
    var religions =
        await Provider.of<SearchProvider>(context, listen: false).caste();
    setState(() {
      this.religions = religions['data'];
    });
    log("religions ${this.religions}");
  }

  getHeight() async {
    var heights =
        await Provider.of<SearchProvider>(context, listen: false).height();
    setState(() {
      this.heights = heights['data'];
    });
    log("heights ${this.heights}");
  }

  getLanguage() async {
    var languages =
        await Provider.of<SearchProvider>(context, listen: false).languages();
    setState(() {
      this.languages = languages['data'];
    });
    log("languages ${this.languages}");
  }

  getState(String id) async {
    var states =
        await Provider.of<SearchProvider>(context, listen: false).state(id);
    log("States $states");
    setState(() {
      this.states = states['data'];
    });
  }

  getCity(String id) async {
    var cities =
        await Provider.of<SearchProvider>(context, listen: false).city(id);
    log("Cities $cities");
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
                        getState(value);
                        setState(() {
                          state = null;
                          country = value;
                        });
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
                    CustomDropDown(
                      title: "Manglik Status",
                      items: const [
                        "Manglik",
                        "Non-Manglik",
                        "Anshik-Manglik",
                        "Don't Know"
                      ],
                      value: manglik,
                      onChanged: (value) {
                        debugPrint("Hello");
                        setState(() {
                          manglik = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomDropDown(
                          title: "Max. Income",
                          items: incomes,
                          value: maxIncome,
                          width: 40.w,
                          onChanged: (value) {
                            debugPrint("Hello");
                            setState(() {
                              maxIncome = value;
                            });
                          },
                        ),
                        CustomDropDown(
                          title: "Min. Income",
                          items: List.from(incomes.reversed),
                          value: minIncome,
                          width: 40.w,
                          onChanged: (value) {
                            debugPrint("Hello");
                            setState(() {
                              minIncome = value;
                            });
                          },
                        ),
                      ],
                    ),
                    CustomDropDown(
                      title: "Highest Education",
                      items: educations,
                      value: eduction,
                      onChanged: (value) {
                        debugPrint("Hello");
                        setState(() {
                          eduction = value;
                        });
                      },
                    ),
                    CustomDropDown(
                      title: "Occupation",
                      items: occupations,
                      value: occupation,
                      onChanged: (value) {
                        debugPrint("Hello");
                        setState(() {
                          occupation = value;
                        });
                      },
                    ),
                    CustomDropDown(
                      title: "Diet",
                      items: const [
                        "Vegetarian",
                        "Non Veg",
                        "jain",
                        "Eggetarian"
                      ],
                      value: diet,
                      onChanged: (value) {
                        debugPrint("Hello");
                        setState(() {
                          diet = value;
                        });
                      },
                    ),
                    CustomDropDown(
                      title: "Smoke",
                      items: const ['Yes', 'No', 'Occasionally'],
                      value: smoke,
                      onChanged: (value) {
                        debugPrint("Hello");
                        setState(() {
                          smoke = value;
                        });
                      },
                    ),
                    CustomDropDown(
                      title: "HIV",
                      items: const ['Yes', 'No'],
                      value: hiv,
                      onChanged: (value) {
                        debugPrint("Hello");
                        setState(() {
                          hiv = value;
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
              var response =
                  await Provider.of<SearchProvider>(context, listen: false)
                      .filter();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResult(
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
