import 'dart:convert';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/models/employee_model.dart';
import 'package:http/http.dart' as http;

class ViewProfessionalService {
  static Future<APIResponse<List<EmployeeModel>>> getAllEmployees() async {
    const String url = '${ApiKeys.baseUrl}/employee/getallemployees';
    const headers = {
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}'
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];

          // Convert the data into a list of Employee objects
          List<EmployeeModel> employees = data
              .map((employee) => EmployeeModel.fromMap(employee as Map<String, dynamic>))
              .toList();

          return APIResponse<List<EmployeeModel>>(
            data: employees,
            success: true,
            message: 'Employees retrieved successfully',
          );
        } else {
          return APIResponse<List<EmployeeModel>>(
            success: false,
            message: 'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<EmployeeModel>>(
          success: false,
          message: 'Failed to load employees. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<EmployeeModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }
}
