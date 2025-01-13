import 'dart:convert';
import 'dart:ffi';
import 'package:care453/core/constants/api_keys.dart';
import 'package:care453/core/utils/api_response/ap_response.dart';
import 'package:care453/core/utils/logs.dart';
import 'package:care453/models/assesment_model.dart';
import 'package:http/http.dart' as http;
import '../../../models/appointment_model.dart';
import '../../../models/get_task_model.dart';

class AppointmentService {
  static Future<APIResponse<List<AppointmentModel>>> fetchAppointmentForClient(
      String employeeId) async {
    final String url = '${ApiKeys.baseUrl}/booking_route/client/$employeeId';
    final headers = {
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DevLogs.logError('Error fetching observat: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          List<dynamic> data = jsonResponse['data'];
          // Convert the data into a list of VisitModel objects
          List<AppointmentModel> visits = data
              .map((visit) =>
                  AppointmentModel.fromMap(visit as Map<String, dynamic>))
              .toList();
          return APIResponse<List<AppointmentModel>>(
            data: visits,
            success: true,
            message: 'Visits retrieved successfully',
          );
        } else {
          return APIResponse<List<AppointmentModel>>(
            success: false,
            message:
                'Unexpected response structure: data not found or not a list',
          );
        }
      } else {
        return APIResponse<List<AppointmentModel>>(
          success: false,
          message: 'Failed to load visits. HTTP Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return APIResponse<List<AppointmentModel>>(
        success: false,
        message: 'Error: $e',
      );
    }
  }

  static Future<APIResponse<String>> addBooking({
    required String clientId,
    required String visitDate,
    required String visitTime,
    required String serviceType,
    required String status,
    required String paymentStatus,
    required String street,
    required String city,
    required String state,
    required double latitude,
    required double longtitude,
    required String moreInfo,
  }) async {
    const String url =
        '${ApiKeys.baseUrl}/booking_route/create';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ${ApiKeys.bearerTokent}',
    };
    final body = json.encode({
      "clientId": clientId,
      "visitDate": visitDate,
      "visitTime": visitTime,
      "serviceType": serviceType,
      "clientAddress": {
        "street": street,
        "city": city,
        "state": state,
        "zipCode": "12345",
        "latitude": latitude,
        "longtitude": longtitude
      },
      "status": status,
      "paymentStatus": paymentStatus,
      "more_info": moreInfo,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Booking created successfully',
          message: 'Booking created successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to create booking. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error creating booking: $e',
      );
    }
  }




  static Future<APIResponse<String>> updateAppointmentById({
    required AppointmentModel appointmentModel,
  }) async {
    final String url =
        '${ApiKeys.baseUrl}/booking_route/update/${appointmentModel.id}';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiKeys.bearerTokent}',
    };
    final body = json.encode({
      "clientId": appointmentModel.clientId.id,
      "visitDate": appointmentModel.visitDate,
      "visitTime": appointmentModel.visitTime,
      "serviceType": appointmentModel.serviceType,
      "clientAddress": {
        "street": appointmentModel.clientAddress.street,
        "city": appointmentModel.clientAddress.city,
        "state": appointmentModel.clientAddress.state,
        "zipCode": "12345",
        "latitude": appointmentModel.clientAddress.latitude,
        "longtitude": appointmentModel.clientAddress.longtitude
      },
      "status": appointmentModel.status,
      "paymentStatus": appointmentModel.paymentStatus,
      "more_info": appointmentModel.moreInfo,
    });

    try {
      final response =
          await http.put(Uri.parse(url), headers: headers, body: body);
      DevLogs.logSuccess(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final responseData = json.decode(response.body);
        return APIResponse<String>(
          success: true,
          data: responseData['message'] ?? 'Appointment updated successfully',
          message: 'Appointment updated successfully',
        );
      } else {
        return APIResponse<String>(
          success: false,
          message:
              'Failed to update appointment. HTTP Status: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return APIResponse<String>(
        success: false,
        message: 'Error updating appointment: $e',
      );
    }
  }



}
