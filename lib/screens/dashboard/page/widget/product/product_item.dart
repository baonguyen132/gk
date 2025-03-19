import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gk/model/ProductModal.dart';
import 'package:gk/screens/dashboard/page/widget/product/product_item_image.dart';
import 'package:gk/screens/dashboard/page/widget/product/product_item_infor.dart';

class ProductItem extends StatefulWidget {
  final DocumentSnapshot product;
  Function (String id) handleDelete ;
  Function (ProductModal product) handleUpdate ;

  ProductItem({super.key , required this.product , required this.handleDelete , required this.handleUpdate});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    var data = widget.product.data() as Map<String, dynamic>;
    var id = widget.product.id ;
    return MediaQuery.of(context).size.width > 1000 ?
    Container(
      height: 280,
      width: 360,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: Colors.blue,
              width: 3
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProductItemImage(
              width: 150,
              height: MediaQuery.of(context).size.height,
              borderRadius: const  BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),

              ),
            urlImage: data["hinhanh"],
          ),
          ProductItemInfor(
            tensp: data["tensp"],
            loaisp: data["loaisp"],
            gia: data["gia"].toString(),
            handleUpdate: () {
              widget.handleUpdate(ProductModal(id: widget.product.id, tensp: data["tensp"], loaisp: data["loaisp"], gia: data["gia"], hinhanh: data["hinhanh"]));
            },
            handleDelete: () {
              widget.handleDelete(id) ;
            },
          ),

        ],
      ),

    )

    :

    Container(
      height: 520,
      width: 330,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
              color: Colors.blue,
              width: 3
          )
      ),
      child: Column(
        children: [
          ProductItemImage(
            width: MediaQuery.of(context).size.width,
            height: 300,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            urlImage: data["hinhanh"],
          ),
          ProductItemInfor(
            tensp: data["tensp"],
            loaisp: data["loaisp"],
            gia: data["gia"].toString(),
            handleUpdate: () {
              widget.handleUpdate(ProductModal(id: widget.product.id, tensp: data["tensp"], loaisp: data["loaisp"], gia: data["gia"], hinhanh: data["hinhanh"]));
            },
            handleDelete: () {
              widget.handleDelete(id) ;
            },
          )
        ],
      ),
    );
  }
}
