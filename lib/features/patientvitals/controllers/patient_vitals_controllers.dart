import 'package:care453/core/utils/logs.dart';
import 'package:care453/models/patient_vitals_model.dart';
import 'package:get/get.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';

import '../services/patient_vital_service.dart';

class PatientVitalsControllers extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  var patientVitals = <PatientVitalsModel>[].obs;
  var patientVital = Rxn<PatientVitalsModel>();
  // Method to fetch all trips
  Future<void> getAllPatientVitalsForClient(String clientId) async {
    try {
      isLoading(true); // Start loading
      final response =
          await PatientVitalService.fetchPatientVitalsByEmployeeId(clientId);
      if (response.success) {
        patientVitals.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Shuttle loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching patient vitals: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching patient vitals: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshPatientVitalsForClient(String clientId) async {
    await getAllPatientVitalsForClient(clientId);
  }

  Future<void> getAllPatientVitalsForVisitId(String visitId) async {
    try {
      isLoading(true); // Start loading
      final response =
          await PatientVitalService.fetchPatientVitalsByVisitId(visitId);
      if (response.success) {
        patientVitals.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Patient Vitals loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching patient vitals: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching patient vitals: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshPatientVitalsForVisitId(String visitId) async {
    await getAllPatientVitalsForVisitId(visitId);
  }

  Future<bool> addPatientVitals({
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
    try {
      isLoading(true); // Start loading
      final response = await PatientVitalService.addPatientVitals(
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

  Future<bool> EditPatientVitals({
    required String patientVitalsid,
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
    try {
      isLoading(true); // Start loading
      final response = await PatientVitalService.editPatientVitals(
          patientVitalsid: patientVitalsid,
          visitId: visitId,
          patientId: patientId,
          temperature: temperature,
          systolic: systolic,
          diastolic: diastolic,
          heartRate: heartRate,
          respiratoryRate: respiratoryRate,
          oxygenSaturation: oxygenSaturation,
          notes: notes);

      if (response.success) {
        successMessage.value = response.message!;
        return true;
      } else {
        errorMessage.value = response.message!;
        DevLogs.logError(errorMessage.value);
        return false;
      }
    } catch (e) {
      DevLogs.logError('Error Editing Patient Vitals: ${e.toString()}');
      errorMessage.value =
          'An error occurred while Editing Patient Vitals: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }
}
