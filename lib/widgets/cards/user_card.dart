import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/customer_animation/bounce_animation.dart';
import 'package:care453/widgets/customer_animation/fade_in_animation.dart';
import 'package:care453/widgets/customer_animation/leftbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../../models/group_users_models.dart';
import '../customer_animation/rightbounce_animation.dart';
import 'package:intl/intl.dart';

class UserCard extends StatelessWidget {
  final GroupUser groupUser;
  final VoidCallback? onTap;
  const UserCard({
    super.key,
    required this.groupUser,
    this.onTap,
  });

  String _formatTimestamp(String timestamp) {
    try {
      DateTime date = DateTime.parse(timestamp); // Parse the timestamp
      return DateFormat('EEE, MMM d, yyyy').format(date); // Format the date
    } catch (e) {
      return 'Invalid date'; // Handle parsing errors
    }
  }

  String FormatTimeInTimeStamp(String timestamp) {
    try {
      DateTime date = DateTime.parse(timestamp); // Parse the timestamp
      return DateFormat('HH:mm:ss').format(date); // Format to time only
    } catch (e) {
      return 'Invalid time'; // Handle parsing errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Pallete.originBlue,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    child: Row(
                  children: [
                    BounceFromLeftAnimation(
                      delay: 1.5,
                      child: CircleAvatar(
                          backgroundColor: Pallete.originBlue,
                          radius: 40,
                          child: CircleAvatar(
                            backgroundColor: Pallete.originBlue,
                            radius: 40,
                            child: ClipOval(
                              child: Image.network(
                                groupUser.profilePicture!,
                                fit: BoxFit.cover,
                                width:
                                    70, // Match the diameter of the CircleAvatar (2 * radius)
                                height:
                                    70, // Match the diameter of the CircleAvatar (2 * radius)
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    // The image has finished loading
                                    return child;
                                  } else {
                                    // The image is still loading, show shimmer
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey[300],
                                        radius: 25,
                                      ),
                                    );
                                  }
                                },
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  // Handle image loading error (optional)
                                  return Icon(Icons.error,
                                      size: 50, color: Colors.red);
                                },
                              ),
                            ),
                          )).animate().fadeIn(duration: 300.ms).slideX(),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInAnimation(
                          delay: 1.5,
                          child: Text(
                            "${groupUser.firstName!} ${groupUser.lastName!}",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Pallete.originBlue,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        BounceFromBottomAnimation(
                          delay: 2.0,
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  color: Pallete.originBlue, size: 14),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Role: ${groupUser.role}",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.lightPrimaryTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        BounceFromBottomAnimation(
                          delay: 2.0,
                          child: Row(
                            children: [
                              Icon(FontAwesomeIcons.clock,
                                  color: Pallete.originBlue, size: 14),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                groupUser.email!,
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Pallete.lightPrimaryTextColor,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ),

              // Rotate this to be atleast 270 Degrees and it should touch the top border and the side border by that i mean the sized
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(duration: 500.ms)
          .slideY(begin: 0.4, end: 0, duration: 400.ms, curve: Curves.easeOut)
          .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.3)),
    );
  }
}
