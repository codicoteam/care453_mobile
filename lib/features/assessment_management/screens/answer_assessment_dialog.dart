import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:care453/widgets/custom_description.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:care453/widgets/error_widgets/error_submission.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:care453/widgets/success/success_submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/assessment_helpers.dart';

class AnswerAssessmentDialog extends StatefulWidget {
  final AssessmentModel assessmentModel;
  const AnswerAssessmentDialog({super.key, required this.assessmentModel});
  @override
  State<AnswerAssessmentDialog> createState() => _AnswerAssessmentDialogState();
}

class _AnswerAssessmentDialogState extends State<AnswerAssessmentDialog> {
  List<String> uploadedImageUrl = [];
  TextEditingController answer_controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.assessmentModel.answer != "N/A") {
      setState(() {
        answer_controller.text = widget.assessmentModel.answer!;
      });
    }
  }

  final AssessmentHelpers assessmentHelpers = AssessmentHelpers();
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
                'Assessment Details',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                    ),
              ).animate().fadeIn(duration: 300.ms),
              SizedBox(
                height: 20,
              ),
              Text(
                'Question: ',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '${widget.assessmentModel.question}',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                'Hint: ',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                '${widget.assessmentModel.question}',
                style: GoogleFonts.poppins(
                  color: Pallete.lightPrimaryTextColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Text(
                'Answer',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              CustomDescriptionField(
                labelText: 'Enter Answer',
                controller: answer_controller,
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorderColor: Colors.blue,
                defaultBorderColor: Colors.grey,
                onChanged: (value) {
                  print('Description: $value');
                },
              ),
              const SizedBox(height: 16),

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
                          await assessmentHelpers.validateAndSubmitForm(
                        answer: answer_controller.text,
                        assessment: widget.assessmentModel,
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
                      'Submit Answer',
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
