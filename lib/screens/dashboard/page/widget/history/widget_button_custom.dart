import 'package:flutter/material.dart';
import 'package:gk/theme/theme.dart';

class WidgetButtonCustom extends StatefulWidget {
  Function () handle ;
  String text ;
  WidgetButtonCustom({super.key , required this.handle , required this.text});

  @override
  State<WidgetButtonCustom> createState() => _WidgetButtonCustomState();
}

class _WidgetButtonCustomState extends State<WidgetButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handle() ;
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 200,
          decoration: BoxDecoration(
              color: Colors.blue,
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
            textAlign: TextAlign.center,
            style:  TextStyle(
              fontSize: 18,
              color: Colors.white,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w100
            ),
          ),
        ),
      ),
    );
  }
}
