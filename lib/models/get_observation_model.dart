import 'dart:convert';

class GetObservationModel {
    final String? id;
    final VisitId? visitId;
    final EmployeeId? employeeId;
    final String? description;
    final String? date;
    final List<String>? images;
    final String? createdAt;
    final String? updatedAt;
    final int? v;

    GetObservationModel({
        this.id,
        this.visitId,
        this.employeeId,
        this.description,
        this.date,
        this.images,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory GetObservationModel.fromJson(String str) => GetObservationModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetObservationModel.fromMap(Map<String, dynamic> json) => GetObservationModel(
        id: json["_id"],
        visitId: json["visitId"] == null ? null : VisitId.fromMap(json["visitId"]),
        employeeId: json["employeeId"] == null ? null : EmployeeId.fromMap(json["employeeId"]),
        description: json["description"],
        date: json["date"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "visitId": visitId?.toMap(),
        "employeeId": employeeId?.toMap(),
        "description": description,
        "date": date,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class EmployeeId {
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

    EmployeeId({
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

    factory EmployeeId.fromJson(String str) => EmployeeId.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EmployeeId.fromMap(Map<String, dynamic> json) => EmployeeId(
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
