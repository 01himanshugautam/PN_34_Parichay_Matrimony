import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String image;
  final bool isLoading;
  final bool trailing;
  final Function() onTap;
  const CustomListTile({
    Key? key,
    required this.title,
    required this.image,
    this.trailing = false,
    this.isLoading = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 3.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image.asset(
                //   image,
                //   height: 3.h,
                //   // width: 2.h,
                //   fit: BoxFit.fill,
                // ),
                SizedBox(width: 4.w),
                Text(
                  title,
                  style: TextStyle(fontSize: 2.h),
                ),
              ],
            ),
            isLoading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ],
                  )
                : trailing
                    ? Icon(
                        Icons.add,
                        color: AppColors.blackColor,
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
