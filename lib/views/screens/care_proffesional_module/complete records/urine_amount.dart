import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/rightbounce_animation.dart';
import 'package:care453/views/screens/care_proffesional_module/complete%20records/severety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../widgets/customer_animation/fade_in_slide.dart';
import '../available_options/available_options.dart';
import 'add_picture_report.dart';
import 'notable_activities.dart';

class UrineAmount extends StatefulWidget {
  const UrineAmount({super.key});

  @override
  State<UrineAmount> createState() => _UrineAmountState();
}

class _UrineAmountState extends State<UrineAmount> {
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
                "How much urine was in the bag",
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
                'Specify the amount below',
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
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            'Specify the amount below',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Amount",
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 30,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Pallete.lightPrimaryTextColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    "ml",
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Pallete.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
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
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: const Color.fromARGB(255, 9, 104, 247),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
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
                            child: Severety()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Text(
                      'Submit',
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
