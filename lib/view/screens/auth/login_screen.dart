import 'dart:convert';
import 'dart:developer';
import 'package:app/data/models/user.model.dart';
import 'package:app/helper/common-function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/auth/forget_password_screen.dart';
import 'package:app/view/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  login(email, password, context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FocusScope.of(context).unfocus();
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      var response = await Provider.of<AuthProvider>(context, listen: false)
          .login(_email.text, _password.text);
      log("response $response");
      if (response['success'] == true) {
        String user = jsonEncode(Users.fromJson(response['data']));
        prefs.setString('userData', user);
        prefs.setBool('is_login', true);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
      } else {
        CommonFunctions.showErrorDialog("Error", response['message'], context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.background2),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                CustomTextField(
                  width: 90.w,
                  controller: _email,
                  hintText: 'Email/Phone Number *',
                  hintColor: AppColors.whiteColor,
                ),
                CustomTextField(
                  width: 90.w,
                  controller: _password,
                  hintText: 'Password *',
                  hintColor: AppColors.whiteColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                        text: "Forget password",
                        width: 30.w,
                        height: 3.h,
                        textColor: AppColors.whiteColor,
                        isPadding: true,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen(),
                            ),
                          );
                        }),
                  ],
                ),
                SizedBox(height: 3.h),
                CustomButton(
                  width: 90.w,
                  height: 6.h,
                  text: 'Login',
                  fontSize: 3.h,
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () => login(_email, _password, context),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New to Parichay password?",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 2.h),
                ),
                CustomButton(
                  text: "Register now!",
                  width: 25.w,
                  height: 3.h,
                  textColor: AppColors.primaryColor,
                  isPadding: false,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
