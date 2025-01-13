import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/custom_description.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:care453/widgets/error_widgets/error_submission.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:care453/widgets/success/success_submission.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controller/visit_controller.dart';

class ConfirmVisitDialog extends StatefulWidget {
  final VisitModel visitModel;
  const ConfirmVisitDialog({super.key, required this.visitModel});

  @override
  State<ConfirmVisitDialog> createState() => _ConfirmVisitDialogState();
}

class _ConfirmVisitDialogState extends State<ConfirmVisitDialog> {
  List<String> uploadedImageUrl = [];

  final TextEditingController _descriptionontroller = TextEditingController();
  final VisitController visitController = Get.put(VisitController());

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
                'Confirm Visit',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                    ),
              ).animate().fadeIn(duration: 300.ms),

              const SizedBox(height: 30),

              Text(
                'Confirm your visit to generate a qr code for your care professional to scan and start the doing the tasks with his visit',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),

              // Submit Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralButton(
// Inside your onTap method
                    onTap: () async {
                      Get.dialog(
                        const CustomLoader(message: 'Submitting'),
                        barrierDismissible: false,
                      );
                      bool isFormValid = await visitController.updateVisitById(
                        visitId: widget.visitModel.id!,
                        careProfessionalId:
                            widget.visitModel.careProfessionalId!.id!,
                        clientId: widget.visitModel.clientId!.id!,
                        latitude: widget.visitModel.location!.latitude!,
                        longitude: widget.visitModel.location!.longitude!,
                        dateOfVisit: "${widget.visitModel.dateOfVisit}",
                        startTime: widget.visitModel.startTime!,
                        endTime: widget.visitModel.endTime!,
                        status: "Confirmed",
                        officialVisitTime: widget.visitModel.officialVisitTime!,
                        officialEndTime: widget.visitModel.officialEndTime!,
                      );
                      Get.back();

                      if (isFormValid) {
                        // Handle success
                        Get.dialog(
                          SuccessSubmission(
                            Title: 'Successfully Confirmed Visit',
                            Description:
                                'Confirming visit means that you have confirmed that the care professional shhould come to your house, to undo please click the Reschedule button to notify the admin that you want to change the visit',
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
                      'Confirm Visit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ).animate().fadeIn(duration: 650.ms),
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
