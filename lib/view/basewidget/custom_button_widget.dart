import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final bool? fontWeight;
  final bool isPadding;
  final bool enableBoxShadow;
  final Function()? onPressed;

  const CustomButton(
      {Key? key,
      required this.text,
      this.width,
      this.height,
      this.color,
      this.textColor,
      this.onPressed,
      this.radius,
      this.fontWeight,
      this.isPadding = true,
      this.enableBoxShadow = false,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: isPadding
            ? EdgeInsets.symmetric(vertical: .5.h, horizontal: 2.w)
            : const EdgeInsets.all(0),
        child: Container(
          height: height ?? 5.h,
          width: width ?? 20.w,
          decoration: BoxDecoration(
              color: color ?? Colors.transparent,
              borderRadius: BorderRadius.circular(radius ?? 0),
              boxShadow: [
                BoxShadow(
                  color: enableBoxShadow
                      ? AppColors.blackColor.withOpacity(.7)
                      : AppColors.whiteColor,
                  blurRadius: enableBoxShadow ? 20.0 : 0,
                ),
              ]),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textColor ?? Colors.black.withOpacity(.7),
                  fontSize: fontSize ?? 2.h,
                  fontWeight:
                      fontWeight == true ? FontWeight.w500 : FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
