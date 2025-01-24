import 'package:care453/models/group_users_models.dart';
import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:http/http.dart' as http;

class GroupUserService {
  static Future<APIResponse<List<GroupUser>>> fetchUsersInGroup(
      {required String groupId}) async {
    final String url = '${ApiKeys.baseUrl}/groups/$groupId/users';
    const headers = {'Authorization': 'Bearer ${ApiKeys.bearerTokent}'};
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
}
