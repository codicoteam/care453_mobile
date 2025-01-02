import 'dart:convert';

class VisitModel {
    final Location? location;
    final String? id;
    final ClientId? clientId;
    final CareProfessionalId? careProfessionalId;
    final DateTime? dateOfVisit;
    final String? startTime;
    final String? endTime;
    final String? status;
    final String? officialVisitTime;
    final String? officialEndTime;
    final String? createdAt;
    final String? updatedAt;
    final int? v;

    VisitModel({
        this.location,
        this.id,
        this.clientId,
        this.careProfessionalId,
        this.dateOfVisit,
        this.startTime,
        this.endTime,
        this.status,
        this.officialVisitTime,
        this.officialEndTime,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory VisitModel.fromJson(String str) => VisitModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VisitModel.fromMap(Map<String, dynamic> json) => VisitModel(
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
        id: json["_id"],
        clientId: json["clientId"] == null ? null : ClientId.fromMap(json["clientId"]),
        careProfessionalId: json["careProfessionalId"] == null ? null : CareProfessionalId.fromMap(json["careProfessionalId"]),
        dateOfVisit: json["DateOfVisit"] == null ? null : DateTime.parse(json["DateOfVisit"]),
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
        "location": location?.toMap(),
        "_id": id,
        "clientId": clientId?.toMap(),
        "careProfessionalId": careProfessionalId?.toMap(),
        "DateOfVisit": "${dateOfVisit!.year.toString().padLeft(4, '0')}-${dateOfVisit!.month.toString().padLeft(2, '0')}-${dateOfVisit!.day.toString().padLeft(2, '0')}",
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
    final WorkingHours? workingHours;
    final String? id;
    final String? firstName;
    final String? lastName;
    final String? profilePicture;
    final String? email;
    final String? contactNumber;
    final String? address;
    final String? specialization;
    final String? employmentType;
    final bool? hasCar;
    final String? carDetails;
    final bool? insurance;
    final String? insuranceDetails;
    final String? password;
    final int? v;

    CareProfessionalId({
        this.workingHours,
        this.id,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.email,
        this.contactNumber,
        this.address,
        this.specialization,
        this.employmentType,
        this.hasCar,
        this.carDetails,
        this.insurance,
        this.insuranceDetails,
        this.password,
        this.v,
    });

    factory CareProfessionalId.fromJson(String str) => CareProfessionalId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CareProfessionalId.fromMap(Map<String, dynamic> json) => CareProfessionalId(
        workingHours: json["workingHours"] == null ? null : WorkingHours.fromMap(json["workingHours"]),
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
        "workingHours": workingHours?.toMap(),
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
    final String? startHour;
    final String? endHour;

    WorkingHours({
        this.startHour,
        this.endHour,
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
    final String? id;
    final String? firstName;
    final String? lastName;
    final String? medicalAidInfo;
    final String? profilePicture;
    final String? dateOfBirth;
    final String? gender;
    final String? contactNumber;
    final String? address;
    final List<String>? allergies;
    final String? email;
    final String? password;
    final List<dynamic>? familyMemberIds;
    final List<MedicalHistory>? medicalHistory;
    final int? v;

    ClientId({
        this.id,
        this.firstName,
        this.lastName,
        this.medicalAidInfo,
        this.profilePicture,
        this.dateOfBirth,
        this.gender,
        this.contactNumber,
        this.address,
        this.allergies,
        this.email,
        this.password,
        this.familyMemberIds,
        this.medicalHistory,
        this.v,
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
        allergies: json["allergies"] == null ? [] : List<String>.from(json["allergies"]!.map((x) => x)),
        email: json["email"],
        password: json["password"],
        familyMemberIds: json["familyMemberIds"] == null ? [] : List<dynamic>.from(json["familyMemberIds"]!.map((x) => x)),
        medicalHistory: json["medicalHistory"] == null ? [] : List<MedicalHistory>.from(json["medicalHistory"]!.map((x) => MedicalHistory.fromMap(x))),
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
        "allergies": allergies == null ? [] : List<dynamic>.from(allergies!.map((x) => x)),
        "email": email,
        "password": password,
        "familyMemberIds": familyMemberIds == null ? [] : List<dynamic>.from(familyMemberIds!.map((x) => x)),
        "medicalHistory": medicalHistory == null ? [] : List<dynamic>.from(medicalHistory!.map((x) => x.toMap())),
        "__v": v,
    };
}

class MedicalHistory {
    final String? condition;
    final String? startDate;
    final String? status;
    final String? id;

    MedicalHistory({
        this.condition,
        this.startDate,
        this.status,
        this.id,
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
    final double? latitude;
    final double? longitude;
    final String? address;

    Location({
        this.latitude,
        this.longitude,
        this.address,
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
