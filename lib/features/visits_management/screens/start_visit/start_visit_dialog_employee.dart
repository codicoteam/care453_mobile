import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/qr-code-manage/screens/qr_code_generator_dialog.dart';
import 'package:care453/features/qr-code-manage/screens/qr_code_scanner_dialog.dart';
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

class StartVisitDialogEmployee extends StatefulWidget {
  final VisitModel visitModel;
  const StartVisitDialogEmployee({super.key, required this.visitModel});

  @override
  State<StartVisitDialogEmployee> createState() =>
      _StartVisitDialogEmployeeState();
}

class _StartVisitDialogEmployeeState extends State<StartVisitDialogEmployee> {
  List<String> uploadedImageUrl = [];

  final TextEditingController _descriptionontroller = TextEditingController();

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
                'Start Visit',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                    ),
              ).animate().fadeIn(duration: 300.ms),
              const SizedBox(height: 30),
              Text(
                'Starting a visit you have to scan the the qr code of the client or he has to scan the qr code of this visit',
                style: GoogleFonts.poppins(
                  color: Pallete.blackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.dialog(QrCodeScannerDialog(
                        visitModel: widget.visitModel,
                      ));
                    },
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Pallete.originBlue, // Replace with your color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Scan Qr Code",
                          style: TextStyle(
                            color:
                                Colors.white, // Adjust text color if necessary
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(duration: 650.ms),
                  GestureDetector(
                    onTap: () {
                      Get.dialog(QrCodeGeneratorDialog(
                        visitModel: widget.visitModel,
                      ));
                    },
                    child: Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Pallete.originBlue, // Replace with your color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "View Qr Code",
                          style: TextStyle(
                            color:
                                Colors.white, // Adjust text color if necessary
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(duration: 650.ms),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
