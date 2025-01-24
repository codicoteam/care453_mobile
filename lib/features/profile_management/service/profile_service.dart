import 'dart:convert';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  static Future<APIResponse<String>> createClientProfile(
      {required String firstName,
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
      required String medicalhistory}) async {
    const String url =
        'https://care-give-backend.onrender.com/api/v1/clients/signup';
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
          "status": "Unknown"
        }
      ],
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Profile created successfully',
          message: 'Profile created successfully',
        );
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
}
