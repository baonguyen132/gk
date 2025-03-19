import 'package:flutter/material.dart';

class ProductButton extends StatefulWidget {
  Color color ;
  String text ;
  Function () hanlde  ;

  ProductButton({super.key , required this.color , required this.text , required this.hanlde});

  @override
  State<ProductButton> createState() => _ProductButtonState();
}

class _ProductButtonState extends State<ProductButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.hanlde() ;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 1),
                )
              ]
          ),
          height: 50,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold, // Chữ đậm hơn
                color: Colors.black87,
                decoration: TextDecoration.none
            ),
          ),
        ),
      ),
    );
  }
}
