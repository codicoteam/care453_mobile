import 'dart:io';

import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/Home/client_main_screen.dart';
import 'package:care453/features/observation_management/controller/observation_controller.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:firebase_auth/firebase_auth.dart' as FireUser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ObservationHelper {
  final ObservationController observationController =
      Get.put(ObservationController());
  final ImagePicker _picker = ImagePicker();

  FireUser.User? user = FirebaseAuth.instance.currentUser;

  void validateAndSubmitForm(
      {required String description,
      required String employeeId,
      required String visitId,
      required List<String> images,
      required String date}) async {
    // Validation checks as before...

    if (description.isEmpty) {
      Get.snackbar('Error', 'Description is required.',
          snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }
    if (images.isEmpty) {
      Get.snackbar('Error', 'Images is required.',
              colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }

    if (images == []) {
      Get.snackbar('Error', 'Images are required.',
          snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }
    if (description.length < 100) {
      Get.snackbar('Error', 'Description should be above 100 characters.',
          snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }

    observationController.isLoading(true);
    showLoadingDialog(); // Show loading dialog
    final bool isSuccess = await observationController.addObservation(
        visitId: visitId,
        employeeId: employeeId,
        description: description,
        date: date,
        images: images);

    observationController.isLoading(false);
    hideLoadingDialog(); // Hide loading dialog

    if (isSuccess) {
      Get.snackbar('Success', observationController.successMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          duration:
              const Duration(seconds: 10), // Set the duration to 10 seconds
          colorText: Colors.white);
    } else {
      Get.snackbar('Error', observationController.errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds
          colorText: Colors.white);
    }
  }

  void showLoadingDialog() {
    Get.dialog(
      CustomLoader(message: 'Submitting.....'),
      barrierDismissible: false,
    );
  }

  void hideLoadingDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  Future<void> showImagePickerDialog(
      Function(List<String>) onImagesUpload) async {
    bool isLoading = false;
    final imagesUrls = <String>[];

    Get.dialog(
      StatefulBuilder(
        builder: (context, setState) => Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Container(
            height: isLoading ? 150 : 200,
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: isLoading
                ? Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.hexagonDots(
                            color: Pallete.primaryColor, size: 45),
                        const SizedBox(height: 10),
                        Text(
                          "Uploading images...",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Choose an option",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.camera);
                                if (image != null) {
                                  setState(() => isLoading = true);
                                  final urls =
                                      await uploadImagesToSupabase([image]);
                                  imagesUrls.addAll(urls);
                                  onImagesUpload(imagesUrls);
                                  setState(() => isLoading = false);
                                  Get.back();
                                }
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/images/camera.png',
                                      height: 45),
                                  const SizedBox(height: 5),
                                  Text("Open Camera",
                                      style: GoogleFonts.poppins(fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final List<XFile>? images =
                                    await _picker.pickMultiImage();
                                if (images != null && images.isNotEmpty) {
                                  setState(() => isLoading = true);
                                  final urls =
                                      await uploadImagesToSupabase(images);
                                  imagesUrls.addAll(urls);
                                  onImagesUpload(imagesUrls);
                                  setState(() => isLoading = false);
                                  Get.back();
                                }
                              },
                              child: Column(
                                children: [
                                  Image.asset('assets/images/gallery.png',
                                      height: 45),
                                  const SizedBox(height: 5),
                                  Text("Choose Photos",
                                      style: GoogleFonts.poppins(fontSize: 14)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () => Get.back(),
                        child: Text('Cancel', style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Future<List<String>> uploadImagesToSupabase(List<XFile> images) async {
    final List<String> uploadedUrls = [];
    final supabase = Supabase.instance.client;

    try {
      for (final image in images) {
        final fileName =
            'profile_pictures/${DateTime.now().toIso8601String()}_${image.name}';
        await supabase.storage.from('care_app').upload(
              fileName,
              File(image.path),
            );
        final publicUrl =
            supabase.storage.from('care_app').getPublicUrl(fileName);
        if (publicUrl != null) {
          uploadedUrls.add(publicUrl);
        } else {
          throw Exception('Failed to generate public URL for ${image.name}');
        }
      }
    } catch (e) {
      print('Error uploading images: $e');
    }

    return uploadedUrls;
  }
}
