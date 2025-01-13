import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:firebase_auth/firebase_auth.dart' as FireUser;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../controllers/patient_vitals_controllers.dart';

class PatientVitalsHelpers {
  final PatientVitalsControllers patientVitalsControllers =
      Get.put(PatientVitalsControllers());

  FireUser.User? user = FirebaseAuth.instance.currentUser;

  void validateAndSubmitForm({
    required String visitId,
    required String patientId,
    required double temperature,
    required double systolic,
    required double diastolic,
    required double heartRate,
    required double respiratoryRate,
    required double oxygenSaturation,
    required String notes,
  }) async {
    // Validate visitId and patientId
    if (visitId.isEmpty || patientId.isEmpty) {
      Get.snackbar(
        'Error',
        'Visit ID and Patient ID are required.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate temperature
    if (temperature < 34 || temperature > 42) {
      Get.snackbar(
        'Error',
        'Temperature must be between 34°C and 42°C.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate systolic and diastolic blood pressure
    if (systolic < 80 || systolic > 200) {
      Get.snackbar(
        'Error',
        'Systolic pressure must be between 80 and 200.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    if (diastolic < 40 || diastolic > 120) {
      Get.snackbar(
        'Error',
        'Diastolic pressure must be between 40 and 120.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate heart rate
    if (heartRate < 40 || heartRate > 180) {
      Get.snackbar(
        'Error',
        'Heart rate must be between 40 and 180.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate respiratory rate
    if (respiratoryRate < 8 || respiratoryRate > 40) {
      Get.snackbar(
        'Error',
        'Respiratory rate must be between 8 and 40.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate oxygen saturation
    if (oxygenSaturation < 70 || oxygenSaturation > 100) {
      Get.snackbar(
        'Error',
        'Oxygen saturation must be between 70% and 100%.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate notes
    if (notes.isEmpty) {
      Get.snackbar(
        'Error',
        'Description is required.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    if (notes.length > 500) {
      Get.snackbar(
        'Error',
        'Notes must not exceed 500 characters.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Proceed with submission
    patientVitalsControllers.isLoading(true);
    showLoadingDialog(); // Show loading dialog
    final bool isSuccess = await patientVitalsControllers.addPatientVitals(
      visitId: visitId,
      patientId: patientId,
      temperature: temperature,
      systolic: systolic,
      diastolic: diastolic,
      heartRate: heartRate,
      respiratoryRate: respiratoryRate,
      oxygenSaturation: oxygenSaturation,
      notes: notes,
    );
    patientVitalsControllers.isLoading(false);
    hideLoadingDialog(); // Hide loading dialog

    if (isSuccess) {
      Get.snackbar(
        'Success',
        patientVitalsControllers.successMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        duration: const Duration(seconds: 10),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        patientVitalsControllers.errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        duration: Duration(seconds: 10),
        colorText: Colors.white,
      );
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




  void validateAndEditForm({
    required String visitId,
    required String patientVitalsid,
    required String patientId,
    required double temperature,
    required double systolic,
    required double diastolic,
    required double heartRate,
    required double respiratoryRate,
    required double oxygenSaturation,
    required String notes,
  }) async {
    // Validate visitId and patientId
    if (visitId.isEmpty || patientId.isEmpty) {
      Get.snackbar(
        'Error',
        'Visit ID and Patient ID are required.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate temperature
    if (temperature < 34 || temperature > 42) {
      Get.snackbar(
        'Error',
        'Temperature must be between 34°C and 42°C.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate systolic and diastolic blood pressure
    if (systolic < 80 || systolic > 200) {
      Get.snackbar(
        'Error',
        'Systolic pressure must be between 80 and 200.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    if (diastolic < 40 || diastolic > 120) {
      Get.snackbar(
        'Error',
        'Diastolic pressure must be between 40 and 120.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate heart rate
    if (heartRate < 40 || heartRate > 180) {
      Get.snackbar(
        'Error',
        'Heart rate must be between 40 and 180.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate respiratory rate
    if (respiratoryRate < 8 || respiratoryRate > 40) {
      Get.snackbar(
        'Error',
        'Respiratory rate must be between 8 and 40.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate oxygen saturation
    if (oxygenSaturation < 70 || oxygenSaturation > 100) {
      Get.snackbar(
        'Error',
        'Oxygen saturation must be between 70% and 100%.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Validate notes
    if (notes.isEmpty) {
      Get.snackbar(
        'Error',
        'Description is required.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    if (notes.length > 500) {
      Get.snackbar(
        'Error',
        'Notes must not exceed 500 characters.',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        duration: Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return;
    }

    // Proceed with submission
    patientVitalsControllers.isLoading(true);
    showLoadingDialog(); // Show loading dialog
    final bool isSuccess = await patientVitalsControllers.EditPatientVitals(patientVitalsid: patientVitalsid, visitId: visitId, patientId: patientId, temperature: temperature, systolic: systolic, diastolic: diastolic, heartRate: heartRate, respiratoryRate: respiratoryRate, oxygenSaturation: oxygenSaturation, notes: notes);
    patientVitalsControllers.isLoading(false);
    hideLoadingDialog(); // Hide loading dialog

    if (isSuccess) {
      Get.snackbar(
        'Success',
        patientVitalsControllers.successMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        duration: const Duration(seconds: 10),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        patientVitalsControllers.errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        duration: Duration(seconds: 10),
        colorText: Colors.white,
      );
    }
  }








}
