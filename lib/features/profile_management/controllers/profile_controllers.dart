import 'package:care453/models/client_model.dart';
import 'package:get/get.dart';

import '../../../core/utils/logs.dart';
import '../../../models/employee_model.dart';
import '../service/profile_service.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;
  Future<bool> createClientProfile({
    required String firstName,
    required String medicalhistory,
    required String lastName,
    required String medicalAidInfo,
    required String dateOfBirth,
    required String password,
    required String profilePicture,
    required String gender,
    required String contactNumber,
    required String address,
    required String allergies,
    required String email,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await ProfileService.createClientProfile(
        firstName: firstName,
        lastName: lastName,
        medicalAidInfo: medicalAidInfo,
        dateOfBirth: dateOfBirth,
        password: password,
        medicalhistory: medicalhistory,
        profilePicture: profilePicture,
        gender: gender,
        contactNumber: contactNumber,
        address: address,
        allergies: allergies,
        email: email,
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
      DevLogs.logError('Error creating client profile: ${e.toString()}');
      errorMessage.value =
          'An error occurred while creating client profile: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }

  var clientProfile = Rxn<ClientModel>();
  // Method to fetch all trips
  Future<void> getProfileClient({required String clientEmail}) async {
    try {
      isLoading(true); // Start loading
      final response =
          await ProfileService.fetchClientByEmail(clientEmail: clientEmail);
      if (response.success) {
        clientProfile.value = response.data;
        successMessage.value =
            response.message ?? 'Profile loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching Client Profile: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching client profile: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<bool> updateClientProfile({
    required String firstName,
    required String medicalhistory,
    required String lastName,
    required String medicalAidInfo,
    required String dateOfBirth,
    required String password,
    required String profilePicture,
    required String gender,
    required String contactNumber,
    required String address,
    required String allergies,
    required String email,
  }) async {
    try {
      isLoading(true); // Start loading
      final response = await ProfileService.updateClientByEmail(
        firstName: firstName,
        lastName: lastName,
        medicalAidInfo: medicalAidInfo,
        dateOfBirth: dateOfBirth,
        password: password,
        medicalhistory: medicalhistory,
        profilePicture: profilePicture,
        gender: gender,
        contactNumber: contactNumber,
        address: address,
        allergies: allergies,
        email: email,
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
      DevLogs.logError('Error creating client profile: ${e.toString()}');
      errorMessage.value =
          'An error occurred while creating client profile: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<void> refreshGetProfileByEmail(String email) async {
    await getProfileClient(clientEmail: email);
  }

  var employeeProfile = Rxn<EmployeeModel>();
  // Method to fetch all trips
  Future<void> getEmployeeByEmail({required String employeeEmail}) async {
    try {
      isLoading(true); // Start loading
      final response = await ProfileService.fetchEmployeeByEmail(
          employeeEmail: employeeEmail);
      if (response.success) {
        employeeProfile.value = response.data;
        successMessage.value =
            response.message ?? 'Profile loaded successfully';
      } else {
        errorMessage.value = response.message!;
      }
    } catch (e) {
      DevLogs.logError('Error fetching Employee Profile: ${e.toString()}');
      errorMessage.value =
          'An error occurred while fetching employee profile: ${e.toString()}';
    } finally {
      isLoading(false); // End loading
    }
  }
}
