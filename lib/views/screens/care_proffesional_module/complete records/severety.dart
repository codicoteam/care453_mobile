import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../widgets/customer_animation/fade_in_slide.dart';
import '../available_options/available_options.dart';
import '../image_slider/image_slider.dart';
import 'add_picture_report.dart';
import 'notable_activities.dart';

class Severety extends StatefulWidget {
  const Severety({super.key});

  @override
  State<Severety> createState() => _SeveretyState();
}

class _SeveretyState extends State<Severety> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallete.greyBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Text(
                "Choose the severity",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Text(
                'Select according to the situations current mood.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
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
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                            duration: Duration(seconds: 1),
                                            child: ImageSliderMarker()));
                                  },
                                  child: Container(
                                      height: 100,
                                      width: 160,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: Pallete
                                            .whiteColor, // Background color
                                        border: Border.all(
                                            color:
                                                Pallete.lightPrimaryTextColor,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Image.asset(
                                            "assets/images/exclamation.png",
                                            width: 35,
                                            height: 35,
                                            color:
                                                Pallete.lightPrimaryTextColor,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Low',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                    height: 100,
                                    width: 160,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: Pallete
                                          .whiteColor, // Background color
                                      border: Border.all(
                                          color: Pallete.lightPrimaryTextColor,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Image.asset(
                                          "assets/images/warning.png",
                                          width: 35,
                                          height: 35,
                                          color: Pallete.lightPrimaryTextColor,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Medium',
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      height: 100,
                                      width: 160,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                        color: Pallete
                                            .whiteColor, // Background color
                                        border: Border.all(
                                            color:
                                                Pallete.lightPrimaryTextColor,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Image.asset(
                                            "assets/images/down-arrow.png",
                                            width: 35,
                                            height: 35,
                                            color:
                                                Pallete.lightPrimaryTextColor,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'High',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            )),
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
