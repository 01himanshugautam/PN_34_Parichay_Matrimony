import 'package:flutter/material.dart';
import 'package:app/helper/common-function.dart';
import 'package:app/provider/auth.provider.dart';
import 'package:app/utils/constants/colors.constant.dart';
import 'package:app/view/basewidget/custom-button.widget.dart';
import 'package:app/view/basewidget/custom-text-field.widget.dart';
import 'package:app/view/screens/dashboard/dashboard.screen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: SizedBox(
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 2.h),
            CustomTextField(
              width: 90.w,
              controller: _username,
              hintText: 'Username *',
              hintColor: AppColors.appColor,
            ),
            CustomTextField(
              width: 90.w,
              controller: _password,
              hintText: 'Password *',
              backgroundColor: Colors.white,
              hintColor: AppColors.appColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  text: "forget password",
                  width: 30.w,
                ),
              ],
            ),
            SizedBox(height: 3.h),
            CustomButton(
              width: 90.w,
              height: 6.h,
              text: 'Login',
              fontSize: 3.h,
              color: AppColors.yellowColor,
              onPressed: () async {
                var response =
                    await Provider.of<AuthProvider>(context, listen: false)
                        .login(
                  _username.text,
                  _password.text,
                );
                if (response.data['status'] == 1) {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('is_login', true);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()));
                } else if (response.data['status'] == 0) {
                  CommonFunctions.showSuccessToast(response.data['msg']);
                }
                debugPrint("Login Response $response");
              },
            ),
          ],
        ),
      ),
    );
  }
}
