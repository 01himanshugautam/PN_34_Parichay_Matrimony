import 'package:app/view/screens/dashboard/drawer.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/constants/colors_constant.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        // title: Text(
        //   "MENU",
        //   style: TextStyle(
        //     fontWeight: FontWeight.normal,
        //     fontSize: 2.h,
        //     color: AppColors.whiteColor,
        //   ),
        // ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      drawer: const HomeDrawer(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [],
          ),
        ],
      ),
    );
  }
}
