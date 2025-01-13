import 'dart:ffi';

import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/models/appointment_model.dart';
import 'package:care453/widgets/custom_loader.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/logs.dart';
import '../controllers/appointment_controller.dart';

class AppointmentHelper {
  final AppointmentController appointmentController =
      Get.put(AppointmentController());
  void validateAndSubmitForm({
    required String clientId,
    required String visitDate,
    required String visitTime,
    required String serviceType,
    required String status,
    required String paymentStatus,
    required String street,
    required String city,
    required String state,
    required double latitude,
    required double longtitude,
    required String moreInfo,
  }) async {
    // Validation checks as before...

    if (visitDate.isEmpty) {
      Get.snackbar('Error', 'Date is required.',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Pallete.whiteColor,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }
    if (visitTime.isEmpty) {
      Get.snackbar('Error', 'Time is required.',
          colorText: Pallete.whiteColor,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }

    if (moreInfo.isEmpty) {
      Get.snackbar('Error', 'Description is required.',
          colorText: Pallete.whiteColor,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }

    if (moreInfo.isEmpty) {
      Get.snackbar('Error', 'Description is required.',
          colorText: Pallete.whiteColor,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds

          backgroundColor: Pallete.originBlue);
      return;
    }

    appointmentController.isLoading(true);
    showLoadingDialog(); // Show loading dialog
    final bool isSuccess = await appointmentController.AddBookingContrller(
        clientId: clientId,
        visitDate: visitDate,
        visitTime: visitTime,
        serviceType: serviceType,
        status: status,
        paymentStatus: paymentStatus,
        street: street,
        city: city,
        state: state,
        latitude: latitude,
        longtitude: longtitude,
        moreInfo: moreInfo);

    appointmentController.isLoading(false);
    hideLoadingDialog(); // Hide loading dialog

    if (isSuccess) {
      Get.snackbar('Success', appointmentController.successMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          duration:
              const Duration(seconds: 10), // Set the duration to 10 seconds
          colorText: Pallete.whiteColor);
    } else {
      Get.snackbar('Error', appointmentController.errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Pallete.originBlue,
          duration: Duration(seconds: 10), // Set the duration to 10 seconds
          colorText: Pallete.whiteColor);
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





  Future<bool> validateAndSubmitFormTwo({
    required AppointmentModel appointment,
  }) async{
    // Check if tasks are empty

      final bool answerSuccess = await  appointmentController.updateAppointmentById(
        appointmentModel: appointment,
      );

      if (!answerSuccess) {
        // If visit update fails, log and return false
        DevLogs.logError('Failed to update assessment: ${appointment.id}');
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














}
