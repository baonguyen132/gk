import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import '../data/ConstraintData.dart';



import 'package:http_parser/http_parser.dart';

class UserModel {
  String? id ;
  String name;
  String email;
  String password;
  String cccd;


  UserModel({
    this.id ,
    required this.name,
    required this.email,
    required this.password,
    required this.cccd,

  });

  // ✅ Chuyển JSON thành Object
  factory UserModel.fromJson(List<dynamic> json) {
    return UserModel(
      id: json[0].toString(),
      name: json[1].toString() ,
      email: json[2].toString() ,
      password: json[3].toString(),
      cccd: json[5].toString(),

    );
  }
  factory UserModel.fromJsons(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"].toString(),
      name: json["name"].toString(),
      email: json["email"].toString(),
      password: json["password"].toString(),
      cccd: json["cccd"].toString(),
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
    };
  }

  void insertdata() {
    CollectionReference collRef = FirebaseFirestore.instance.collection("account");
    collRef.add({
      'name': name,
      'email': email,
      'password': password,
      'cccd': cccd ,
    });
  }

  static Future<bool> loginUser(String email, String password) async {
    try {
      var collection = FirebaseFirestore.instance.collection('account');
      var querySnapshot = await collection.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data(); // Lấy dữ liệu người dùng

        if (userData['password'] == password) {
          print("Đăng nhập thành công! Dữ liệu người dùng: $userData");
          return true ;
        } else {
          print("Sai mật khẩu!");
          return false ;
        }
      } else {
        print("Email không tồn tại!");
        return false ;
      }
    } catch (e) {
      print("Lỗi khi đăng nhập: $e");
      return false ;
    }
  }



}

