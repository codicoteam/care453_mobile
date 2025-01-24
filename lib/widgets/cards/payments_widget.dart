import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:care453/widgets/customer_animation/bounce_animation.dart';
import 'package:care453/widgets/customer_animation/fade_in_animation.dart';
import 'package:care453/widgets/customer_animation/leftbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customer_animation/rightbounce_animation.dart';

class PaymentsWidget extends StatelessWidget {
  final String totalNumberOfVisits;
  final String totalNumberOfCompletedVisits;
  final String totaNumberOfCompletedHours;
  final String totalNumberOfAllHours;
  final String totalMoneyOnCompletedVisits;
  final String totalMoneyOnAllVisits;

  const PaymentsWidget({
    super.key,
    required this.totalNumberOfVisits,
    required this.totalNumberOfCompletedVisits,
    required this.totaNumberOfCompletedHours,
    required this.totalNumberOfAllHours,
    required this.totalMoneyOnCompletedVisits,
    required this.totalMoneyOnAllVisits,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap,
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Pallete.originBlue.withOpacity(0.5), // Blue border color
            width: 1, // Border width of 2
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.2), // Shadow color with transparency
              spreadRadius: 2,
              blurRadius: 6, // Controls the blur effect
              offset: const Offset(0, 4), // Moves the shadow down by 4px
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Number of visits',
                    style: GoogleFonts.inter(
                      fontSize: 12.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                  Text(
                    '$totalNumberOfVisits',
                    style: GoogleFonts.inter(
                      fontSize: 14.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 1,
              child: Container(
                color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Number of completed visits',
                    style: GoogleFonts.inter(
                      fontSize: 12.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                  Text(
                    '${totalNumberOfCompletedVisits}',
                    style: GoogleFonts.inter(
                      fontSize: 14.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 1,
              child: Container(
                color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 250,
                    child: Text(
                      'Total hours on completed visits',
                      style: GoogleFonts.inter(
                        fontSize: 12.0, // Font size 16px
                        fontWeight: FontWeight.w500, // Font weight 600
                        height: 19.36 /
                            16.0, // Line height 19.36px converted to Flutter
                        color: Colors.black, // Text color
                      ),
                      textAlign: TextAlign.left, // Text alignment to left
                    ),
                  ),
                  Text(
                    '$totaNumberOfCompletedHours',
                    style: GoogleFonts.inter(
                      fontSize: 14.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 1,
              child: Container(
                color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total hours on all visits',
                    style: GoogleFonts.inter(
                      fontSize: 12.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                  Text(
                    '$totalNumberOfAllHours',
                    style: GoogleFonts.inter(
                      fontSize: 14.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 1,
              child: Container(
                color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Text(
                      'Income on completed visits',
                      style: GoogleFonts.inter(
                        fontSize: 12.0, // Font size 16px
                        fontWeight: FontWeight.w500, // Font weight 600
                        height: 19.36 /
                            16.0, // Line height 19.36px converted to Flutter
                        color: Colors.black, // Text color
                      ),
                      textAlign: TextAlign.left, // Text alignment to left
                    ),
                  ),
                  Text(
                    '\$$totalMoneyOnCompletedVisits',
                    style: GoogleFonts.inter(
                      fontSize: 14.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 1,
              child: Container(
                color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Income on all visits',
                    style: GoogleFonts.inter(
                      fontSize: 12.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                  Text(
                    '\$$totalMoneyOnAllVisits',
                    style: GoogleFonts.inter(
                      fontSize: 14.0, // Font size 16px
                      fontWeight: FontWeight.w500, // Font weight 600
                      height: 19.36 /
                          16.0, // Line height 19.36px converted to Flutter
                      color: Colors.black, // Text color
                    ),
                    textAlign: TextAlign.left, // Text alignment to left
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 500.ms)
          .slideY(begin: 0.4, end: 0, duration: 400.ms, curve: Curves.easeOut)
          .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.3)),
    );
  }
}
