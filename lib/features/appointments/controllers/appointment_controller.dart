import 'dart:ffi';

import 'package:care453/core/utils/logs.dart';
import 'package:care453/features/appointments/service/appointment_service.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:get/get.dart';

import '../../../models/appointment_model.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  var appointments = <AppointmentModel>[].obs;
  var appointment = Rxn<AppointmentModel>();
  // Method to fetch all trips
  Future<void> getAllAllAppointmentForEmployee(String employeeId) async {
    try {
      isLoading(true); // Start loading
      final response =
          await AppointmentService.fetchAppointmentForClient(employeeId);
      if (response.success) {
        appointments.value = response.data ?? [];
        successMessage.value =
            response.message ?? 'Appointment loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching appointments: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching appointments: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshAppointment(String clientId) async {
    await getAllAllAppointmentForEmployee(clientId);
  }

  Future<bool> AddBookingContrller({
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
    try {
      isLoading(true); // Start loading
      final response = await AppointmentService.addBooking(
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

  Future<bool> updateAppointmentById({
    required AppointmentModel appointmentModel,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await AppointmentService.updateAppointmentById(
        appointmentModel: appointmentModel,
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
      DevLogs.logError('Error updating appointment: ${e.toString()}');
      errorMessage.value =
          'An error occurred while updating appointment: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }
}
