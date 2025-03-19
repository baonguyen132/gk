import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gk/screens/dashboard/page/widget/product/product_button.dart';
import 'package:gk/theme/theme.dart';

class ProductItemInfor extends StatefulWidget {
  String tensp ;
  String loaisp ;
  String gia ;

  Function () handleDelete ;
  Function () handleUpdate ;

  ProductItemInfor({super.key ,required this.tensp , required this.loaisp , required this.gia , required this.handleDelete , required this.handleUpdate});

  @override
  State<ProductItemInfor> createState() => _ProductItemInforState();
}

class _ProductItemInforState extends State<ProductItemInfor> {
@override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.all(16), // Thêm padding cho nội dung
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
          children: [
            Expanded(
              child: ListView(
                children: [
                  Wrap(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Sản phẩm: ", // Phần có màu xanh
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: widget.tensp, // Phần có màu mặc định
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.maintext, // Đổi màu tùy theo theme nếu cần
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Loại: ", // Phần có màu xanh
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: widget.loaisp, // Phần có màu mặc định
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.maintext, // Đổi màu tùy theo theme nếu cần
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "💰 Giá: ", // Phần có màu xanh
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            TextSpan(
                              text: widget.gia, // Phần có màu mặc định
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.maintext, // Đổi màu tùy theo theme nếu cần
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ) ,
                ],
              ),
            ),
            SizedBox(height: 8) ,
            Row(
              children: [
                Expanded(
                  child: ProductButton(
                    color: Colors.blue,
                    text: "Sửa",
                    hanlde: () {
                      widget.handleUpdate() ;
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ProductButton(
                    color: Colors.red,
                    text: "Xoá",
                    hanlde: () {
                      widget.handleDelete(); // Sửa lại tên hàm từ handleDetele -> handleDelete
                    },
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
