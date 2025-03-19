
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModal {
  String? id ;
  String tensp;
  String loaisp;
  int gia;
  String hinhanh;

  ProductModal({
    this.id ,
    required this.tensp,
    required this.loaisp,
    required this.gia,
    required this.hinhanh,

  });

  void insertdata() {
    CollectionReference collRef = FirebaseFirestore.instance.collection("product");
    collRef.add({
      'tensp': tensp,
      'loaisp': loaisp,
      'gia': gia,
      'hinhanh': hinhanh ,
    });
  }

}