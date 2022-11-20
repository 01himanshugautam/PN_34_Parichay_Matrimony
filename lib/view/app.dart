import 'package:app/provider/auth_provider.dart';
import 'package:app/provider/search_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/screens/auth/auth_screen.dart';
import 'package:app/view/screens/auth/login_screen.dart';
import 'package:app/view/screens/auth/sign_up_screen.dart';
import 'package:app/view/screens/dashboard/dashboard_screen.dart';
import 'package:app/view/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool? isLogin;
  login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLogin = prefs.getBool('is_login');
    setState(() {
      this.isLogin = isLogin;
    });
  }

  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => AuthProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => SearchProvider(),
            ),
          ],
          child: MaterialApp(
            title: 'app',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              unselectedWidgetColor: AppColors.whiteColor,
            ),
            home:
                isLogin == true ? const DashboardScreen() : const AuthScreen(),
            routes: {
              "/home": (context) => const DashboardScreen(),
              "/login": (context) => LoginScreen(),
              "/signUp": (context) => const SignUpScreen(),
              "/search": (context) => const SearchScreen(),
            },
          ),
        );
      },
    );
  }
}
