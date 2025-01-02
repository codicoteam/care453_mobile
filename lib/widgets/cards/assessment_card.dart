import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:care453/widgets/customer_animation/bounce_animation.dart';
import 'package:care453/widgets/customer_animation/fade_in_animation.dart';
import 'package:care453/widgets/customer_animation/leftbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customer_animation/rightbounce_animation.dart';

class AssessmentCard extends StatelessWidget {
  final AssessmentModel assessmentModel;
  final String IndexValue;
  final VoidCallback? onTap;
  const AssessmentCard(
      {super.key,
      required this.assessmentModel,
      this.onTap,
      required this.IndexValue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Pallete.whiteColor, // Background color
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              // Border with origin blue color
              color: Pallete.originBlue,
              width: 2,
            ),
            boxShadow: [
              // Shadow for elevation
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Shadow color with transparency
                blurRadius: 8, // Blur radius for the shadow
                offset: Offset(0, 4), // Position of the shadow
              ),
            ],
          ),
          child: ListTile(
            leading: BounceFromLeftAnimation(
              delay: 1.5,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: assessmentModel.answer == "N/A"
                      ? Pallete.originBlue.withOpacity(0.7)
                      : Pallete.originBlue,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    IndexValue,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor, // Contrast text color
                    ),
                  ),
                ),
              ),
            ),
            title: FadeInAnimation(
              delay: 1.5,
              child: Text(
                assessmentModel.question!,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Pallete.originBlue,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: BounceFromBottomAnimation(
              delay: 2.0,
              child: Text(
                assessmentModel.answer == "N/A" ? "Not Answered" : "Answered",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Pallete.lightPrimaryTextColor,
                ),
              ),
            ),
            trailing: BounceFromRightAnimation(
              delay: 2.0,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  color: Pallete.whiteColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    // Shadow for the trailing icon
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward,
                    color: Pallete.originBlue,
                  ),
                ),
              ),
            ),
          ),
        ) .animate()
            .fadeIn(duration: 500.ms)
            .slideY(begin: 0.4, end: 0, duration: 400.ms, curve: Curves.easeOut)
            .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.3)),);
  }
}
