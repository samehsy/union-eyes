import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({Key? key}) : super(key: key);
  static const routeName = '/menu/maintenance-order';

  @override
  State<Maintenance> createState() => MaintenanceState();
}

class MaintenanceState extends State<Maintenance> {
  File? _image;

  // final _picker = ImagePicker();
  // Future<void> _openImagePicker() async {
  //   final XFile? pickedImage =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(children: [
          InkWell(
            onTap: () {
              //Navigator.of(context).pushNamed("");
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              width: double.infinity,
              //height: 100,
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: const Text(
                "Select An Image",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 200,
            color: Colors.grey[300],
            child: _image != null
                ? Image.file(_image!, fit: BoxFit.cover)
                : const Text('Please select an image'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Issue Description ',
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.amber,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Text(" إرسال الطلب"),
            ),
          )
        ]),
      ),
    );
  }
}
