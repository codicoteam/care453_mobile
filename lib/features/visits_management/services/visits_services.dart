import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/models/get_medicine_model.dart';
import 'package:care453/models/get_observation_model.dart';
import 'package:care453/models/visit_model.dart';
import 'package:http/http.dart' as http;

import '../../../models/get_task_model.dart';

class VisitsServices {
  static Future<APIResponse<List<VisitModel>>> fetchVisitsForClient() async {
    const String url =
        '${ApiKeys.baseUrl}/visit_route/client/676297d66ec829a1a595dca6';
    const headers = {'Authorization': 'Bearer ${ApiKeys.bearerTokent}'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching observat: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of VisitModel objects
          List<VisitModel> visits = data
              .map((visit) => VisitModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<VisitModel>>(
            data: visits,
            success: true,
            message: 'Visits retrieved successfully',
          );
        } else {
          return APIResponse<List<VisitModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<VisitModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<VisitModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<List<VisitModel>>>
      fetchVisitsForEmployeeid() async {
    const String url =
        '${ApiKeys.baseUrl}/visit_route/emplyeeid/67689853376e63cab46a0f44';
    const headers = {'Authorization': 'Bearer ${ApiKeys.bearerTokent}'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching observat: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of VisitModel objects
          List<VisitModel> visits = data
              .map((visit) => VisitModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<VisitModel>>(
            data: visits,
            success: true,
            message: 'Visits retrieved successfully',
          );
        } else {
          return APIResponse<List<VisitModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<VisitModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<VisitModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<List<GetTaskModel>>> fetchTaskPerVisitForClient(
      String visitId) async {
    final String url = '${ApiKeys.baseUrl}/task_route/visit/$visitId';
    const headers = {'Authorization': 'Bearer ${ApiKeys.bearerTokent}'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of GetTaskModel objects
          List<GetTaskModel> visits = data
              .map((visit) =>
                  GetTaskModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<GetTaskModel>>(
            data: visits,
            success: true,
            message: 'Task retrieved successfully',
          );
        } else {
          return APIResponse<List<GetTaskModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<GetTaskModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<GetTaskModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<List<GetMedicationModel>>>
      fetchMedicationPerVisitForClient(String visitId) async {
    final String url = '${ApiKeys.baseUrl}/medication_route/visit/$visitId';
    const headers = {'Authorization': 'Bearer ${ApiKeys.bearerTokent}'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of GetMedicationModel objects
          List<GetMedicationModel> visits = data
              .map((visit) =>
                  GetMedicationModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<GetMedicationModel>>(
            data: visits,
            success: true,
            message: 'Task retrieved successfully',
          );
        } else {
          return APIResponse<List<GetMedicationModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<GetMedicationModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<GetMedicationModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<List<GetObservationModel>>>
      fetchObservationPerVisitForClient(String visitId) async {
    final String url = '${ApiKeys.baseUrl}/observation_route/visit/$visitId';
    const headers = {'Authorization': 'Bearer ${ApiKeys.bearerTokent}'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        DevLogs.logSuccess('Error fetching observat: ${response.body}');

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of GetObservationModel objects
          List<GetObservationModel> visits = data
              .map((visit) =>
                  GetObservationModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<GetObservationModel>>(
            data: visits,
            success: true,
            message: 'Task retrieved successfully',
          );
        } else {
          return APIResponse<List<GetObservationModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<GetObservationModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<GetObservationModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<String>> updateVisitById({
    required String visitId,
    required String clientId,
    required String careProfessionalId,
    required double latitude,
    required double longitude,
    required String dateOfVisit,
    required String startTime,
    required String endTime,
    required String status,
    required String officialVisitTime,
    required String officialEndTime,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };
    final body = json.encode({
      "clientId": clientId,
      "careProfessionalId": careProfessionalId,
      "location": {
        "latitude": latitude,
        "longitude": longitude,
      },
      "DateOfVisit": dateOfVisit,
      "startTime": startTime,
      "endTime": endTime,
      "status": status,
      "officialVisitTime": officialVisitTime,
      "officialEndTime": officialEndTime,
    });

    try {
      final String url = '${ApiKeys.baseUrl}/visit_route/update/$visitId';
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseData = json.decode(await response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Visit updated successfully',
          message: 'Visit updated successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to update visit. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error updating visit: $e',
      );
    }
  }

  static Future<APIResponse<List<VisitModel>>>
      fetchVisitsForEmployeeForTheMonth({
    required String employeeId,
    required String startDate,
    required String endDate,
  }) async {
    final String url =
        '${ApiKeys.baseUrl}/visit_route/filterByEmployeeAndDateRange?employeeId=$employeeId&startDate=$startDate&endDate=$endDate';
    const headers = {'Authorization': 'Bearer ${ApiKeys.bearerTokent}'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching observat: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of VisitModel objects
          List<VisitModel> visits = data
              .map((visit) => VisitModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<VisitModel>>(
            data: visits,
            success: true,
            message: 'Visits retrieved successfully',
          );
        } else {
          return APIResponse<List<VisitModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<VisitModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<VisitModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }
}
