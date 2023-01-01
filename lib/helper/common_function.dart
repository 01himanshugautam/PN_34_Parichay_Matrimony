import 'package:app/utils/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CommonFunctions {
  static void showErrorDialog(
      String title, String message, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  static void showSuccessToast(String message, BuildContext context) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.TOP_RIGHT,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.grey,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
    MotionToast(
      position: MotionToastPosition.top,
      icon: Icons.done,
      primaryColor: AppColors.greenColor,
      title: Text(message),
      description: const Text(""),
      width: 300,
      height: 5.h,
    ).show(context);
  }

  static void showFailedToast(String message, BuildContext context) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.TOP_RIGHT,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.grey,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
    MotionToast(
      position: MotionToastPosition.top,
      icon: Icons.sms_failed,
      primaryColor: AppColors.primaryColor,
      title: Text(message),
      description: const Text(""),
      width: 300,
      height: 5.h,
    ).show(context);
  }

  convertHeight(String height) {
    var convertedHeight = height;
    var data = height.split('');
    if (height.length == 2) {
      convertedHeight = "${data[0]} feet ${data[1]} inches";
    }
    return convertedHeight;
  }
}
