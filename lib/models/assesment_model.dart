import 'package:meta/meta.dart';
import 'dart:convert';

class AssessmentModel {
    final String id;
    final Id employeeId;
    final String question;
    final String answer;
    final String clue;
    final String reason;
    final List<Criterion> criteria;
    final int score;
    final String date;
    final Id adminId;
    final String createdAt;
    final String updatedAt;
    final int v;

    AssessmentModel({
        required this.id,
        required this.employeeId,
        required this.question,
        required this.answer,
        required this.clue,
        required this.reason,
        required this.criteria,
        required this.score,
        required this.date,
        required this.adminId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory AssessmentModel.fromJson(String str) => AssessmentModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AssessmentModel.fromMap(Map<String, dynamic> json) => AssessmentModel(
        id: json["_id"],
        employeeId: Id.fromMap(json["employeeId"]),
        question: json["question"],
        answer: json["answer"],
        clue: json["clue"],
        reason: json["reason"],
        criteria: List<Criterion>.from(json["criteria"].map((x) => Criterion.fromMap(x))),
        score: json["score"],
        date: json["date"],
        adminId: Id.fromMap(json["adminId"]),
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "employeeId": employeeId.toMap(),
        "question": question,
        "answer": answer,
        "clue": clue,
        "reason": reason,
        "criteria": List<dynamic>.from(criteria.map((x) => x.toMap())),
        "score": score,
        "date": date,
        "adminId": adminId.toMap(),
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

class Id {
    final String id;
    final String firstName;
    final String lastName;
    final String email;

    Id({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
    });

    factory Id.fromJson(String str) => Id.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Id.fromMap(Map<String, dynamic> json) => Id(
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

class Criterion {
    final String name;
    final int weight;

    Criterion({
        required this.name,
        required this.weight,
    });

    factory Criterion.fromJson(String str) => Criterion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Criterion.fromMap(Map<String, dynamic> json) => Criterion(
        name: json["name"],
        weight: json["weight"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "weight": weight,
    };
}
