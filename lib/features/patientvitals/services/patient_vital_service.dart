import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/models/patient_vitals_model.dart';
import '../../../core/utils/api_response/ap_response.dart';
import 'package:http/http.dart' as http;
import '../../../core/utils/logs.dart';

class PatientVitalService {
  static Future<APIResponse<List<PatientVitalsModel>>>
      fetchPatientVitalsByEmployeeId(String clientId) async {
    final String url =
        '${ApiKeys.baseUrl}/patient_vitals_route/patient/$clientId';
    final headers = {
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching patient vitals: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of VisitModel objects
          List<PatientVitalsModel> patientVitals = data
              .map((visit) =>
                  PatientVitalsModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<PatientVitalsModel>>(
            data: patientVitals,
            success: true,
            message: 'patientVitals retrieved successfully',
          );
        } else {
          return APIResponse<List<PatientVitalsModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<PatientVitalsModel>>(
          success: false,
          message:
              'Failed to load patientVitals. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<PatientVitalsModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<List<PatientVitalsModel>>>
      fetchPatientVitalsByVisitId(String clientId) async {
    final String url =
        '${ApiKeys.baseUrl}/patient_vitals_route/visit/$clientId';
    final headers = {
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching patient vitals: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of VisitModel objects
          List<PatientVitalsModel> patientVitals = data
              .map((visit) =>
                  PatientVitalsModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<PatientVitalsModel>>(
            data: patientVitals,
            success: true,
            message: 'patientVitals retrieved successfully',
          );
        } else {
          return APIResponse<List<PatientVitalsModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<PatientVitalsModel>>(
          success: false,
          message:
              'Failed to load patientVitals. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<PatientVitalsModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<String>> addPatientVitals({
    required String visitId,
    required String patientId,
    required double temperature,
    required double systolic,
    required double diastolic,
    required double heartRate,
    required double respiratoryRate,
    required double oxygenSaturation,
    required String notes,
  }) async {
    const String url = '${ApiKeys.baseUrl}/patient_vitals_route/create';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };

    final body = json.encode({
      "visitId": visitId,
      "patientId": patientId,
      "temperature": temperature,
      "bloodPressure": {
        "systolic": systolic,
        "diastolic": diastolic,
      },
      "heartRate": heartRate,
      "respiratoryRate": respiratoryRate,
      "oxygenSaturation": oxygenSaturation,
      "notes": notes,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Patient vitals added successfully',
          message: 'Patient vitals added successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to add patient vitals. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error adding patient vitals: $e',
      );
    }
  }

  static Future<APIResponse<String>> editPatientVitals({
    required String patientVitalsid,
    required String visitId,
    required String patientId,
    required double temperature,
    required double systolic,
    required double diastolic,
    required double heartRate,
    required double respiratoryRate,
    required double oxygenSaturation,
    required String notes,
  }) async {
    final String url =
        '${ApiKeys.baseUrl}/patient_vitals_route/update/$patientVitalsid';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };

    final body = json.encode({
      "visitId": visitId,
      "patientId": patientId,
      "temperature": temperature,
      "bloodPressure": {
        "systolic": systolic,
        "diastolic": diastolic,
      },
      "heartRate": heartRate,
      "respiratoryRate": respiratoryRate,
      "oxygenSaturation": oxygenSaturation,
      "notes": notes,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Patient vitals added successfully',
          message: 'Patient vitals added successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to add patient vitals. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error adding patient vitals: $e',
      );
    }
  }
}
