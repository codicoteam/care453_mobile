import 'dart:convert';

import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:http/http.dart' as http;

class TaskService {
  static Future<APIResponse<String>> updateTaskPerVisit({
    required String taskId,
    required String name,
    required String description,
    required String visitId,
    required String status,
    required String assignedBy,
  }) async {
    final String url = '${ApiKeys.baseUrl}/task_route/update/$taskId';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${ApiKeys.bearerTokent}',
    };
    final body = json.encode({
      "name": name,
      "description": description,
      "visitId": visitId,
      "status": status,
      "assignedBy": assignedBy,
    });

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Task updated successfully',
          message: 'Task updated successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to update task. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error updating task: $e',
      );
    }
  }
}
