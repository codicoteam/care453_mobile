import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/appointments/helpers/appointment_helper.dart';
import 'package:care453/features/map_management/screens/view_appointment_location.dart';
import 'package:care453/models/appointment_model.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:care453/widgets/error_widgets/error_submission.dart';
import 'package:care453/widgets/success/success_submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:readmore/readmore.dart';
import 'package:unicons/unicons.dart';
import 'package:intl/intl.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/general_button.dart';

class CancelDialogAppointment extends StatefulWidget {
  final AppointmentModel appointmentModel;
  const CancelDialogAppointment({
    super.key,
    required this.appointmentModel,
  });
  @override
  State<CancelDialogAppointment> createState() =>
      _CancelDialogAppointmentState();
}

class _CancelDialogAppointmentState extends State<CancelDialogAppointment> {
  List<String> uploadedImageUrl = [];
  final AppointmentHelper appointmentHelper = AppointmentHelper();

  final TextEditingController _descriptionontroller = TextEditingController();

  String formatDateTime() {
    try {
      // Parse the String into a DateTime object
      final parsedDate = DateTime.parse(widget.appointmentModel.visitDate);
      // Format the DateTime object into the desired format
      final dateFormat = DateFormat('EEE, MMM d, yyyy');
      return dateFormat.format(parsedDate);
    } catch (e) {
      // Handle potential parsing errors
      return 'Invalid date';
    }
  }

  LatLng? deliveryPoint;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.bottomCenter,
      insetPadding: EdgeInsets.zero,
      shadowColor: Colors.grey.withOpacity(0.2),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dialog Title
              Text(
                'Appointment Details',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                    ),
              ).animate().fadeIn(duration: 300.ms),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Service Type: ${widget.appointmentModel.serviceType}',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Pallete.blackColor,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 300.ms),
              SizedBox(
                height: 10,
              ),
              Text(
                "Description:",
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 500.ms)
                  .slideX(begin: -0.1, end: 0),

              ReadMoreText(
                widget.appointmentModel.moreInfo ?? 'No description available',
                trimLines: 2,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
                colorClickableText: Pallete.originBlue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Show less',
                moreStyle: TextStyle(
                  fontSize: 13,
                  color: Pallete.originBlue,
                  fontWeight: FontWeight.bold,
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 500.ms)
                  .slideX(begin: -0.1, end: 0),

              SizedBox(
                height: 8,
              ),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,
                            color: Pallete.originBlue, size: 14),
                        const SizedBox(width: 8),
                        Text(
                          formatDateTime(),
                          style: TextStyle(
                            color: Pallete.blackColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(UniconsLine.clock,
                            color: Pallete.originBlue, size: 15),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${widget.appointmentModel.visitTime ?? 'Unknown'} ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Pallete.originBlue, size: 14),
                  const SizedBox(width: 8),
                  Text(
                    "${widget.appointmentModel.clientAddress.street} ${widget.appointmentModel.clientAddress.city}",
                    style: TextStyle(
                      color: Pallete.blackColor,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CustomButton(
                      btnColor: Pallete.originBlue,
                      width: MediaQuery.sizeOf(context).width,
                      borderRadius: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
                            'View your appointment location',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          deliveryPoint = LatLng(-17.830871, 31.045817);
                        });
                        Get.to(ViewAppointmentLocation(
                          latitude:
                              widget.appointmentModel.clientAddress.latitude,
                          longtitude:
                              widget.appointmentModel.clientAddress.longtitude,
                        ));
                      }),
                ).animate().slideX(begin: 0.1, duration: 300.ms),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralButton(
                    onTap: () async {
                      Get.dialog(
                        const CustomLoader(message: 'Submitting'),
                        barrierDismissible: false,
                      );
                      bool isFormValid =
                          await appointmentHelper.validateAndSubmitFormTwo(
                        appointment: widget.appointmentModel,
                      );
                      Get.back();
                      if (isFormValid) {
                        // Handle success
                        Get.dialog(
                          SuccessSubmission(
                            Title: 'Successfully Answered The Question',
                            Description:
                                'On answering assessment you are allowed to come back and make changes to you answers that you have made. take not the assemnt are contacted to check your intelligent',
                            ButtonText: 'Continue',
                          ),
                          barrierDismissible: false,
                        );
                        print("Form submission successful!");
                      } else {
                        // Handle validation failure
                        Get.dialog(
                          ErrorSubmission(),
                          barrierDismissible: false,
                        );
                        print("Form submission failed.");
                      }
                    },
                    btnColor: Pallete.originBlue,
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ).animate().fadeIn(duration: 650.ms),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        width: 47,
                        height: 47,
                        decoration: BoxDecoration(
                          color: Colors
                              .grey[400], // Set the background color to grey
                          shape: BoxShape.circle, // Make it circular
                        ),
                        alignment: Alignment
                            .center, // Center the text inside the circle
                        child: Image.asset(
                          LocalImageConstants.cancel,
                          height: 25,
                          width: 25,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
