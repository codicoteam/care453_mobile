import 'dart:io';
import 'package:care453/core/utils/asset_utils/image_util.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/features/Home/client_main_screen.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../controllers/profile_controllers.dart';
import 'package:intl/intl.dart'; // Import for date formatting

class ProfileHelper {
  final ProfileController profileController = Get.put(ProfileController());
  final ImagePicker _picker = ImagePicker();


  void validateAndSubmitForm({
    required String email,
    required String medicalhistory,
    required String firstName,
    required String gender,
    required String lastName,
    required String medicalInfo,
    required String dateOfBirth,
    required String address,
    required String allergies,
    required String clientPhoneNumber,
    required String profilePicture,
    required String confirmPasswordController,
    required String passwordController,
  }) async {
    // Validation checks as before...

    if (firstName.isEmpty) {
      Get.snackbar('Error', 'First name is required.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue);
      return;
    }
    if (lastName.isEmpty) {
      Get.snackbar('Error', 'Last name is required.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue);
      return;
    }
    if (medicalInfo.isEmpty) {
      Get.snackbar('Error', 'Medical information is required.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Pallete.originBlue,
          colorText: Colors.white);
      return;
    }
    if (dateOfBirth.isEmpty) {
      Get.snackbar('Error', 'Date of birth is required.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          colorText: Colors.white);
      return;
    }
    if (address.isEmpty) {
      Get.snackbar('Error', 'Address is required.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          colorText: Colors.white);
      return;
    }

    if (clientPhoneNumber.isEmpty) {
      Get.snackbar('Error', 'Phone number is required.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          colorText: Colors.white);
      return;
    }
    if (profilePicture.isEmpty) {
      Get.snackbar(
        'Error',
        'Profile picture is required.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white,
      );
      return;
    }
    if (confirmPasswordController.isEmpty) {
      Get.snackbar('Error', 'Please confirm your password.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          colorText: Colors.white);
      return;
    }

    profileController.isLoading(true);
    showLoadingDialog(); // Show loading dialog
    final bool isSuccess = await profileController.createClientProfile(
        firstName: firstName,
        lastName: lastName,
        medicalAidInfo: medicalInfo,
        dateOfBirth: dateOfBirth,
        password: passwordController.trim(),
        profilePicture: profilePicture,
        gender: gender,
        contactNumber: clientPhoneNumber,
        medicalhistory:medicalhistory,
        address: address,
        allergies: allergies,
        email: email,
        // email: "${user!.email}",
        );

    profileController.isLoading(false);
    hideLoadingDialog(); // Hide loading dialog

    if (isSuccess) {
      Get.snackbar('Success', profileController.successMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          colorText: Colors.white);

      Get.to(ClientMainScreen());
    } else {
      Get.snackbar('Error', profileController.errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          colorText: Colors.white);
    }
  }



void validateAndUpdate({
  required String email,
  required String medicalhistory,
  required String firstName,
  required String gender,
  required String lastName,
  required String medicalInfo,
  required String dateOfBirth,
  required String address,
  required String allergies,
  required String clientPhoneNumber,
  required String profilePicture,
  required String confirmPasswordController,
  required String passwordController,
}) async {
  // Validation checks as before...

  if (firstName.isEmpty) {
    Get.snackbar('Error', 'First name is required.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue);
    return;
  }
  if (lastName.isEmpty) {
    Get.snackbar('Error', 'Last name is required.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue);
    return;
  }
  if (allergies.isEmpty) {
    Get.snackbar('Error', 'Allergy required.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }
  if (medicalInfo.isEmpty) {
    Get.snackbar('Error', 'Medical information is required.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }
  if (dateOfBirth.isEmpty) {
    Get.snackbar('Error', 'Date of birth is required.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }

  // Date Validation: Ensure dateOfBirth is in "yyyy-MM-dd" format and is in the past
  DateTime? dob;
  try {
    dob = DateFormat("yyyy-MM-dd").parseStrict(dateOfBirth);
  } catch (e) {
    Get.snackbar('Error', 'Invalid date format. Use yyyy-MM-dd.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }

  if (dob.isAfter(DateTime.now())) {
    Get.snackbar('Error', 'Date of birth must be in the past.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }

  if (address.isEmpty) {
    Get.snackbar('Error', 'Address is required.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }

  if (clientPhoneNumber.isEmpty) {
    Get.snackbar('Error', 'Phone number is required.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }
  if (profilePicture.isEmpty) {
    Get.snackbar(
      'Error',
      'Profile picture is required.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Pallete.originBlue,
      colorText: Colors.white,
    );
    return;
  }
  if (confirmPasswordController.isEmpty) {
    Get.snackbar('Error', 'Please confirm your password.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }
  if (confirmPasswordController != passwordController) {
    Get.snackbar('Error', 'Password did not match.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);
    return;
  }

  profileController.isLoading(true);
  showLoadingDialog(); // Show loading dialog
  final bool isSuccess = await profileController.updateClientProfile(
      firstName: firstName,
      lastName: lastName,
      medicalAidInfo: medicalInfo,
      dateOfBirth: dateOfBirth, // Already validated
      password: passwordController.trim(),
      profilePicture: profilePicture,
      gender: gender,
      contactNumber: clientPhoneNumber,
      medicalhistory: medicalhistory,
      address: address,
      allergies: allergies,
      email: email,
  );

  profileController.isLoading(false);
  hideLoadingDialog(); // Hide loading dialog

  if (isSuccess) {
    Get.snackbar('Success', profileController.successMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        colorText: Colors.white);

    Get.to(ClientMainScreen());
  } else {
    Get.snackbar('Error', profileController.errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
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

  Future<void> showImagePickerDialog(Function(String) onImageUpload) async {
    Get.dialog(
      Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Container(
          height: 200,
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
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
                      Get.back();
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        uploadImageToSupabase(image, onImageUpload);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            LocalImageConstants.camera,
                            height: 45,
                            width: 45,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Open Camera",
                            style: GoogleFonts.poppins(fontSize: 14))
                      ],
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () async {
                      Get.back();
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        uploadImageToSupabase(image, onImageUpload);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            LocalImageConstants.gallery,
                            height: 45,
                            width: 45,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Choose Photo",
                            style: GoogleFonts.poppins(fontSize: 14))
                      ],
                    ),
                  )),
                ],
              ),
              CustomButton(
                  btnColor: Pallete.originBlue,
                  width: 300,
                  borderRadius: 10,
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () => Get.back()),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadImageToSupabase(
      XFile image, Function(String) onImageUpload) async {
    try {
      final supabase = Supabase.instance.client;

      // Get file name
      final fileName =
          'profile_pictures/${DateTime.now().toIso8601String()}_${image.name}';

      // Upload image
      await supabase.storage.from('care_app').upload(
            fileName,
            File(image.path),
          );

      // Generate public URL
      final publicUrl =
          supabase.storage.from('care_app').getPublicUrl(fileName);

      if (publicUrl != null) {
        onImageUpload(publicUrl); // Pass the uploaded image URL
      } else {
        throw Exception('Failed to generate public URL');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
