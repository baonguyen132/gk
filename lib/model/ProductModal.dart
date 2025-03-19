
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

  static Future<void> deleteProduct(String productId) async {
    await FirebaseFirestore.instance.collection('product').doc(productId).delete();
    print("Đã xoá sản phẩm có ID: $productId");
  }

  static Future<void> updateProduct(String id, String tensp, String loaisp, int gia , String hinhanh) async {
    try {
      await FirebaseFirestore.instance.collection('product').doc(id).update({
        'tensp': tensp,
        'loaisp': loaisp,
        'gia': gia,
        'hinhanh': hinhanh ,
      });
      print("Cập nhật thành công!");
    } catch (e) {
      print("Lỗi khi cập nhật: $e");
    }
  }

}