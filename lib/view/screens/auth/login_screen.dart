import 'dart:convert';
import 'dart:developer';
import 'package:app/data/models/user.model.dart';
import 'package:app/helper/common_function.dart';
import 'package:app/provider/auth_provider.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/auth/forget_password_screen.dart';
import 'package:app/view/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_button_widget.dart';
import 'package:app/view/basewidget/custom_text_field_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  login(email, password, context) async {
    Vibration.vibrate(duration: 1, amplitude: 100);
    if (dotenv.env['APP_ENV'] == "development") {
      log("development");
      _email.text = dotenv.env['TEST_USER_NAME'].toString();
      _password.text = dotenv.env['TEST_PASSWORD'].toString();
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      var response = await Provider.of<AuthProvider>(context, listen: false)
          .login(_email.text, _password.text);
      FocusScope.of(context).unfocus();
      log("User Data $response");
      if (response['success'] == true) {
        setState(() {
          isLoading = false;
        });

        String user = jsonEncode(Users.fromJson(response['data']));
        prefs.setString('userData', user);
        prefs.setBool('is_login', true);
        Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
      } else {
        setState(() {
          isLoading = false;
        });
        CommonFunctions.showErrorDialog("Error", response['message'], context);
      }
    } else {
      CommonFunctions.showErrorDialog(
          "Error", "All fields are mandatory", context);
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
        padding: const EdgeInsets.only(bottom: 30),
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
                SizedBox(
                  child: CustomButton(
                    width: 90.w,
                    height: 6.h,
                    text: 'Login',
                    fontSize: 3.h,
                    isLoading: isLoading,
                    color: AppColors.primaryColor,
                    textColor: AppColors.whiteColor,
                    onPressed: () => login(_email, _password, context),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New to Parichay password?",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 2.h,
                      color: AppColors.whiteColor),
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
