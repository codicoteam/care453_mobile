import 'package:care453/core/utils/logs.dart';
import 'package:get/get.dart';

import '../services/medication_service.dart';

class MedicationController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;


  Future<bool> updateMedicationPerVisit({
    required String medicationId,
    required String name,
    required String dosage,
    required String frequency,
    required String description,
    required String prescribedBy,
    required String visitId,
    required String clientId,
    required String status,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await MedicationService.updateMedicationPerVisit(
        medicationId: medicationId,
        name: name,
        dosage: dosage,
        frequency: frequency,
        description: description,
        prescribedBy: prescribedBy,
        visitId: visitId,
        clientId: clientId,
        status: status,
      );

      if (response.success) {
        successMessage.value = response.message!;
        return true;
      } else {
        errorMessage.value = response.message!;
        DevLogs.logError(errorMessage.value);
        return false;
      }
    } catch (e) {
      DevLogs.logError('Error updating medication: ${e.toString()}');
      errorMessage.value =
          'An error occurred while updating medication: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }
}
