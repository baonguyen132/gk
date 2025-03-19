import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gk/model/ProductModal.dart';
import 'package:gk/screens/dashboard/page/widget/history/widget_button_custom.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int frame = 1 ;

  Widget getFrame() {
    if(frame == 1 ) {
      return Container(
        color: Colors.red,
        height: 200,
      );
    }
    else {
      return Container(
        color: Colors.blue,
        height: 200,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Wrap(
            alignment: MediaQuery.of(context).size.width <= 500 ? WrapAlignment.center : WrapAlignment.start,
            children: [
              WidgetButtonCustom(
                  handle: () {
                    setState(() {
                      frame = 1 ;
                    });
                  },
                  text: "Sản phẩm"
              ),
              WidgetButtonCustom(
                  handle: () {
                    setState(() {
                      frame = 2 ;
                    });
                    ProductModal s = ProductModal(tensp: "AA", loaisp: "Máy tính", gia: 2000, hinhanh: "sss");
                    s.insertdata();
                  },
                  text: "Thêm sản phẩm"
              ),

            ],
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: getFrame(),
            )
        )
      ],
    );
  }
}
