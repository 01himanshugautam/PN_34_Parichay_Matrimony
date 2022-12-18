import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.image,
    required this.title,
    required this.leftChildren,
    required this.rightChildren,
    this.isEdit = false,
    this.onEdit,
  }) : super(key: key);

  final String image;
  final String title;
  final bool isEdit;
  final List<Widget> leftChildren;
  final List<Widget> rightChildren;
  final Function()? onEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyColor.withOpacity(.6),
              blurRadius: 10,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        image,
                        height: 4.h,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 2.5.h,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: onEdit,
                    child: Icon(
                      isEdit ? Icons.done : Icons.edit,
                      color: AppColors.blackColor,
                      size: 3.5.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 43.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: leftChildren,
                    ),
                  ),
                  SizedBox(
                    width: 43.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rightChildren,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
