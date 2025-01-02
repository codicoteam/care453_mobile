import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../widgets/customer_animation/fade_in_slide.dart';
import '../care plan/care_plan.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallete.greyBackground,
        child: Column(
          children: [
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile icon with circular border
                  Container(
                    width: 200,
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Pallete.lightPrimaryTextColor,
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(8), // Add border radius
                            border: Border.all(
                              color: Pallete.lightPrimaryTextColor,
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Section title
                        Text(
                          "Back",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Pallete.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Alerts section with message and button
            Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Scheduled Medication Today',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Text(
                'Follow Instructions. All deviations should be documented.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: BounceFromRightAnimation(
                    delay: 3.5,
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'Morning',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: ScheduleScreen()));
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  BounceFromRightAnimation(
                                    delay: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pill.png",
                                                    height: 25,
                                                    width: 25,
                                                    color: Pallete.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Paracetamol',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Fully Taken',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Pallete
                                                                  .whiteColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.check,
                                              color: Pallete.originBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: ScheduleScreen()));
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  BounceFromRightAnimation(
                                    delay: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pill.png",
                                                    height: 25,
                                                    width: 25,
                                                    color: Pallete.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Pain Eaze',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Fully Taken',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Pallete
                                                                  .whiteColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.cancel_outlined,
                                              color: Pallete.originBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: ScheduleScreen()));
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BounceFromRightAnimation(
                                    delay: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pill.png",
                                                    height: 25,
                                                    width: 25,
                                                    color: Pallete.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Amoxylynn',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Image.asset(
                                              "assets/images/next.png",
                                              height: 15,
                                              width: 15,
                                              color: Pallete.originBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(height: 2,child: Container(color: Pallete.greyBackground,),)),
                          SizedBox(
                          height: 20,
                        ),
                                                Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'Lunch',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: ScheduleScreen()));
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BounceFromRightAnimation(
                                    delay: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pill.png",
                                                    height: 25,
                                                    width: 25,
                                                    color: Pallete.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Paracetamol',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Image.asset(
                                              "assets/images/next.png",
                                              height: 15,
                                              width: 15,
                                              color: Pallete.originBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: ScheduleScreen()));
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BounceFromRightAnimation(
                                    delay: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pill.png",
                                                    height: 25,
                                                    width: 25,
                                                    color: Pallete.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Pain Eaze',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Image.asset(
                                              "assets/images/next.png",
                                              height: 15,
                                              width: 15,
                                              color: Pallete.originBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: ScheduleScreen()));
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BounceFromRightAnimation(
                                    delay: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pill.png",
                                                    height: 25,
                                                    width: 25,
                                                    color: Pallete.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Amoxylynn',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Image.asset(
                                              "assets/images/next.png",
                                              height: 15,
                                              width: 15,
                                              color: Pallete.originBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: SizedBox(height: 2,child: Container(color: Pallete.greyBackground,),)),
                          SizedBox(
                          height: 20,
                        ),

                                             Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'Lunch',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: ScheduleScreen()));
                            },
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  BounceFromRightAnimation(
                                    delay: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0, right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/pill.png",
                                                    height: 25,
                                                    width: 25,
                                                    color: Pallete.whiteColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Paracetamol',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Pallete
                                                              .whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Image.asset(
                                              "assets/images/next.png",
                                              height: 15,
                                              width: 15,
                                              color: Pallete.originBlue,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
