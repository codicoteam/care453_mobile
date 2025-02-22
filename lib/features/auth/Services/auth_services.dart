import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/casched_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;import 'package:logger/logger.dart';

class AuthServices {


  static Future<APIResponse<String>> login({
    required String emailAddress,
    required String password,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    var request = http.Request(
      'POST',
      Uri.parse('${ApiKeys.baseUrl}/clients/login'),
    );

    request.body = json.encode({
      "email": emailAddress,
      "password": password,
    });

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Parse the response
        final responseData = json.decode(await response.stream.bytesToString());

        // Extract the token from the response
        final token = responseData['token'];
        CacheUtils.storeToken(token: "$token");
        print('Login successful. Token: $token');

        return APIResponse(
          success: true,
          message: responseData['message'],
          data: token,
        );
      } else {
        // Parse the error response
        final errorData = json.decode(await response.stream.bytesToString());
        final errorMessage = errorData['message'] ?? 'Login failed';

        print('Error: $errorMessage');

        return APIResponse(
          success: false,
          message: errorMessage,
          data: null,
        );
      }
    } catch (e) {
      // Handle any other exceptions
      print('An error occurred: $e');

      return APIResponse(
        success: false,
        message: 'An error occurred: $e',
        data: null,
      );
    }
  }



  static Future<APIResponse<String>> loginEmployee({
    required String emailAddress,
    required String password,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var request = http.Request(
      'POST',
      Uri.parse('${ApiKeys.baseUrl}/employee/login'),
    );
    request.body = json.encode({
      "email": emailAddress,
      "password": password,
    });

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Parse the response
        final responseData = json.decode(await response.stream.bytesToString());

        // Extract the token from the response
        final token = responseData['token'];
        CacheUtils.storeToken(token: "$token");
        print('Login successful. Token: $token');

        return APIResponse(
          success: true,
          message: responseData['message'],
          data: token,
        );
      } else {
        // Parse the error response
        final errorData = json.decode(await response.stream.bytesToString());
        final errorMessage = errorData['message'] ?? 'Login failed';

        print('Error: $errorMessage');

        return APIResponse(
          success: false,
          message: errorMessage,
          data: null,
        );
      }
    } catch (e) {
      // Handle any other exceptions
      print('An error occurred: $e');

      return APIResponse(
        success: false,
        message: 'An error occurred: $e',
        data: null,
      );
    }
  }




static Future<APIResponse<String>> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return APIResponse(
      success: true,
      message: 'Sign-out successful',
      data: null,
    );
  } catch (e) {
    return APIResponse(
      success: false,
      message: 'Sign-out failed: ${e.toString()}',
      data: null,
    );
  }
}





  // Assuming this method exists elsewhere in your cod
}
