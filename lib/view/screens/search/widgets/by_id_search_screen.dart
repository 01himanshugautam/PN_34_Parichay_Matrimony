import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:app/view/screens/search/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ByIdSearch extends StatefulWidget {
  const ByIdSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<ByIdSearch> createState() => _ByIdSearchState();
}

class _ByIdSearchState extends State<ByIdSearch> {
  final TextEditingController id = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 80.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                  controller: id,
                  hintText: 'Profile ID',
                  hintColor: AppColors.blackColor,
                  isPadding: false,
                  borderColor: AppColors.blackColor,
                ),
              ],
            ),
            CustomButton(
              width: 90.w,
              height: 6.h,
              text: 'Search',
              isLoading: isLoading,
              fontSize: 3.h,
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                var response =
                    await Provider.of<SearchProvider>(context, listen: false)
                        .filterById(id.text);
                setState(() {
                  isLoading = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResult(
                      data: response['profile'][0]['data'],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
