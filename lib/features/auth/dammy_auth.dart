import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/custom_description.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/observation_helper.dart';
class AddParkingBayDialog extends StatefulWidget {
  const AddParkingBayDialog({super.key});
  @override
  State<AddParkingBayDialog> createState() => _AddParkingBayDialogState();
}
class _AddParkingBayDialogState extends State<AddParkingBayDialog> {
  List<String>? uploadedImageUrl;
  final TextEditingController _descriptionontroller = TextEditingController();
  final ObservationHelper observationHelper = ObservationHelper();
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
              const SizedBox(height: 16),
GestureDetector(
                      onTap: () {
                        observationHelper.showImagePickerDialog((url) {
                          setState(() {
                            uploadedImageUrl = url;
                          });
                        });
                        setState(() {
                          uploading = true;
                        });
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Pallete.whiteColor,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/profile-two.png",
                              width: 30,
                              height: 30,
                              color: Pallete.lightPrimaryTextColor,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Set Picture",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
             // Submit Button
              GeneralButton(
                onTap: () { 
                },
                btnColor: Pallete.primaryColor,
                child: const Text(
                  'Submit Parking Bay',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).animate().fadeIn(duration: 650.ms),
            ],
          ),
        ),
      ),
    );
  }
}