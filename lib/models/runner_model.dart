import 'package:meta/meta.dart';
import 'dart:convert';

class RunnerModel {
    final String id;
    final String name;
    final String description;
    final String status;
    final EmployeeId employeeId;
    final List<Visit> visits;
    final String dateAssigned;
    final int v;

    RunnerModel({
        required this.id,
        required this.name,
        required this.description,
        required this.status,
        required this.employeeId,
        required this.visits,
        required this.dateAssigned,
        required this.v,
    });

    factory RunnerModel.fromJson(String str) => RunnerModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RunnerModel.fromMap(Map<String, dynamic> json) => RunnerModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
        employeeId: EmployeeId.fromMap(json["employeeId"]),
        visits: List<Visit>.from(json["visits"].map((x) => Visit.fromMap(x))),
        dateAssigned: json["dateAssigned"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "status": status,
        "employeeId": employeeId.toMap(),
        "visits": List<dynamic>.from(visits.map((x) => x.toMap())),
        "dateAssigned": dateAssigned,
        "__v": v,
    };
}

class EmployeeId {
    final String id;
    final String firstName;
    final String lastName;
    final String email;

    EmployeeId({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
    });

    factory EmployeeId.fromJson(String str) => EmployeeId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EmployeeId.fromMap(Map<String, dynamic> json) => EmployeeId(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
    };
}

class Visit {
    final Location location;
    final String id;
    final ClientId clientId;
    final CareProfessionalId careProfessionalId;
    final String dateOfVisit;
    final String startTime;
    final String endTime;
    final String status;
    final String officialVisitTime;
    final String officialEndTime;
    final String createdAt;
    final String updatedAt;
    final int v;

    Visit({
        required this.location,
        required this.id,
        required this.clientId,
        required this.careProfessionalId,
        required this.dateOfVisit,
        required this.startTime,
        required this.endTime,
        required this.status,
        required this.officialVisitTime,
        required this.officialEndTime,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Visit.fromJson(String str) => Visit.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Visit.fromMap(Map<String, dynamic> json) => Visit(
        location: Location.fromMap(json["location"]),
        id: json["_id"],
        clientId: ClientId.fromMap(json["clientId"]),
        careProfessionalId: CareProfessionalId.fromMap(json["careProfessionalId"]),
        dateOfVisit: json["DateOfVisit"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        status: json["status"],
        officialVisitTime: json["officialVisitTime"],
        officialEndTime: json["officialEndTime"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "location": location.toMap(),
        "_id": id,
        "clientId": clientId.toMap(),
        "careProfessionalId": careProfessionalId.toMap(),
        "DateOfVisit": dateOfVisit,
        "startTime": startTime,
        "endTime": endTime,
        "status": status,
        "officialVisitTime": officialVisitTime,
        "officialEndTime": officialEndTime,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class CareProfessionalId {
    final WorkingHours workingHours;
    final String id;
    final String firstName;
    final String lastName;
    final String profilePicture;
    final String email;
    final String contactNumber;
    final String address;
    final String specialization;
    final String employmentType;
    final bool hasCar;
    final String carDetails;
    final bool insurance;
    final String insuranceDetails;
    final String password;
    final int v;

    CareProfessionalId({
        required this.workingHours,
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.profilePicture,
        required this.email,
        required this.contactNumber,
        required this.address,
        required this.specialization,
        required this.employmentType,
        required this.hasCar,
        required this.carDetails,
        required this.insurance,
        required this.insuranceDetails,
        required this.password,
        required this.v,
    });

    factory CareProfessionalId.fromJson(String str) => CareProfessionalId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CareProfessionalId.fromMap(Map<String, dynamic> json) => CareProfessionalId(
        workingHours: WorkingHours.fromMap(json["workingHours"]),
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        address: json["address"],
        specialization: json["specialization"],
        employmentType: json["employmentType"],
        hasCar: json["hasCar"],
        carDetails: json["carDetails"],
        insurance: json["insurance"],
        insuranceDetails: json["insuranceDetails"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "workingHours": workingHours.toMap(),
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "email": email,
        "contactNumber": contactNumber,
        "address": address,
        "specialization": specialization,
        "employmentType": employmentType,
        "hasCar": hasCar,
        "carDetails": carDetails,
        "insurance": insurance,
        "insuranceDetails": insuranceDetails,
        "password": password,
        "__v": v,
    };
}

class WorkingHours {
    final String startHour;
    final String endHour;

    WorkingHours({
        required this.startHour,
        required this.endHour,
    });

    factory WorkingHours.fromJson(String str) => WorkingHours.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory WorkingHours.fromMap(Map<String, dynamic> json) => WorkingHours(
        startHour: json["startHour"],
        endHour: json["endHour"],
    );

    Map<String, dynamic> toMap() => {
        "startHour": startHour,
        "endHour": endHour,
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

class Location {
    final double latitude;
    final double longitude;

    Location({
        required this.latitude,
        required this.longitude,
    });

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}
