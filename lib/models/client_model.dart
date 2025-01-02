import 'dart:convert';

class ClientModel {
    final String? firstName;
    final String? lastName;
    final String? medicalAidInfo;
    final String? dateOfBirth;
    final String? password;
    final String? profilePicture;
    final String? gender;
    final String? contactNumber;
    final String? address;
    final List<String>? allergies;
    final String? email;
    final List<dynamic>? familyMemberIds;
    final List<MedicalHistory>? medicalHistory;

    ClientModel({
        this.firstName,
        this.lastName,
        this.medicalAidInfo,
        this.dateOfBirth,
        this.password,
        this.profilePicture,
        this.gender,
        this.contactNumber,
        this.address,
        this.allergies,
        this.email,
        this.familyMemberIds,
        this.medicalHistory,
    });

    factory ClientModel.fromJson(String str) => ClientModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientModel.fromMap(Map<String, dynamic> json) => ClientModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        medicalAidInfo: json["medicalAidInfo"],
        dateOfBirth: json["dateOfBirth"],
        password: json["password"],
        profilePicture: json["profilePicture"],
        gender: json["gender"],
        contactNumber: json["contactNumber"],
        address: json["address"],
        allergies: json["allergies"] == null ? [] : List<String>.from(json["allergies"]!.map((x) => x)),
        email: json["email"],
        familyMemberIds: json["familyMemberIds"] == null ? [] : List<dynamic>.from(json["familyMemberIds"]!.map((x) => x)),
        medicalHistory: json["medicalHistory"] == null ? [] : List<MedicalHistory>.from(json["medicalHistory"]!.map((x) => MedicalHistory.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "medicalAidInfo": medicalAidInfo,
        "dateOfBirth": dateOfBirth,
        "password": password,
        "profilePicture": profilePicture,
        "gender": gender,
        "contactNumber": contactNumber,
        "address": address,
        "allergies": allergies == null ? [] : List<dynamic>.from(allergies!.map((x) => x)),
        "email": email,
        "familyMemberIds": familyMemberIds == null ? [] : List<dynamic>.from(familyMemberIds!.map((x) => x)),
        "medicalHistory": medicalHistory == null ? [] : List<dynamic>.from(medicalHistory!.map((x) => x.toMap())),
    };
}

class MedicalHistory {
    final String? condition;
    final DateTime? startDate;
    final String? status;

    MedicalHistory({
        this.condition,
        this.startDate,
        this.status,
    });

    factory MedicalHistory.fromJson(String str) => MedicalHistory.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MedicalHistory.fromMap(Map<String, dynamic> json) => MedicalHistory(
        condition: json["condition"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "condition": condition,
        "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "status": status,
    };
}
