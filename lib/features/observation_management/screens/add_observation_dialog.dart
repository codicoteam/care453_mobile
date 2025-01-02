import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/visit_model.dart';
import 'package:care453/widgets/custom_description.dart';
import 'package:care453/widgets/general_button.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custom_text_field.dart';
import '../helpers/observation_helper.dart';

class AddObservationDialog extends StatefulWidget {
  final VisitModel visitModel;
  const AddObservationDialog({super.key, required this.visitModel});

  @override
  State<AddObservationDialog> createState() => _AddObservationDialogState();
}

class _AddObservationDialogState extends State<AddObservationDialog> {
  List<String> uploadedImageUrl=[];

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
              // Dialog Title
              Text(
                'Add Observation',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Pallete.originBlue,
                    ),
              ).animate().fadeIn(duration: 300.ms),
              const SizedBox(height: 16),

              // Bay I
              CustomDescriptionField(
                labelText: 'Enter Observation',
                controller: _descriptionontroller,
                fillColor: Colors.grey[200],
                filled: true,
                focusedBorderColor: Colors.blue,
                defaultBorderColor: Colors.grey,
                onChanged: (value) {
                  print('Description: $value');
                },
              ),

              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  observationHelper.showImagePickerDialog((url) {
                    setState(() {
                      uploadedImageUrl = url;
                    });
                  });
                  setState(() {});
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

              const SizedBox(height: 16),

              // Slidable Image Carousel
              if (uploadedImageUrl != null && uploadedImageUrl!.isNotEmpty)
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeCenterPage: true,
                    height: 200,
                    viewportFraction: 1.0,
                    aspectRatio: 16 / 9,
                  ),
                  items: uploadedImageUrl!.map((image) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        );
                      },
                    );
                  }).toList(),
                ),

              const SizedBox(height: 16),

              // Submit Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralButton(
// Inside your onTap method
                    onTap: () {
                      // Format the current date to "yyyy-MM-dd"
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(DateTime.now());

                      observationHelper.validateAndSubmitForm(
                        description: _descriptionontroller.text,
                        employeeId: widget.visitModel.careProfessionalId!.id!,
                        visitId: widget.visitModel.id!,
                        images: uploadedImageUrl,
                        date: formattedDate, // Pass the formatted date string
                      );
                    },

                    btnColor: Pallete.originBlue,
                    child: const Text(
                      'Submit Observation',
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
