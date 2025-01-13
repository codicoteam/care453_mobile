
import 'dart:convert';

import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/models/runner_model.dart';
import '../../../core/utils/api_response/ap_response.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/logs.dart';
class RunnerService {
    static Future<APIResponse<List<RunnerModel>>> fetchRunnerByEmployeeId(
      String employeeId) async {
    final String url =
        '${ApiKeys.baseUrl}/runner_route/employee/$employeeId';
    final headers = {
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of VisitModel objects
                DevLogs.logError('Error fetching observat: ${response.body}');

          List<RunnerModel> visits = data
              .map((visit) =>
                  RunnerModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<RunnerModel>>(
            data: visits,
            success: true,
            message: 'Visits retrieved successfully',
          );
        } else {
          return APIResponse<List<RunnerModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<RunnerModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<RunnerModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

}