import 'package:meta/meta.dart';
import 'dart:convert';

class AppointmentModel {
    final ClientAddress clientAddress;
    final String id;
    final ClientId clientId;
    final String visitDate;
    final String visitTime;
    final String serviceType;
    final String status;
    final String paymentStatus;
    final String moreInfo;
    final String createdAt;
    final String updatedAt;
    final int v;

    AppointmentModel({
        required this.clientAddress,
        required this.id,
        required this.clientId,
        required this.visitDate,
        required this.visitTime,
        required this.serviceType,
        required this.status,
        required this.paymentStatus,
        required this.moreInfo,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory AppointmentModel.fromJson(String str) => AppointmentModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AppointmentModel.fromMap(Map<String, dynamic> json) => AppointmentModel(
        clientAddress: ClientAddress.fromMap(json["clientAddress"]),
        id: json["_id"],
        clientId: ClientId.fromMap(json["clientId"]),
        visitDate: json["visitDate"],
        visitTime: json["visitTime"],
        serviceType: json["serviceType"],
        status: json["status"],
        paymentStatus: json["paymentStatus"],
        moreInfo: json["more_info"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "clientAddress": clientAddress.toMap(),
        "_id": id,
        "clientId": clientId.toMap(),
        "visitDate": visitDate,
        "visitTime": visitTime,
        "serviceType": serviceType,
        "status": status,
        "paymentStatus": paymentStatus,
        "more_info": moreInfo,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class ClientAddress {
    final String street;
    final String city;
    final String state;
    final String zipCode;
    final double latitude;
    final double longtitude;

    ClientAddress({
        required this.street,
        required this.city,
        required this.state,
        required this.zipCode,
        required this.latitude,
        required this.longtitude,
    });

    factory ClientAddress.fromJson(String str) => ClientAddress.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientAddress.fromMap(Map<String, dynamic> json) => ClientAddress(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        latitude: json["latitude"]?.toDouble(),
        longtitude: json["longtitude"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "street": street,
        "city": city,
        "state": state,
        "zipCode": zipCode,
        "latitude": latitude,
        "longtitude": longtitude,
    };
}

class ClientId {
    final String id;
    final String firstName;
    final String lastName;
    final String medicalAidInfo;
    final String profilePicture;
    final String dateOfBirth;
    final String gender;
    final String contactNumber;
    final String address;
    final List<String> allergies;
    final String email;
    final String password;
    final List<dynamic> familyMemberIds;
    final List<MedicalHistory> medicalHistory;
    final int v;

    ClientId({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.medicalAidInfo,
        required this.profilePicture,
        required this.dateOfBirth,
        required this.gender,
        required this.contactNumber,
        required this.address,
        required this.allergies,
        required this.email,
        required this.password,
        required this.familyMemberIds,
        required this.medicalHistory,
        required this.v,
    });

    factory ClientId.fromJson(String str) => ClientId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientId.fromMap(Map<String, dynamic> json) => ClientId(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        medicalAidInfo: json["medicalAidInfo"],
        profilePicture: json["profilePicture"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        contactNumber: json["contactNumber"],
        address: json["address"],
        allergies: List<String>.from(json["allergies"].map((x) => x)),
        email: json["email"],
        password: json["password"],
        familyMemberIds: List<dynamic>.from(json["familyMemberIds"].map((x) => x)),
        medicalHistory: List<MedicalHistory>.from(json["medicalHistory"].map((x) => MedicalHistory.fromMap(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "medicalAidInfo": medicalAidInfo,
        "profilePicture": profilePicture,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "contactNumber": contactNumber,
        "address": address,
        "allergies": List<dynamic>.from(allergies.map((x) => x)),
        "email": email,
        "password": password,
        "familyMemberIds": List<dynamic>.from(familyMemberIds.map((x) => x)),
        "medicalHistory": List<dynamic>.from(medicalHistory.map((x) => x.toMap())),
        "__v": v,
    };
}

class MedicalHistory {
    final String condition;
    final String startDate;
    final String status;
    final String id;

    MedicalHistory({
        required this.condition,
        required this.startDate,
        required this.status,
        required this.id,
    });

    factory MedicalHistory.fromJson(String str) => MedicalHistory.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MedicalHistory.fromMap(Map<String, dynamic> json) => MedicalHistory(
        condition: json["condition"],
        startDate: json["startDate"],
        status: json["status"],
        id: json["_id"],
    );

    Map<String, dynamic> toMap() => {
        "condition": condition,
        "startDate": startDate,
        "status": status,
        "_id": id,
    };
}
