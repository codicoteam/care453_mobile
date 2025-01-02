import 'dart:convert';

class GetTaskModel {
    final String? id;
    final String? name;
    final String? description;
    final VisitId? visitId;
    final String? status;
    final AssignedBy? assignedBy;
    final String? createdAt;
    final String? updatedAt;
    final int? v;

    GetTaskModel({
        this.id,
        this.name,
        this.description,
        this.visitId,
        this.status,
        this.assignedBy,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory GetTaskModel.fromJson(String str) => GetTaskModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GetTaskModel.fromMap(Map<String, dynamic> json) => GetTaskModel(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        visitId: json["visitId"] == null ? null : VisitId.fromMap(json["visitId"]),
        status: json["status"],
        assignedBy: json["assignedBy"] == null ? null : AssignedBy.fromMap(json["assignedBy"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "visitId": visitId?.toMap(),
        "status": status,
        "assignedBy": assignedBy?.toMap(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class AssignedBy {
    final String? id;
    final String? firstName;
    final String? lastName;
    final String? profilePicture;
    final String? email;
    final String? contactNumber;
    final String? password;
    final int? v;

    AssignedBy({
        this.id,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.email,
        this.contactNumber,
        this.password,
        this.v,
    });

    factory AssignedBy.fromJson(String str) => AssignedBy.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AssignedBy.fromMap(Map<String, dynamic> json) => AssignedBy(
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
