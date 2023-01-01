import 'package:app/provider/user_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InterestScreen extends StatefulWidget {
  final String userId;

  const InterestScreen({
    super.key,
    required this.userId,
  });

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List interestReceived = [];
  List interestSent = [];

  int initialInterestReceivedPage = 1, initialInterestSentPage = 1;
  bool isInterestSentLoading = false, isInterestReceivedLoading = false;

  @override
  void initState() {
    super.initState();
    getInterestSent(initialInterestSentPage);
    getInterestReceived(initialInterestSentPage);
  }

  getInterestSent(int page) async {
    setState(() {
      isInterestSentLoading = true;
    });
    var response = await Provider.of<UserProvider>(context, listen: false)
        .userInterestedSent(widget.userId, page);
    setState(() {
      interestSent = response['data']['intrestsent']['data'];
      isInterestSentLoading = false;
    });
  }

  getInterestReceived(int page) async {
    setState(() {
      isInterestReceivedLoading = true;
    });
    var response = await Provider.of<UserProvider>(context, listen: false)
        .userInterestedReceived(widget.userId, page);
    setState(() {
      interestReceived = response['data']['intrestrecived']['data'];
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
          title: const Text("Interest"),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Interest Received'),
                Tab(text: 'Interest Sent'),
              ],
              labelColor: AppColors.basicColor,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  interestSent.isEmpty
                      ? const Center(child: Text("Data Not Found"))
                      : CustomPageView(
                          data: interestSent,
                        ),
                  interestReceived.isEmpty
                      ? const Center(child: Text("Data Not Found!"))
                      : CustomPageView(
                          data: interestSent,
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
