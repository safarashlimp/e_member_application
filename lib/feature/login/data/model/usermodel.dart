import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String status;
    List<Datum> data;

    UserModel({required this.status, required this.data});

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["Status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    String mobile;
    String clientid;

    Datum({required this.id, required this.name, required this.mobile, required this.clientid});

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        clientid: json["Clientid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "Clientid": clientid,
    };
}
