import 'package:care453/core/utils/logs.dart';
import 'package:get/get.dart';

import '../service/task_service.dart';

class TaskController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  Future<bool> updateTaskPerVisit({
    required String taskId,
    required String name,
    required String description,
    required String visitId,
    required String status,
    required String assignedBy,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await TaskService.updateTaskPerVisit(
        taskId: taskId,
        name: name,
        description: description,
        visitId: visitId,
        status: status,
        assignedBy: assignedBy,
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
      DevLogs.logError('Error updating task: \${e.toString()}');
      errorMessage.value =
          'An error occurred while updating task: \${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }
}
