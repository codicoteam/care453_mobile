import 'package:get/get.dart';

import '../../../core/utils/logs.dart';
import '../service/profile_service.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;
  Future<bool> createClientProfile({
    required String firstName,
    required String lastName,
    required String medicalAidInfo,
    required String dateOfBirth,
    required String password,
    required String profilePicture,
    required String gender,
    required String contactNumber,
    required String address,
    required List<String> allergies,
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
}
