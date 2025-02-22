import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/visits_management/services/visits_services.dart';
import 'package:care453/models/get_medicine_model.dart';
import 'package:care453/models/get_observation_model.dart';
import 'package:care453/models/get_task_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:get/get.dart';

class VisitController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  var visits = <VisitModel>[].obs;
  var visit = Rxn<VisitModel>();
  // Method to fetch all trips
  Future<void> getAllVisitsForClient({required String clientId}) async {
    try {
      isLoading(true); // Start loading
      final response = await VisitsServices.fetchVisitsForClient(clientId: clientId);
      if (response.success) {
        visits.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching visits: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching visits: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshTrips({required String clientId}) async {
    await getAllVisitsForClient(clientId: clientId);
  }

  Future<void> getAllVisitsForEmployee({required String employeeid}) async {
    try {
      isLoading(true); // Start loading
      final response = await VisitsServices.fetchVisitsForEmployeeid(employeeId: employeeid);
      if (response.success) {
        visits.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching visits: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching visits: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshEmployeeVisits({required String employeeid}) async {
    await getAllVisitsForEmployee(employeeid: employeeid);
  }

  Future<void> getAllVisitsForEmployeeAndDateFilter({
    required String employeeId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await VisitsServices.fetchVisitsForEmployeeForTheMonth(
          employeeId: employeeId, startDate: startDate, endDate: endDate);
      if (response.success) {
        visits.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching visits: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching visits: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshEmployeeVisitsAndDateFilter({
    required String employeeId,
    required String startDate,
    required String endDate,
  }) async {
    await getAllVisitsForEmployeeAndDateFilter(employeeId: employeeId, startDate: startDate, endDate: endDate);
  }

  // Observable list for fetched trips
  var tasks = <GetTaskModel>[].obs;
  var task = Rxn<GetTaskModel>();
  // Method to fetch all trips

  Future<void> getAllTaskPerVisitForClient(String visitid) async {
    try {
      isLoading(true); // Start loading
      final response = await VisitsServices.fetchTaskPerVisitForClient(visitid);
      if (response.success) {
        tasks.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching tasks: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching tasks: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshTasks(String visitId) async {
    await getAllTaskPerVisitForClient(visitId);
  }

  // Observable list for fetched trips
  var medications = <GetMedicationModel>[].obs;
  var medication = Rxn<GetMedicationModel>();
  // Method to fetch all trips

  Future<void> getAllMedicationPerVisitForClient(String visitid) async {
    try {
      isLoading(true); // Start loading
      final response =
          await VisitsServices.fetchMedicationPerVisitForClient(visitid);
      if (response.success) {
        medications.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching tasks: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching tasks: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshMedicine(String visitId) async {
    await getAllMedicationPerVisitForClient(visitId);
  }

  // Observable list for fetched trips
  var observations = <GetObservationModel>[].obs;
  var observation = Rxn<GetObservationModel>();
  // Method to fetch all trips

  Future<void> getAllObservationPerVisitForClient(String visitid) async {
    try {
      isLoading(true); // Start loading
      final response =
          await VisitsServices.fetchObservationPerVisitForClient(visitid);
      if (response.success) {
        observations.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Observation loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching observation: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching observation: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshObservation(String visitId) async {
    await getAllObservationPerVisitForClient(visitId);
  }

  Future<bool> updateVisitById({
    required String visitId,
    required String clientId,
    required String careProfessionalId,
    required double latitude,
    required double longitude,
    required String dateOfVisit,
    required String startTime,
    required String endTime,
    required String status,
    required String officialVisitTime,
    required String officialEndTime,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await VisitsServices.updateVisitById(
        visitId: visitId,
        clientId: clientId,
        careProfessionalId: careProfessionalId,
        latitude: latitude,
        longitude: longitude,
        dateOfVisit: dateOfVisit,
        startTime: startTime,
        endTime: endTime,
        status: status,
        officialVisitTime: officialVisitTime,
        officialEndTime: officialEndTime,
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
      DevLogs.logError('Error updating visit: ${e.toString()}');
      errorMessage.value =
          'An error occurred while updating visit: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }
}
