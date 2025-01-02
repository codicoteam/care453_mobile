import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/view_care_professionals/service/view_professional_service.dart';
import 'package:care453/models/employee_model.dart';
import 'package:get/get.dart';

class ViewProfessionalController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  var shuttles = <EmployeeModel>[].obs;

  var shuttle = Rxn<EmployeeModel>();

  // Method to fetch all trips
  Future<void> getAllEmployeeForClient() async {
    try {
      isLoading(true); // Start loading
      final response = await ViewProfessionalService.getAllEmployees();

      if (response.success) {
        shuttles.value = response.data ?? [];
        successMessage.value = response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching shuttle: ${e.toString()}');
      errorMessage.value = 'An error occurred while fetching shuttle: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }


  Future<void> refreshTrips() async {
    await getAllEmployeeForClient();
  }
  
  
  }