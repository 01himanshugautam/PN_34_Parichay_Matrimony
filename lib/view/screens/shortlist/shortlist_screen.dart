import 'package:app/provider/match_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShortListScreen extends StatefulWidget {
  final String userId;

  const ShortListScreen({
    super.key,
    required this.userId,
  });

  @override
  State<ShortListScreen> createState() => _ShortListScreenState();
}

class _ShortListScreenState extends State<ShortListScreen> {
  List shortListedMe = [];
  List shortListed = [];

  int initialInterestReceivedPage = 1, initialInterestSentPage = 1;
  bool isInterestSentLoading = false, isInterestReceivedLoading = false;

  @override
  void initState() {
    super.initState();
    getShortListedMe(initialInterestSentPage);
    getShortListed(initialInterestSentPage);
  }

  getShortListedMe(int page) async {
    var response = await Provider.of<MatchProvider>(context, listen: false)
        .userShortlistedMe(widget.userId, page);
    setState(() {
      shortListed = response['data']['shortlistedbyme']['data'];
    });
  }

  getShortListed(int page) async {
    var response = await Provider.of<MatchProvider>(context, listen: false)
        .userShortlisted(widget.userId, page);
    setState(() {
      shortListedMe = response['data']['shortlistedme']['data'];
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
          title: const Text("ShortList"),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'ShortList Me'),
                Tab(text: 'ShortList'),
              ],
              labelColor: AppColors.basicColor,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  shortListed.isEmpty
                      ? const Center(child: Text("Data Not Found"))
                      : CustomPageView(data: shortListed),
                  shortListedMe.isEmpty
                      ? const Center(child: Text("Data Not Found!"))
                      : CustomPageView(data: shortListed),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
