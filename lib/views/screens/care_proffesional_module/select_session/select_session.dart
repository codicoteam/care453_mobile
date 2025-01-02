import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../widgets/customer_animation/fade_in_slide.dart';
import '../care plan/care_plan.dart';

class SelectSession extends StatefulWidget {
  const SelectSession({super.key});

  @override
  State<SelectSession> createState() => _SelectSessionState();
}

class _SelectSessionState extends State<SelectSession> {
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
                          'Select Session',
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
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Text(
                'They are four sessions today which one would you like to complete.',
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: SelectSession()));
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '1. Morning',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 14,),
                                                  Text(
                                                    '0 out of 20 task completed',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w400,
                                                      color: Pallete.whiteColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.arrow_forward,
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
                        SizedBox(height: 15,),
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
                                      child: SelectSession()));
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '2. Lunch',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 14,),
                                                  Text(
                                                    '0 out of 10 task completed',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w400,
                                                      color: Pallete.whiteColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.arrow_forward,
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


                        SizedBox(height: 15,),
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
                                      child: SelectSession()));
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '3. Afternoon',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 14,),
                                                  Text(
                                                    '0 out of 5 task completed',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w400,
                                                      color: Pallete.whiteColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.arrow_forward,
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



                        SizedBox(height: 15,),
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
                                      child: SelectSession()));
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
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '4. Evening',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(width: 14,),
                                                  Text(
                                                    '0 out of 11 task completed',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 13,
                                                      fontWeight: FontWeight.w400,
                                                      color: Pallete.whiteColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: 35,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Pallete.whiteColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                                child: Icon(
                                              Icons.arrow_forward,
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
