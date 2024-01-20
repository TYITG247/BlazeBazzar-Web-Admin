import 'package:blazebazzar_web_admin/views/screens/side_bar_screens/widgets/category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = "\CategoriesScreen";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  dynamic _image;
  String? categoryName;
  late String fileName;

  _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  _uploadCategoryImageToStorage(dynamic image) async {
    Reference ref = _storage.ref().child("categoriesImage").child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadCategory() async {
    EasyLoading.show();
    if (_formKey.currentState!.validate()) {
      String imageUrl = await _uploadCategoryImageToStorage(_image);
      await _firestore.collection("categories").doc(fileName).set({
        "image": imageUrl,
        "categoryName": categoryName,
      }).whenComplete(() {
        EasyLoading.dismiss();
        setState(() {
          _image = null;
          _formKey.currentState!.reset();
        });
      });
    } else {
      print("Bad Guuyys");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: _image != null
                            ? Image.memory(
                                _image,
                                fit: BoxFit.cover,
                              )
                            : Center(
                                child: Text("Image"),
                              ),
                      ),
                      Gap(20),
                      ElevatedButton(
                        onPressed: () {
                          _pickImage();
                        },
                        child: Text("Select Image"),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 165,
                    child: TextFormField(
                      onChanged: (value) {
                        categoryName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Category name cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Enter Category Name",
                          hintText: "Enter Category Name"),
                    ),
                  ),
                ),
                Gap(15),
                ElevatedButton(
                  onPressed: () {
                    uploadCategory();
                  },
                  child: Text("Upload"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
