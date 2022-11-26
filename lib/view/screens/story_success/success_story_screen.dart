import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/utils/constants/images_constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SuccessStoryScreen extends StatefulWidget {
  final data;
  const SuccessStoryScreen({
    super.key,
    required this.data,
  });

  @override
  State<SuccessStoryScreen> createState() => _SuccessStoryScreenState();
}

class _SuccessStoryScreenState extends State<SuccessStoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Our Success Stories"),
        elevation: 0,
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
        child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 80.h,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: .96,
              enableInfiniteScroll: true,
            ),
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor.withOpacity(.1),
                      border: Border.all(
                          color: AppColors.primaryColor.withOpacity(.7)),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                // color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://parichaymatrimony.com/uploads/stories/${widget.data[index]['image']}'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                border: Border.all(
                                  color: AppColors.whiteColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            SizedBox(width: 2.h),
                            Flexible(
                              child: Text(
                                "${widget.data[index]['name']}",
                                maxLines: 1,
                                // softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 2.3.h,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Flexible(
                          child: Text(
                            "${widget.data[index]['message']}",
                            style: TextStyle(
                              fontSize: 2.h,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
