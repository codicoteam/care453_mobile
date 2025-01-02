import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/assessment_management/service/assessment_service.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:get/get.dart';

class AssessmentController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  var assessments = <AssessmentModel>[].obs;
  var assessment = Rxn<AssessmentModel>();
  // Method to fetch all trips
  Future<void> getAllAllAssessmentForEmployee(String employeeId) async {
    try {
      isLoading(true); // Start loading
      final response =
          await AssessmentService.fetchAssementByEmployeeId(employeeId);
      if (response.success) {
        assessments.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching assessments: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching assessments: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshSsessments(String employeeId) async {
    await getAllAllAssessmentForEmployee(employeeId);
  }

  Future<bool> updateAssessmentById({
    required String answer,
    required AssessmentModel assessment,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await AssessmentService.updateAssessmentById(
          assessmentModel: assessment, Answer: answer);

      if (response.success) {
        successMessage.value = response.message!;
        return true;
      } else {
        errorMessage.value = response.message!;
        DevLogs.logError(errorMessage.value);
        return false;
      }
    } catch (e) {
      DevLogs.logError('Error adding observation: ${e.toString()}');
      errorMessage.value =
          'An error occurred while adding observation: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }
}
