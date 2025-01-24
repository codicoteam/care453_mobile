import 'dart:convert';

class GroupUser {
    final String? id;
    final String? email;
    final String? firstName;
    final String? lastName;
    final String? profilePicture;
    final String? role;
    final bool? online;
    final String? lastSeen;
    final int? v;

    GroupUser({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.role,
        this.online,
        this.lastSeen,
        this.v,
    });

    factory GroupUser.fromJson(String str) => GroupUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GroupUser.fromMap(Map<String, dynamic> json) => GroupUser(
        id: json["_id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profilePicture: json["profile_picture"],
        role: json["role"],
        online: json["online"],
        lastSeen: json["lastSeen"],
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "profile_picture": profilePicture,
        "role": role,
        "online": online,
        "lastSeen": lastSeen,
        "__v": v,
    };
}
