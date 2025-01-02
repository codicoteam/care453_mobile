import 'dart:convert';

class GetMedicationModel {
    final String? id;
    final String? name;
    final String? dosage;
    final String? description;
    final String? frequency;
    final PrescribedBy? prescribedBy;
    final VisitId? visitId;
    final ClientId? clientId;
    final String? status;
    final String? createdAt;
    final String? updatedAt;
    final int? v;

    GetMedicationModel({
        this.id,
        this.name,
        this.dosage,
        this.description,
        this.frequency,
        this.prescribedBy,
        this.visitId,
        this.clientId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory GetMedicationModel.fromJson(String str) => GetMedicationModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetMedicationModel.fromMap(Map<String, dynamic> json) => GetMedicationModel(
        id: json["_id"],
        name: json["name"],
        dosage: json["dosage"],
        description: json["description"],
        frequency: json["frequency"],
        prescribedBy: json["prescribedBy"] == null ? null : PrescribedBy.fromMap(json["prescribedBy"]),
        visitId: json["visitId"] == null ? null : VisitId.fromMap(json["visitId"]),
        clientId: json["clientId"] == null ? null : ClientId.fromMap(json["clientId"]),
        status: json["status"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "dosage": dosage,
        "description": description,
        "frequency": frequency,
        "prescribedBy": prescribedBy?.toMap(),
        "visitId": visitId?.toMap(),
        "clientId": clientId?.toMap(),
        "status": status,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
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

class PrescribedBy {
    final String? id;
    final String? firstName;
    final String? lastName;
    final String? profilePicture;
    final String? email;
    final String? contactNumber;
    final String? password;
    final int? v;

    PrescribedBy({
        this.id,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.email,
        this.contactNumber,
        this.password,
        this.v,
    });

    factory PrescribedBy.fromJson(String str) => PrescribedBy.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PrescribedBy.fromMap(Map<String, dynamic> json) => PrescribedBy(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profilePicture: json["profilePicture"],
        email: json["email"],
        contactNumber: json["contactNumber"],
        password: json["password"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
        "email": email,
        "contactNumber": contactNumber,
        "password": password,
        "__v": v,
    };
}

class VisitId {
    final Location? location;
    final String? id;
    final String? clientId;
    final String? careProfessionalId;
    final DateTime? dateOfVisit;
    final String? startTime;
    final String? endTime;
    final String? status;
    final String? officialVisitTime;
    final String? officialEndTime;
    final String? createdAt;
    final String? updatedAt;
    final int? v;

    VisitId({
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

    factory VisitId.fromJson(String str) => VisitId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VisitId.fromMap(Map<String, dynamic> json) => VisitId(
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
        id: json["_id"],
        clientId: json["clientId"],
        careProfessionalId: json["careProfessionalId"],
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
        "clientId": clientId,
        "careProfessionalId": careProfessionalId,
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
