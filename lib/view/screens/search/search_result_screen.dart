import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/custom_page_view.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  final List data;
  const SearchResult({super.key, required this.data});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Search"),
      ),
      body: Center(child: CustomPageView(data: widget.data)),
    );
  }
}
