import 'package:meta/meta.dart';
import 'dart:convert';

class PatientVitalsModel {
    final BloodPressure bloodPressure;
    final String id;
    final VisitId visitId;
    final PatientId patientId;
    final double temperature;
    final int heartRate;
    final int respiratoryRate;
    final int oxygenSaturation;
    final String recordedAt;
    final String notes;
    final int v;

    PatientVitalsModel({
        required this.bloodPressure,
        required this.id,
        required this.visitId,
        required this.patientId,
        required this.temperature,
        required this.heartRate,
        required this.respiratoryRate,
        required this.oxygenSaturation,
        required this.recordedAt,
        required this.notes,
        required this.v,
    });

    factory PatientVitalsModel.fromJson(String str) => PatientVitalsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientVitalsModel.fromMap(Map<String, dynamic> json) => PatientVitalsModel(
        bloodPressure: BloodPressure.fromMap(json["bloodPressure"]),
        id: json["_id"],
        visitId: VisitId.fromMap(json["visitId"]),
        patientId: PatientId.fromMap(json["patientId"]),
        temperature: json["temperature"]?.toDouble(),
        heartRate: json["heartRate"],
        respiratoryRate: json["respiratoryRate"],
        oxygenSaturation: json["oxygenSaturation"],
        recordedAt: json["recordedAt"],
        notes: json["notes"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "bloodPressure": bloodPressure.toMap(),
        "_id": id,
        "visitId": visitId.toMap(),
        "patientId": patientId.toMap(),
        "temperature": temperature,
        "heartRate": heartRate,
        "respiratoryRate": respiratoryRate,
        "oxygenSaturation": oxygenSaturation,
        "recordedAt": recordedAt,
        "notes": notes,
        "__v": v,
    };
}

class BloodPressure {
    final int systolic;
    final int diastolic;

    BloodPressure({
        required this.systolic,
        required this.diastolic,
    });

    factory BloodPressure.fromJson(String str) => BloodPressure.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BloodPressure.fromMap(Map<String, dynamic> json) => BloodPressure(
        systolic: json["systolic"],
        diastolic: json["diastolic"],
    );

    Map<String, dynamic> toMap() => {
        "systolic": systolic,
        "diastolic": diastolic,
    };
}

class PatientId {
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

    PatientId({
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

    factory PatientId.fromJson(String str) => PatientId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PatientId.fromMap(Map<String, dynamic> json) => PatientId(
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

class VisitId {
    final Location location;
    final String id;
    final String clientId;
    final String careProfessionalId;
    final String amountPaidPerHour;
    final DateTime dateOfVisit;
    final String startTime;
    final String endTime;
    final String status;
    final String description;
    final String officialVisitTime;
    final String officialEndTime;
    final String createdAt;
    final String updatedAt;
    final int v;

    VisitId({
        required this.location,
        required this.id,
        required this.clientId,
        required this.careProfessionalId,
        required this.amountPaidPerHour,
        required this.dateOfVisit,
        required this.startTime,
        required this.endTime,
        required this.status,
        required this.description,
        required this.officialVisitTime,
        required this.officialEndTime,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory VisitId.fromJson(String str) => VisitId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VisitId.fromMap(Map<String, dynamic> json) => VisitId(
        location: Location.fromMap(json["location"]),
        id: json["_id"],
        clientId: json["clientId"],
        careProfessionalId: json["careProfessionalId"],
        amountPaidPerHour: json["amount_paid_per_hour"],
        dateOfVisit: DateTime.parse(json["DateOfVisit"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
        status: json["status"],
        description: json["description"],
        officialVisitTime: json["officialVisitTime"],
        officialEndTime: json["officialEndTime"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "_id": id,
        "clientId": clientId,
        "careProfessionalId": careProfessionalId,
        "amount_paid_per_hour": amountPaidPerHour,
        "DateOfVisit": "${dateOfVisit.year.toString().padLeft(4, '0')}-${dateOfVisit.month.toString().padLeft(2, '0')}-${dateOfVisit.day.toString().padLeft(2, '0')}",
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
        "description": description,
        "officialVisitTime": officialVisitTime,
        "officialEndTime": officialEndTime,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class Location {
    final double latitude;
    final double longitude;
    final String address;

    Location({
        required this.latitude,
        required this.longitude,
        required this.address,
    });

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
    };
}
