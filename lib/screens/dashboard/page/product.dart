import 'package:flutter/material.dart';
import 'package:gk/screens/dashboard/page/widget/product/widget_form_insert_product.dart';
import 'package:gk/screens/dashboard/page/widget/product/widget_list_product.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool frame = true ;

  Widget getFrame() {
    if(frame) {
      return WidgetListProduct();
    }
    else {
      return WidgetFormInsertProduct();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: getFrame(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            frame = !frame ;
          });
        },
        child: Icon(frame ? Icons.add : Icons.arrow_back),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100),),
      ),
    );
  }
}
