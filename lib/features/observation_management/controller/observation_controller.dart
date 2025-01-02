import 'package:care453/core/utils/logs.dart';
import 'package:get/get.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';

import '../service/observation_service.dart';

class ObservationController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  Future<bool> addObservation({
    required String visitId,
    required String employeeId,
    required String description,
    required String date,
    required List<String> images,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await ObservationService.addObservations(
        visitId: visitId,
        employeeId: employeeId,
        description: description,
        date: date,
        images: images,
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
      DevLogs.logError('Error adding observation: ${e.toString()}');
      errorMessage.value =
          'An error occurred while adding observation: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }


}
