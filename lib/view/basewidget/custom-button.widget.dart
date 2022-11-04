import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors.constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final Color? color;
  final Function()? onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    this.width,
    this.height,
    this.color,
    this.onPressed,
    this.radius,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: .5.h, horizontal: 2.w),
        child: Container(
          height: height ?? 5.h,
          width: width ?? 20.w,
          decoration: BoxDecoration(
            color: color ?? AppColors.whiteColor,
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black.withOpacity(.7),
                  fontSize: fontSize ?? 2.h,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
