import 'package:care453/models/group_users_models.dart';
import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/casched_data.dart';

class GroupUserService {
  static Future<APIResponse<List<GroupUser>>> fetchUsersInGroup(
      {required String groupId}) async {
    final token = await CacheUtils.checkToken();

    final String url = '${ApiKeys.baseUrl}/groups/$groupId/users';
    final headers = {'Authorization': 'Bearer $token'};
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching users: ${response.body}');

      if (response.statusCode == 200) {
        // Decode the JSON response
        final List<dynamic> jsonResponse = json.decode(response.body);

        // Map the JSON response to a list of GroupUser objects
        List<GroupUser> visits = jsonResponse
            .map((visit) => GroupUser.fromMap(visit as Map<String, dynamic>))
            .toList();
        DevLogs.logError('Error fetching users: ${visits}');

        return APIResponse<List<GroupUser>>(
          data: visits,
          success: true,
          message: 'Users retrieved successfully',
        );
      } else {
        return APIResponse<List<GroupUser>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<GroupUser>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<String>> addGroup({
    required String groupId,
  }) async {
    final token = await CacheUtils.checkToken();
    const String url = '${ApiKeys.baseUrl}/groups';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}',
    };
    final body = json.encode({"groupId": groupId});
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
