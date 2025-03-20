import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gk/model/ProductModal.dart';
import 'package:gk/screens/dashboard/page/widget/product/widget_button_custom.dart';
import 'package:gk/util/wiget_textfield_custome.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

import '../../../../../data/ConstraintData.dart';
import 'package:http/http.dart' as http;

class WidgetFormInsertProduct extends StatefulWidget {
  const WidgetFormInsertProduct({super.key});

  @override
  State<WidgetFormInsertProduct> createState() => _WidgetFormInsertProductState();
}

class _WidgetFormInsertProductState extends State<WidgetFormInsertProduct> {
  final ImagePicker _picker = ImagePicker();
  String path = "" ;
  File? _image;

  IconData icon = Icons.close ;
  Color color = Colors.red ;

  TextEditingController tensp = TextEditingController() ;
  TextEditingController loaisp = TextEditingController() ;
  TextEditingController gia = TextEditingController() ;

  static Future<String?> uploadImage(File _image) async {
    try {
      var uri = Uri.parse("$location/upload_image"); // Đổi IP nếu cần
      var request = http.MultipartRequest('POST', uri);

      var mimeType = lookupMimeType(_image.path) ?? 'image/jpeg';

      request.files.add(await http.MultipartFile.fromPath(
        'image',
        _image.path,
        contentType: MediaType.parse(mimeType),
      ));

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(responseBody);
        String imageUrl = jsonResponse["image_path"];
        print(imageUrl);
        return imageUrl;
      } else {
        print("Upload thất bại! Mã lỗi: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Lỗi khi upload ảnh: $e");
      return null;
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null)  {
      path = "" ;
      _image = File(pickedFile.path);
      path = (await uploadImage(_image!))!;
      setState(() {
        icon = Icons.check ;
        color = Colors.green ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WigetTextfieldCustome(controller: tensp, textInputType: TextInputType.text, hint: "Nhập tên sản phẩm", iconData: Icons.drive_file_rename_outline),
        SizedBox(height: 20,),
        WigetTextfieldCustome(controller: loaisp, textInputType: TextInputType.text, hint: "Nhập tên loại sản phẩm", iconData: Icons.bloodtype_outlined),
        SizedBox(height: 20,),

        WigetTextfieldCustome(controller: gia, textInputType: TextInputType.number, hint: "Nhập giá", iconData: Icons.monetization_on),
        SizedBox(height: 20,),
        Row(
          children: [
            Text("Chọn hình ảnh") ,
            SizedBox(width: 10,) ,


            Icon(icon, color: color,),

            SizedBox(width: 10,) ,
            Expanded(
                child: WidgetButtonCustom(
                    handle: () {
                      _pickImage(ImageSource.gallery) ;
                    },
                    text: "Thêm ảnh"
                )
            )
          ],
        ),
        SizedBox(height: 20,),
        WidgetButtonCustom(
            handle: () {
              ProductModal product = ProductModal(tensp: tensp.text, loaisp: loaisp.text, gia: int.parse(gia.text), hinhanh: path) ;
              product.insertdata() ;

              setState(() {
                tensp.text = "" ;
                loaisp.text = "" ;
                gia.text = "" ;
                path = "" ;
                 icon = Icons.close ;
                 color = Colors.red ;
              });

            },
            text: "Thêm sản phẩm"
        )
      ],
    );
  }
}
