import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:care453/widgets/customer_animation/bounce_animation.dart';
import 'package:care453/widgets/customer_animation/fade_in_animation.dart';
import 'package:care453/widgets/customer_animation/leftbounce_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../features/appointments/screens/cancel_dialog_appointment.dart';
import '../../models/appointment_model.dart';
import '../customer_animation/rightbounce_animation.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointmentModel;
  final VoidCallback? onTap;
  const AppointmentCard({
    super.key,
    required this.appointmentModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get menu options based on status
    List<String> getMenuOptions() {
      return ['View', 'Cancel'];
    }

    String formatDateTime() {
      try {
        final parsedDate = DateTime.parse(appointmentModel.visitDate);
        final dateFormat = DateFormat('EEE, MMM d, yyyy');
        return dateFormat.format(parsedDate);
      } catch (e) {
        return 'Invalid date';
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
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
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Pallete.originBlue.withOpacity(0.1),
                            ),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    LocalImageConstants.schedule,
                                    width: 10,
                                    height: 10,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInAnimation(
                              delay: 1.5,
                              child: Text(
                                appointmentModel.serviceType,
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
                                    formatDateTime(),
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
                                    appointmentModel.visitTime,
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Pallete.lightPrimaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
                  ),

                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      size: 24,
                      color: Pallete.originBlue,
                    ),
                    onSelected: (value) {
                      print('Selected: $value');
                      if (value == 'View') {
                        Get.to(CancelDialogAppointment(
                            appointmentModel: appointmentModel));
                      } else if (value == 'Cancel') {
                        Get.dialog(CancelDialogAppointment(
                            appointmentModel: appointmentModel));
                      }
                    },
                    itemBuilder: (context) {
                      return getMenuOptions()
                          .map((option) => PopupMenuItem<String>(
                                value: option,
                                child: Text(option),
                              ))
                          .toList();
                    },
                  ),

                  // Rotate this to be atleast 270 Degrees and it should touch the top border and the side border by that i mean the sized
                ],
              ),
            ),
          ),
          Positioned(
            top: 25, // Align with the top border
            right: 0, // Align with the side border
            child: Transform.rotate(
              angle: 0.4918, // Rotate 90 degrees counterclockwise
              child: Container(
                height: 15, // Cord thickness
                width: 100, // Length of the cord
                color: Pallete.originBlue,
                child: BounceFromRightAnimation(
                  delay: 2.0,
                  child: Center(
                    child: Text(
                      "${appointmentModel.status}",
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
          .animate()
          .fadeIn(duration: 500.ms)
          .slideY(begin: 0.4, end: 0, duration: 400.ms, curve: Curves.easeOut)
          .shimmer(duration: 1500.ms, color: Colors.white.withOpacity(0.3)),
    );
  }
}
