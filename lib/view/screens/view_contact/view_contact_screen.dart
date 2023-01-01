import 'package:app/provider/match_provider.dart';
import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewContactScreen extends StatefulWidget {
  final String userId;

  const ViewContactScreen({
    super.key,
    required this.userId,
  });

  @override
  State<ViewContactScreen> createState() => _ViewContactScreenState();
}

class _ViewContactScreenState extends State<ViewContactScreen> {
  List viewedContactMe = [];
  List viewedContact = [];

  int initialInterestReceivedPage = 1, initialInterestSentPage = 1;
  bool isInterestSentLoading = false, isInterestReceivedLoading = false;

  @override
  void initState() {
    super.initState();
    getViewedContactMe(initialInterestSentPage);
    getViewedContact(initialInterestSentPage);
  }

  getViewedContactMe(int page) async {
    setState(() {
      isInterestSentLoading = true;
    });
    var response = await Provider.of<MatchProvider>(context, listen: false)
        .userViewedContactMe(widget.userId, page);
    setState(() {
      viewedContact = response['data']['viewedmycontact']['data'];
      isInterestSentLoading = false;
    });
  }

  getViewedContact(int page) async {
    setState(() {
      isInterestReceivedLoading = true;
    });
    var response = await Provider.of<MatchProvider>(context, listen: false)
        .userViewedContact(widget.userId, page);
    setState(() {
      viewedContactMe = response['data']['contactiviewed']['data'];
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
          title: const Text('Viewed Contact'),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: const [
                Tab(text: 'Viewed My Contact'),
                Tab(text: 'Viewed Contact'),
              ],
              labelColor: AppColors.basicColor,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  viewedContact.isEmpty
                      ? const Center(child: Text("Data Not Found"))
                      : CustomPageView(
                          data: viewedContact,
                        ),
                  viewedContactMe.isEmpty
                      ? const Center(child: Text("Data Not Found!"))
                      : CustomPageView(
                          data: viewedContact,
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
