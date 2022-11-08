import 'package:app/utils/constants/colors_constant.dart';
import 'package:app/view/basewidget/tab_buttom_widget.dart';
import 'package:app/view/screens/membership_plan/widgets/membership_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({super.key});

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  bool gold = true, silver = false, platinum = false, parichay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.basicColor,
        centerTitle: true,
        title: const Text("Our Membership Plans"),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(Images.couples),
            //   fit: BoxFit.fill,
            //   opacity: 0.65,
            // ),
            ),
        padding: EdgeInsets.only(bottom: 3.h, left: 0.5.w, right: .5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TabButton(
                      isSelected: gold,
                      text: "Gold Plan",
                      onTap: () {
                        setState(() {
                          gold = true;
                          silver = false;
                          platinum = false;
                          parichay = false;
                        });
                      },
                    ),
                    TabButton(
                      isSelected: silver,
                      text: "Silver Plan",
                      onTap: () {
                        setState(() {
                          gold = false;
                          silver = true;
                          platinum = false;
                          parichay = false;
                        });
                      },
                    ),
                    TabButton(
                      isSelected: platinum,
                      text: "Platinum\nPlan",
                      onTap: () {
                        setState(() {
                          gold = false;
                          silver = false;
                          platinum = true;
                          parichay = false;
                        });
                      },
                    ),
                    TabButton(
                      isSelected: parichay,
                      text: "PARICHAY\nASSISTED",
                      onTap: () {
                        setState(() {
                          gold = false;
                          silver = false;
                          platinum = false;
                          parichay = true;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              child: gold
                  ? const MembershipCard(
                      plan: "Gold Plan",
                      member: 50,
                      month: 3,
                      price: 3500,
                    )
                  : silver
                      ? const MembershipCard(
                          plan: "Silver Plan",
                          member: 75,
                          month: 6,
                          price: 5000,
                        )
                      : platinum
                          ? const MembershipCard(
                              plan: "Platinum Plan",
                              member: 125,
                              month: 12,
                              price: 9999,
                            )
                          : const MembershipCard(
                              plan: "Parichay Assisted",
                              member: 50,
                              month: 3,
                              price: 8000,
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
