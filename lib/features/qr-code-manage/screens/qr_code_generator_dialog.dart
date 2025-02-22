import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/visit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeGeneratorDialog extends StatefulWidget {
  final VisitModel visitModel;
  const QrCodeGeneratorDialog({super.key, required this.visitModel});
  @override
  State<QrCodeGeneratorDialog> createState() => _QrCodeGeneratorDialogState();
}

class _QrCodeGeneratorDialogState extends State<QrCodeGeneratorDialog> {
  List<String> uploadedImageUrl = [];
  final TextEditingController _descriptionontroller = TextEditingController();
  // final ObservationHelper observationHelper = ObservationHelper();
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
              Center(
                child: Text(
                  'Qr Code ',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Pallete.originBlue,
                      ),
                ).animate().fadeIn(duration: 300.ms),
              ),
              const SizedBox(height: 40),

              const SizedBox(height: 16),
              Center(
                child: Container(
                    height: 150,
                    width: 150,
                    child: PrettyQrView.data(data: widget.visitModel.id!)),
              ),
              SizedBox(height: 20,),
              Center(
                child: Text(
                  'Scan',
                  style: GoogleFonts.poppins(
                    color: Pallete.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Center(
                child: Text(
                  'Me',
                  style: GoogleFonts.poppins(
                    color: Pallete.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),


              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[500], // Replace with your color
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color:
                                    Colors.white, // Adjust text color if necessary
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
