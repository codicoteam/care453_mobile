import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/models/client_model.dart';
import 'package:care453/models/employee_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_field/phone_number.dart';
import 'package:unicons/unicons.dart';

import '../../../core/utils/casched_data.dart';
import '../../message_management/services/group_user_service.dart';
import '../../message_management/services/user_service.dart';

class ProfileService {
  static Future<APIResponse<String>> createClientProfile({
    required String firstName,
    required String lastName,
    required String medicalAidInfo,
    required String dateOfBirth,
    required String password,
    required String profilePicture,
    required String gender,
    required String contactNumber,
    required String address,
    required String allergies,
    required String email,
    required String medicalhistory,
  }) async {
    const String url = '${ApiKeys.baseUrl}/clients/signup';
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "firstName": firstName,
      "lastName": lastName,
      "medicalAidInfo": medicalAidInfo,
      "dateOfBirth": dateOfBirth,
      "password": password,
      "profilePicture": profilePicture,
      "gender": gender,
      "contactNumber": contactNumber,
      "address": address,
      "allergies": ["$allergies"],
      "email": email,
      "familyMemberIds": [],
      "medicalHistory": [
        {
          "condition": "$medicalhistory",
          "startDate": "2021-01-01",
          "status": "Ongoing"
        }
      ],
    });
    DevLogs.logWarning(body);

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);

        if (responseData.containsKey("data") &&
            responseData["data"].containsKey("_id")) {
          String userId = responseData["data"]["_id"];
          final token = responseData['token'];
          CacheUtils.storeToken(token: "$token");
          // Call addUser service
          final userResponse = await UserService.addUser(
            email: email,
            userId: userId,
            lastName: lastName,
            firstName: firstName,
            profilePicture: profilePicture,
            role: "Client",
          );

          if (!userResponse.success) {
            return APIResponse<String>(
              success: false,
              message:
                  'Profile created, but failed to add user: ${userResponse.message}',
            );
          }

          // Call addGroup service
          final groupResponse =
              await GroupUserService.addGroup(groupId: userId);

          if (!groupResponse.success) {
            return APIResponse<String>(
              success: false,
              message:
                  'Profile created, user added, but failed to add group: ${groupResponse.message}',
            );
          }

          return APIResponse<String>(
            success: true,
            data: responseData['message'] ?? 'Profile created successfully',
            message: 'Profile, user, and group created successfully',
          );
        } else {
          return APIResponse<String>(
            success: false,
            message: 'Profile created, but user ID is missing in response',
          );
        }
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to create profile. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error creating profile: $e',
      );
    }
  }

  static Future<APIResponse<ClientModel>> fetchClientByEmail(
      {required String clientEmail}) async {
    final token = await CacheUtils.checkToken();

    final String url = '${ApiKeys.baseUrl}/clients/getclient/$clientEmail';
    final headers = {'Authorization': 'Bearer $token'};

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Response: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is Map) {
          ClientModel client =
              ClientModel.fromMap(jsonResponse['data'] as Map<String, dynamic>);
          return APIResponse<ClientModel>(
            data: client,
            success: true,
            message: 'Client retrieved successfully',
          );
        } else {
          return APIResponse<ClientModel>(
            success: false,
            message:
                'Unexpected response structure: data not found or incorrect',
          );
        }
      } else if (response.statusCode == 404) {
        return APIResponse<ClientModel>(
          success: false,
          message: 'Client not found',
        );
      } else {
        return APIResponse<ClientModel>(
          success: false,
          message:
              'Failed to fetch client. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<ClientModel>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<EmployeeModel>> fetchEmployeeByEmail(
      {required String employeeEmail}) async {
    final token = await CacheUtils.checkToken();
    final String url = '${ApiKeys.baseUrl}/employee/getemployee/$employeeEmail';
    final headers = {'Authorization': 'Bearer $token'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Response: ${employeeEmail}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is Map) {
          EmployeeModel client = EmployeeModel.fromMap(
              jsonResponse['data'] as Map<String, dynamic>);
          return APIResponse<EmployeeModel>(
            data: client,
            success: true,
            message: 'Client retrieved successfully',
          );
        } else {
          return APIResponse<EmployeeModel>(
            success: false,
            message:
                'Unexpected response structure: data not found or incorrect',
          );
        }
      } else if (response.statusCode == 404) {
        return APIResponse<EmployeeModel>(
          success: false,
          message: 'Client not found',
        );
      } else {
        return APIResponse<EmployeeModel>(
          success: false,
          message:
              'Failed to fetch client. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<EmployeeModel>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<String>> updateClientByEmail({
    required String firstName,
    required String lastName,
    required String medicalAidInfo,
    required String dateOfBirth,
    required String password,
    required String profilePicture,
    required String gender,
    required String contactNumber,
    required String address,
    required String allergies,
    required String email,
    required String medicalhistory,
  }) async {
    final token = await CacheUtils.checkToken();

    final String url = '${ApiKeys.baseUrl}/clients/updateclient/$email';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    };
    final body = json.encode({
      "firstName": firstName,
      "lastName": lastName,
      "medicalAidInfo": medicalAidInfo,
      "dateOfBirth": dateOfBirth,
      "password": password,
      "profilePicture": profilePicture,
      "gender": gender,
      "contactNumber": contactNumber,
      "address": address,
      "allergies": ["${allergies}"],
      "familyMemberIds": [],
      "medicalHistory": [
        {
          "condition": "$medicalhistory",
          "startDate": "2021-01-01",
          "status": "Chronic"
        }
      ]
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
