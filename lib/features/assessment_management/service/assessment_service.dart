import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:http/http.dart' as http;

import '../../../models/get_task_model.dart';

class AssessmentService {
  static Future<APIResponse<List<AssessmentModel>>> fetchAssementByEmployeeId(
      String employeeId) async {
    final String url =
        '${ApiKeys.baseUrl}/asessment_route/employee/$employeeId'; // Changed to `final`
    final headers = {
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}' // Changed to `final`
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching observat: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of AssessmentModel objects
          List<AssessmentModel> assessments = data
              .map((visit) =>
                  AssessmentModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<AssessmentModel>>(
            data: assessments,
            success: true,
            message: 'assessments retrieved successfully',
          );
        } else {
          return APIResponse<List<AssessmentModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<AssessmentModel>>(
          success: false,
          message:
              'Failed to load assessments. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<AssessmentModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<String>> updateAssessmentById({
    required AssessmentModel assessmentModel,
    required String Answer,
  }) async {
    final String url =
        '${ApiKeys.baseUrl}/asessment_route/update/${assessmentModel.id}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${ApiKeys.bearerTokent}',
    };
    final body = json.encode({
      "employeeId": assessmentModel.employeeId!.id!,
      "question": assessmentModel.question,
      "answer": Answer,
      "clue": assessmentModel.clue,
      "reason": assessmentModel.reason,
      "criteria": assessmentModel.criteria,
      "score": assessmentModel.score,
      "date": assessmentModel.date,
      "adminId": assessmentModel.adminId!.id!,
    });
    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      DevLogs.logSuccess(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Assessment updated successfully',
          message: 'Assessment updated successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to update assessment. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error updating assessment: $e',
      );
    }
  }
}
