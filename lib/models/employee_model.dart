import 'dart:convert';

class EmployeeModel {
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

    EmployeeModel({
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

    factory EmployeeModel.fromJson(String str) => EmployeeModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EmployeeModel.fromMap(Map<String, dynamic> json) => EmployeeModel(
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
