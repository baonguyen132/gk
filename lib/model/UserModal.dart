import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../data/ConstraintData.dart';



import 'package:http_parser/http_parser.dart';

class UserModel {
  String? id ;
  String name;
  String email;
  String password;
  String cccd;
  String dob;
  String gender;
  String address;
  String token;
  String? status ;

  UserModel({
    this.id ,
    required this.name,
    required this.email,
    required this.password,
    required this.cccd,
    required this.dob,
    required this.gender,
    required this.address,
    this.status ,
    this.token = "some_token",
  });

  // ✅ Chuyển JSON thành Object
  factory UserModel.fromJson(List<dynamic> json) {
    return UserModel(
      id: json[0].toString(),
      name: json[1].toString() ,
      email: json[2].toString() ,
      password: json[3].toString(),
      cccd: json[5].toString(),
      dob: (json[6]),
      gender: json[7].toString() ,
      address: json[9].toString() ,
      token: json[10].toString() ,
      status: json[4].toString()
    );
  }
  factory UserModel.fromJsons(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"].toString(),
      name: json["name"].toString(),
      email: json["email"].toString(),
      password: json["password"].toString(),
      cccd: json["cccd"].toString(),
      dob: json["dob"].toString(),
      gender: json["gender"].toString(),
      address: json["address"].toString(),
      token: json["token"].toString(),
        status: json["status"].toString()
    );
  }
  // Chuyển từ Object thành JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "cccd": cccd,
      "dob": dob,
      "gender": gender,
      "address": address,
      "status": status ,
      "token": token,
    };
  }

  static loadUserName() {}

  static login(String text, String text2) {}


}

