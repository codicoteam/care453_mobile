import 'package:care453/features/auth/Services/auth_services.dart';
import 'package:get/get.dart';

import '../../../core/utils/logs.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var successMessage = ''.obs;
  var errorMessage = ''.obs;

  // Observable list for fetched trips
  Future<bool> authSignInRequest({
    required String emailAddress,
    required String password,
  }) async {
    try {
      isLoading(true);
      final response = await AuthServices.login(
        emailAddress: emailAddress,
        password: password,
      );
      if (response.success) {
        successMessage.value = response.message!;
        // await fetchAllShuttlesForClient();
        return true;
      } else {
        errorMessage.value = response.message!;
        DevLogs.logError(errorMessage.value);
        return false;
      }
    } catch (e) {
      DevLogs.logError('Error submitting vehicle request: ${e.toString()}');
      errorMessage.value =
          'An error occurred while submitting vehicle request: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }

  Future<bool> authSignUpRequest({
    required String emailAddress,
    required String password,
    required String userName,
  }) async {
    try {
      isLoading(true);
      final response = await AuthServices.signUpWithVerification(
        emailAddress: emailAddress,
        password: password,
        userName: userName,      );
      if (response.success) {
        successMessage.value = response.message!;
        return true;
      } else {
        errorMessage.value = response.message!;
        DevLogs.logError(errorMessage.value);
        return false;
      }
    } catch (e) {
      DevLogs.logError('Error submitting sign-up request: ${e.toString()}');
      errorMessage.value =
          'An error occurred while submitting sign-up request: ${e.toString()}';
      return false;
    } finally {
      isLoading(false); // End loading
    }
  }
}
