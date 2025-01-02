import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/medication_management/controller/medication_controller.dart';
import 'package:care453/features/task_management/controller/task_controller.dart';
import 'package:care453/features/visits_management/controller/visit_controller.dart';
import 'package:care453/models/get_medicine_model.dart';
import 'package:care453/models/get_task_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitHelper {
  final TaskController taskController = Get.put(TaskController());

  final MedicationController medicationController =
      Get.put(MedicationController());

  final VisitController visitController = Get.put(VisitController());

  bool validateAndSubmitForm({
    required String visitId,
    required List<GetTaskModel> tasks,
  }) {
    // Check if tasks are empty
    if (tasks.isEmpty) {
      Get.snackbar(
        'Error',
        'Tasks are required.',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return false; // Validation failed
    }

    // Check if tasks list is explicitly empty (unnecessary if already checked above, but kept for clarity)
    if (tasks == []) {
      Get.snackbar(
        'Error',
        'Tasks are required.',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 10),
        backgroundColor: Pallete.originBlue,
      );
      return false; // Validation failed
    }

    // Validation succeeded
    Get.snackbar(
      'Success',
      "You have successfully done your task",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Pallete.originBlue,
      duration: const Duration(seconds: 10),
      colorText: Colors.white,
    );
    return true;
  }

  Future<bool> updateTasksAndMedicationAndVisitId({
    required VisitModel visitModel,
    required List<GetTaskModel> tasks,
    required List<GetMedicationModel> medications,
  }) async {
    try {
      // Iterate over tasks with a 3-second delay between updates
      for (final task in tasks) {
        await Future.delayed(const Duration(seconds: 3));
        final taskSuccess = await taskController.updateTaskPerVisit(
          taskId: task.id!,
          name: task.name!,
          description: task.description!,
          visitId: task.visitId!.id!,
          status: "Completed",
          assignedBy: task.assignedBy!.id!,
        );

        if (!taskSuccess) {
          // If a task update fails, log and return false
          DevLogs.logError('Failed to update task: ${task.name}');
          return false;
        }
      }
      // Iterate over medications with a 3-second delay between updates
      for (final medication in medications) {
        await Future.delayed(const Duration(seconds: 3));
        final medicationSuccess =
          await medicationController.updateMedicationPerVisit(
          medicationId: medication.id!,
          name: medication.name!,
          dosage: medication.dosage!,
          frequency: medication.frequency!,
          description: medication.description!,
          prescribedBy: medication.prescribedBy!.id!,
          visitId: medication.visitId!.id!,
          clientId: medication.clientId!.id!,
          status: "Taken"
        );

        if (!medicationSuccess) {
          DevLogs.logError('Failed to update medication: ${medication.name}');
          return false;
        }
      }
      // Update the visit
      final visitSuccess = await visitController.updateVisitById(
        visitId: visitModel.id!,
        careProfessionalId: visitModel.careProfessionalId!.id!,
        clientId: visitModel.clientId!.id!,
        latitude: visitModel.location!.latitude!,
        longitude: visitModel.location!.longitude!,
        dateOfVisit: "${visitModel.dateOfVisit}",
        startTime: visitModel.startTime!,
        endTime: visitModel.endTime!,
        status: "Completed",
        officialVisitTime: visitModel.officialVisitTime!,
        officialEndTime: visitModel.officialEndTime!,
      );

      if (!visitSuccess) {
        // If visit update fails, log and return false
        DevLogs.logError('Failed to update visit: ${visitModel.id}');
        return false;
      }

      // Show a success notification
      Get.snackbar(
        'Success',
        "You have successfully done your task",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Pallete.originBlue,
        duration: const Duration(seconds: 10),
        colorText: Colors.white,
      );
      return true;
    } catch (e) {
      DevLogs.logError('Error updating tasks, medications, or visit: $e');
      return false;
    }
  }


}
