import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:care453/views/screens/care_proffesional_module/available_options/available_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../widgets/customer_animation/fade_in_slide.dart';

class CarePlanScreen extends StatefulWidget {
  const CarePlanScreen({super.key});

  @override
  State<CarePlanScreen> createState() => _CarePlanScreenState();
}

class _CarePlanScreenState extends State<CarePlanScreen> {
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
                  Text(
                    "Care Plan",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 9, 104, 247),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Visits header with counter and dropdown icon
            BounceFromRightAnimation(
              delay: 1,
              child: Container(
                height: 70,
                width: double.infinity,
                color: Pallete.whiteColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius:
                            BorderRadius.circular(8), // Adds border radius
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8), // Matches the container's border radius
                        child: Transform.scale(
                          scale: 1.1, // Slightly zoom the image
                          child: Image.asset(
                            "assets/images/profile1.jpg",
                            fit: BoxFit
                                .cover, // Adjusts the image to cover the entire space
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Tapiwa Maunganidze',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            BounceFromRightAnimation(
              delay: 2.5,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Center(
                  child: Text(
                    'Last Visited Friday at 14:00',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Pallete.lightPrimaryTextColor,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Pallete.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15), // Top-left corner
                      topRight: Radius.circular(15), // Top-right corner
                    ),
                  ),
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: BounceFromRightAnimation(
                    delay: 3.0,
                    child: ListView(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the border radius here
                              child: Container(
                                color: Pallete.greyBackground,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Your child widgets go here
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Tapiwa Maunganidze',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Container(
                                                  width: 85,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.list,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '9',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.visibility,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '3',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Yersterday',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Text(
                                                  '19 Oct - 15:00 ',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'by Legolas Rings',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      color: Pallete.originBlue,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Completed',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Text(
                                                '2 Hours',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the border radius here
                              child: Container(
                                color: Pallete.greyBackground,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Your child widgets go here
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Tapiwa Maunganidze',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Container(
                                                  width: 85,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.list,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '9',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.visibility,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '3',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Yersterday',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Text(
                                                  '19 Oct - 15:00 ',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'by Legolas Rings',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      color: Pallete.originBlue,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Completed',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Text(
                                                '2 Hours',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the border radius here
                              child: Container(
                                color: Pallete.greyBackground,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Your child widgets go here
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Tapiwa Maunganidze',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Container(
                                                  width: 85,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.list,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '9',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.visibility,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '3',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Yersterday',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Text(
                                                  '19 Oct - 15:00 ',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'by Legolas Rings',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      color: Pallete.originBlue,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Completed',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Text(
                                                '2 Hours',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Set the border radius here
                              child: Container(
                                color: Pallete.greyBackground,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Your child widgets go here
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Tapiwa Maunganidze',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Container(
                                                  width: 85,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.list,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '9',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 40,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.visibility,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            Text(
                                                              '3',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Yersterday',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                                Text(
                                                  '19 Oct - 15:00 ',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'by Legolas Rings',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey.shade700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      color: Pallete.originBlue,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Completed',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                              Text(
                                                '2 Hours',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Pallete.whiteColor,
                                                ),
                                              ),
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(color: Pallete.greyBackground),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            FadeInSlide(
              duration: 2.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: const Color.fromARGB(255, 9, 104, 247),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                  onPressed: () {
                    // Add button onPressed logic here
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            duration: Duration(seconds: 1),
                            child: AvailableOptions()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      'Patient Report',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
