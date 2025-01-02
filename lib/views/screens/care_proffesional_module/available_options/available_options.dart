import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../widgets/customer_animation/fade_in_slide.dart';
import '../care plan/care_plan.dart';
import '../care plan/dose.dart';
import '../care plan/pill_dose.dart';
import '../complete records/add_comment_descrption.dart';
import '../complete records/complete_records.dart';
import '../complete records/completed_ranger.dart';
import '../schedule_screen/schedule.dart';
import '../select_session/select_session.dart';

class AvailableOptions extends StatefulWidget {
  const AvailableOptions({super.key});

  @override
  State<AvailableOptions> createState() => _AvailableOptionsState();
}

class _AvailableOptionsState extends State<AvailableOptions> {
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
                  Container(
                    width: 150,
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Raise Concern",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.orangeAccent,
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
                      children: [
                        Text(
                          'Tapiwa Maunganidze',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'View Available Options Below',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
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
            BounceFromRightAnimation(
              delay: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 5, 77, 185).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.alarm,
                        size: 45,
                        color: Pallete.whiteColor,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Alerts",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Pallete.whiteColor,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                              child: Text(
                                "Please click the link to schedule for a check up in the office",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: Pallete.whiteColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            FadeInSlide(
                              duration: 3,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 1,
                                  backgroundColor:
                                      const Color.fromARGB(255, 9, 104, 247),
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
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          duration: Duration(seconds: 1),
                                          child: RangeCompletedTask()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    'Get In Touch',
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Pallete.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            BounceFromRightAnimation(
              delay: 2.5,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pull down for refresh',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Pallete.lightPrimaryTextColor,
                      ),
                    ),
                    Icon(Icons.arrow_downward)
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 15,
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
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: AddCommentDescrption()));
                            },
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '1. Check In',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Pallete.whiteColor,
                                          ),
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
                            onTap: (){
                              
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      duration: Duration(seconds: 1),
                                      child: MedicationDose()));
                            },
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '2. Care Plan',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Pallete.whiteColor,
                                          ),
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
                              height: 70,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '3. Medication',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Pallete.whiteColor,
                                          ),
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
                                      child: SelectSession()));
                            },
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '4. Patient Log',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Pallete.whiteColor,
                                          ),
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
                                      child: CompleteRecords()));
                            },
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Pallete.originBlue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, right: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '5. Check Out',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Pallete.whiteColor,
                                          ),
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
