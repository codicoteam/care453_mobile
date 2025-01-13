import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/runner_management/service/runner_service.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:care453/models/runner_model.dart';
import 'package:get/get.dart';

class RunnerController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  var runners = <RunnerModel>[].obs;
  var runner = Rxn<RunnerModel>();
  // Method to fetch all trips
  Future<void> getAllAllRunnersForEmployee(String employeeId) async {
    try {
      isLoading(true); // Start loading
      final response =
          await RunnerService.fetchRunnerByEmployeeId(employeeId);
      if (response.success) {
        runners.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching runners: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching runners: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshRunners(String employeeId) async {
    await getAllAllRunnersForEmployee(employeeId);
  }
}
