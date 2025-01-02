import 'dart:convert';

import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:http/http.dart' as http;

class MedicationService {
  static Future<APIResponse<String>> updateMedicationPerVisit({
    required String medicationId,
    required String name,
    required String dosage,
    required String frequency,
    required String description,
    required String prescribedBy,
    required String visitId,
    required String clientId,
    required String status,
  }) async {
    // Define the base URL for your API

    // Properly construct the URL
    final String url = '${ApiKeys.baseUrl}/medication_route/update/$medicationId';

    // Include the JWT token in the headers, not the URL
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };

    final body = json.encode({
      "name": name,
      "dosage": dosage,
      "frequency": frequency,
      "description": description,
      "prescribedBy": prescribedBy,
      "visitId": visitId,
      "clientId": clientId,
      "status": status,
    });

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Medication updated successfully',
          message: 'Medication updated successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to update medication. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error updating medication: $e',
      );
    }
  }
}
