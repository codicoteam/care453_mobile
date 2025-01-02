import 'dart:io';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/observation_management/controller/observation_controller.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

import '../controller/assessment_controller.dart';
class AssessmentHelpers {
  final AssessmentController assessmentController =
      Get.put(AssessmentController());
  final ImagePicker _picker = ImagePicker();


  Future<bool> validateAndSubmitForm({
    required String answer,
    required AssessmentModel assessment,
  }) async{
    // Check if tasks are empty
    if (answer.isEmpty) {
      Get.snackbar(
        'Error',
        'Answer is required.',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
        backgroundColor: Pallete.originBlue,
      );
      return false; // Validation failed
    }
      final bool answerSuccess = await  assessmentController.updateAssessmentById(
        answer: answer,
        assessment: assessment,
      );

      if (!answerSuccess) {
        // If visit update fails, log and return false
        DevLogs.logError('Failed to update assessment: ${assessment.id}');
        return false;
      }

    Get.snackbar(
      'Success',
      "You have successfully done your assessment",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Pallete.originBlue,
      duration: const Duration(seconds: 10),
      colorText: Colors.white,
    );
    return true;
  }



  void showLoadingDialog() {
    Get.dialog(
      CustomLoader(message: 'Submitting.....'),
      barrierDismissible: false,
    );
  }
}
