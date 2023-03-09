import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_teamd/components/appText/m_text.dart';
import 'package:project_teamd/components/logo.dart';
import 'package:project_teamd/constants/color_pallete.dart';
import 'package:project_teamd/model/product.dart';
import 'package:project_teamd/model/seller.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? imageFile;
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController cat = TextEditingController();
  TextEditingController desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        backgroundColor: greyLight,
        leading: BackButton(
          color: green,
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
          TextField(
            controller: name,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              hintStyle: const TextStyle(fontSize: 18),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: green),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: green),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
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
                    TextField(
                      controller: price,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                        hintStyle: const TextStyle(fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: green),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5, color: green),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
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
                    TextField(
                      controller: brand,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                        hintStyle: const TextStyle(fontSize: 18),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: green),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5, color: green),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
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
          TextField(
            controller: cat,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              hintStyle: const TextStyle(fontSize: 18),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: green),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: green),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MText(text: 'Description', fontweight: FontWeight.bold, color: lightgreen, size: 16),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: desc,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              hintStyle: const TextStyle(fontSize: 18),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: green),
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: green),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: lightgreen,
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              var id = DateTime.now().millisecondsSinceEpoch.remainder(100000000).toString();
              var imageUrl = '';
              if (imageFile!.path ==
                  '/Users/luluahmaldakhil/Library/Developer/CoreSimulator/Devices/F1269B85-4240-43F6-993A-E489339499C9/data/Containers/Data/Application/A5BDF2AA-CD40-46F8-979C-A5775AFAE984/tmp/image_picker_8D687C5F-6607-469D-915F-E782BD310A6D-70959-0000582F0B8379F6.png') {
                imageUrl =
                    'https://ounass-prod2.atgcdn.ae/small_light(p=zoom,of=webp,q=65)/pub/media/catalog/product//2/1/215875963_brown_in.jpg?1670077595.0538';
              } else {
                imageUrl =
                    'https://ounass-prod2.atgcdn.ae/small_light(p=zoom,of=webp,q=65)/pub/media/catalog/product//2/1/215875963_brown_in.jpg?1670077595.0538';
              }
              Product pro = Product(
                  id: id,
                  name: name.text,
                  price: double.parse(price.text),
                  brand: brand.text,
                  description: desc.text,
                  shopName: currentSeller.name,
                  category: cat.text,
                  country: 'Italy',
                  rating: 5,
                  imageUrl: imageUrl);
              currentSeller.product.add(pro);

              Seller seller = Seller(
                  name: currentSeller.name,
                  userName: currentSeller.userName,
                  email: currentSeller.email,
                  about: currentSeller.about,
                  review: currentSeller.review,
                  id: currentSeller.id,
                  logo: currentSeller.logo,
                  location: currentSeller.location,
                  letter: currentSeller.letter,
                  orders: currentSeller.orders,
                  product: currentSeller.product,
                  rating: currentSeller.rating);
              final collection = FirebaseFirestore.instance.collection('seller');
              collection.doc(seller.id).set(seller.toMap());
              Navigator.pop(context);
            },
            child: const Text(
              'Add Product',
              style: TextStyle(fontSize: 16),
            ),
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
          print(imageFile!.path);
        },
      );
    }
  }
}
