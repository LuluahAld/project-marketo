import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/components/textfields/textfield_m.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/pages/seller/Sbotton.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: greyLight,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Logo(
          size: 200,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          MText(text: 'Product Name', fontweight: FontWeight.bold, color: lightgreen, size: 16),
          const SizedBox(
            height: 10,
          ),
          const TextFieldM(
            hint: 'Name',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(text: 'Price', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextFieldM(
                      hint: 'Price',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MText(text: 'Brand', fontweight: FontWeight.bold, color: lightgreen, size: 16),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextFieldM(
                      hint: 'Brand',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MText(text: 'Category', fontweight: FontWeight.bold, color: lightgreen, size: 16),
          const SizedBox(
            height: 10,
          ),
          const TextFieldM(
            hint: 'Category',
          ),
          const SizedBox(
            height: 20,
          ),
          MText(text: 'Description', fontweight: FontWeight.bold, color: lightgreen, size: 16),
          const SizedBox(
            height: 10,
          ),
          const TextFieldM(
            hint: 'Description',
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '+ Choose Image',
            style: TextStyle(color: lightgreen, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            child: imageFile == null
                ? Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: lightgreen),
                          onPressed: () {
                            _getFromGallery();
                          },
                          child: const Text("PICK FROM GALLERY"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: lightgreen),
                          onPressed: () {
                            _getFromCamera();
                          },
                          child: const Text("PICK FROM CAMERA"),
                        )
                      ],
                    ),
                  )
                : Image.asset(
                    imageFile!.path,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(
            height: 40,
          ),
          Sbutton(
            color: lightgreen,
            text: 'Add Product',
            NavChoice: 2,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(
        () {
          imageFile = File(pickedFile.path);
        },
      );
    }
  }
}
