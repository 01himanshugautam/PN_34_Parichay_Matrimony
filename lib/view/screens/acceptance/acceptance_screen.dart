import 'package:app/provider/match_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcceptanceScreen extends StatefulWidget {
  final String userId;

  const AcceptanceScreen({
    super.key,
    required this.userId,
  });

  @override
  State<AcceptanceScreen> createState() => _AcceptanceScreenState();
}

class _AcceptanceScreenState extends State<AcceptanceScreen> {
  List userAcceptedMe = [];
  List userAccepted = [];

  int initialInterestReceivedPage = 1, initialInterestSentPage = 1;
  bool isInterestSentLoading = false, isInterestReceivedLoading = false;

  @override
  void initState() {
    super.initState();
    getUserAccepted(initialInterestSentPage);
    getUserAcceptedMe(initialInterestSentPage);
  }

  getUserAccepted(int page) async {
    setState(() {
      isInterestSentLoading = true;
    });
    var response = await Provider.of<MatchProvider>(context, listen: false)
        .userAccepted(widget.userId, page);
    setState(() {
      userAccepted = response['data']['intrestiaccepted']['data'];
      isInterestSentLoading = false;
    });
  }

  getUserAcceptedMe(int page) async {
    setState(() {
      isInterestReceivedLoading = true;
    });
    var response = await Provider.of<MatchProvider>(context, listen: false)
        .userAcceptedMy(widget.userId, page);
    setState(() {
      userAcceptedMe = response['data']['myintrestaccepted']['data'];
      isInterestReceivedLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.basicColor,
          centerTitle: true,
          title: const Text('Acceptance'),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Accepted'),
                Tab(text: 'Acceptance Me'),
              ],
              labelColor: AppColors.basicColor,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  userAccepted.isEmpty
                      ? const Center(child: Text("Data Not Found"))
                      : CustomPageView(
                          data: userAccepted,
                        ),
                  userAcceptedMe.isEmpty
                      ? const Center(child: Text("Data Not Found!"))
                      : CustomPageView(
                          data: userAccepted,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
