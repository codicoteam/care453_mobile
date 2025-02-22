import 'dart:convert';

class AuthResponseModel {
    final String? message;
    final Data? data;
    final String? token;

    AuthResponseModel({
        this.message,
        this.data,
        this.token,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "data": data?.toMap(),
        "token": token,
    };
}

class Data {
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
    final String? id;
    final int? v;

    Data({
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
        this.id,
        this.v,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
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
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
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
        "_id": id,
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
