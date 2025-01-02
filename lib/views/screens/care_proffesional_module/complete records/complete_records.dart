import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../widgets/customer_animation/fade_in_slide.dart';
import '../care plan/care_plan.dart';

class CompleteRecords extends StatefulWidget {
  const CompleteRecords({super.key});

  @override
  State<CompleteRecords> createState() => _CompleteRecordsState();
}

class _CompleteRecordsState extends State<CompleteRecords> {
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
                          'Completed Records',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          'By Legolas Rings',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Visit Time',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Pallete.lightPrimaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Pallete.greyBackground,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Check in:',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Pallete.lightPrimaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        '10:15',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Pallete.lightPrimaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Check Out:',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Pallete.lightPrimaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        '12:00',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Pallete.lightPrimaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total Visit:',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Pallete.lightPrimaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        '1hour 45 minutes',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Pallete.lightPrimaryTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'General Notes',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Pallete.lightPrimaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Pallete.greyBackground,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Text(
                                    'Patent has been taking all his medicine on time and listening to all the commands that are given.',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Pallete.lightPrimaryTextColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Observation's",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Pallete.lightPrimaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 280,
                            decoration: BoxDecoration(
                              color: Pallete.greyBackground,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Image.asset(
                                              "assets/images/drink.png",
                                              width: 60,
                                              height: 60,
                                              color:
                                                  Pallete.lightPrimaryTextColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Drinks",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                              ),
                                            ),
                                            Text(
                                              "Orange crush juice 100ml",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Image.asset(
                                              "assets/images/fast-food.png",
                                              width: 60,
                                              height: 60,
                                              color:
                                                  Pallete.lightPrimaryTextColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Food",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                              ),
                                            ),
                                            Text(
                                              "1 Snack",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                              ),
                                            ),

                                            Text(
                                              "Fresh Chips",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Image.asset(
                                              "assets/images/radio-button.png",
                                              width: 40,
                                              height: 40,
                                              color:
                                                  Pallete.lightPrimaryTextColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Not Taken",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                              ),
                                            ),
                                            Text(
                                              "Paracetamol",
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                                color: Pallete
                                                    .lightPrimaryTextColor,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              ],
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
