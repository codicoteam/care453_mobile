import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/casched_data.dart';

class UserService {
  static Future<APIResponse<String>> addUser({
    required String email,
    required String userId,
    required String lastName,
    required String firstName,
    required String profilePicture,
    required String role,
  }) async {
    final token = await CacheUtils.checkToken();
    const String url = '${ApiKeys.baseUrl}/users';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    };
    final body = json.encode({
      "email": email,
      "userId": userId,
      "first_name": firstName,
      "last_name": lastName,
      "profile_picture": profilePicture,
      "role": role,
      "online": true,
      "lastSeen": "2025-01-18T12:00:00Z"
    });
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      DevLogs.logSuccess(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'User added successfully',
          message: 'User added successfully',
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
        message: 'Error adding User: $e',
      );
    }
  }
}
