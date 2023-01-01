import 'dart:developer';

import 'package:app/provider/match_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMatchesScreen extends StatefulWidget {
  final String userId;
  const MyMatchesScreen({super.key, required this.userId});

  @override
  State<MyMatchesScreen> createState() => _MyMatchesScreenState();
}

class _MyMatchesScreenState extends State<MyMatchesScreen> {
  List matches = [];

  getMatches() async {
    var response = await Provider.of<MatchProvider>(context, listen: false)
        .userMatches('596');
    setState(() {
      matches = response['0']['profile'][0]['data'];
    });
    log(response);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("My Matches"),
      ),
      body: matches.isEmpty
          ? const Center(child: Text("Data Not Found"))
          : CustomPageView(
              data: matches,
            ),
    );
  }
}
