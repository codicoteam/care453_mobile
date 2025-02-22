import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/casched_data.dart';
class ObservationService {
  static Future<APIResponse<String>> addObservations({
    required String visitId,
    required String employeeId,
    required String description,
    required String date,
    required List<String> images,
  }) async {
            final token = await CacheUtils.checkToken();

    const String url =
        '${ApiKeys.baseUrl}/observation_route/create';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    };
    final body = json.encode({
      "visitId": visitId,
      "employeeId": employeeId,
      "description": description,
      "date": date,
      "images": images,
    });
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
              DevLogs.logSuccess(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Observation added successfully',
          message: 'Observation added successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to add observation. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error adding observation: $e',
      );
    }
  }
}
