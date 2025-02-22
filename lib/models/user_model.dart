import 'dart:convert';

class UserModel {
    final String? id;
    final String? email;
    final String? firstName;
    final String? lastName;
    final int? iat;
    final int? exp;

    UserModel({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.iat,
        this.exp,
    });

    factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        iat: json["iat"],
        exp: json["exp"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "iat": iat,
        "exp": exp,
    };
}
