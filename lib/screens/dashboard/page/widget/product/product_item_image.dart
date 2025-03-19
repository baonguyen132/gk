import 'package:flutter/material.dart';
import 'package:gk/data/ConstraintData.dart';

class ProductItemImage extends StatefulWidget {
  double width ;
  double height ;
  BorderRadius borderRadius ;

  String urlImage ;
  ProductItemImage({super.key , required this.width , required this.height , required this.borderRadius , required this.urlImage});

  @override
  State<ProductItemImage> createState() => _ProductItemImageState();
}

class _ProductItemImageState extends State<ProductItemImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        image: DecorationImage(
          image: NetworkImage("${location}/${widget.urlImage}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
