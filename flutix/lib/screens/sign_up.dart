import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutix/model/AUTH.dart';
import 'package:flutix/model/data_user_database.dart';
import 'package:flutix/screens/sign_in.dart';
import 'package:flutix/screens/user_profiling_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Sign_Up extends StatefulWidget {
  @override
  _Sign_UpState createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String imageUrl = "";

  // var userCollection = FirebaseFirestore.instance.collection('user');
  // var user = FirebaseAuth.instance.currentUser;
  // var userID = FirebaseAuth.instance.currentUser!.uid;

  TextEditingController nameController = TextEditingController();
  TextEditingController eemailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  TextEditingController confirpwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 53, 56, 1),
      body: ListView(
        children: [
          SizedBox(height: 22),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                child: Icon(
                  Icons.keyboard_double_arrow_left_outlined,
                  color: Color.fromARGB(255, 180, 212, 41),
                  size: 40,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sign_In()),
                  );
                },
              ),
              SizedBox(
                width: 75,
              ),
              Column(
                children: [
                  Container(
                    child: Center(
                      child: Text('Create Your\n Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontFamily: 'Poppins')),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10, bottom: 10),
                //   child: InkWell(
                //     onTap: () async {
                //       // Membuat  dan menambahkan package image_picker
                //       final imgPicker = await ImagePicker()
                //           .pickImage(source: ImageSource.gallery);

                //       if (imgPicker == null) return;

                //       String fileName =
                //           DateTime.now().microsecondsSinceEpoch.toString();

                //       // Membuat reference untuk menggambil folder root pada firebase storage
                //       Reference referenceRoot = FirebaseStorage.instance.ref();
                //       Reference referenceImages =
                //           referenceRoot.child("images/user_profile");

                //       // Membuat reference untuk mengupload gambar
                //       Reference referenceImageToUpload =
                //           referenceImages.child('$fileName.jpg');

                //       // Error handling
                //       try {
                //         await referenceImageToUpload
                //             .putFile(File(imgPicker.path));
                //         imageUrl =
                //             await referenceImageToUpload.getDownloadURL();
                //         print("_imageUrl: $imageUrl");
                //       } catch (e) {}
                //     },
                //     child: imageUrl != null
                //         ? Padding(
                //             padding:
                //                 const EdgeInsets.only(left: 125, right: 125),
                //             child: Container(
                //               height: 140,
                //               decoration: BoxDecoration(
                //                   color: Colors.black26,
                //                   borderRadius: BorderRadius.circular(80),
                //                   image: DecorationImage(
                //                       image: NetworkImage(imageUrl!))),
                //             ),
                //           )
                //         : Container(
                //             padding:
                //                 const EdgeInsets.only(left: 125, right: 125),
                //             child: Container(
                //               height: 140,
                //               decoration: BoxDecoration(
                //                 color: Colors.black26,
                //                 borderRadius: BorderRadius.circular(80),
                //                 image: DecorationImage(
                //                     image: NetworkImage(
                //                         imageUrl)),
                //               ),
                //             ),
                //           ),
                //   ),
                // ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 115,
                        height: 123,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(177, 177, 177, 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 38),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama Lengkap harus diisi';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Your Full Name',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: nameController.text.isNotEmpty
                            ? Colors.white
                            : Color.fromRGBO(180, 212, 41,
                                1), // Warna hijau ketika dalam fokus
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  obscureText: false,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 18),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email harus diisi';
                      }
                      return null;
                    },
                    controller: eemailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(180, 212, 41, 1)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password harus diisi';
                    }
                    return null;
                  },
                  controller: paswordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.white),
                    // focusColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(180, 212, 41, 1)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 18),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm password harus diisi';
                    }
                    if (value != paswordController.text) {
                      return 'Passwords tidak cocok';
                    }
                    return null;
                  },
                  controller: confirpwController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    hintStyle: TextStyle(color: Colors.white),
                    // focusColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(180, 212, 41, 1)),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 49),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        'Countinue to Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 85,
                    ),
                    Container(
                        width: 58,
                        height: 58,
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(255, 180, 212, 41),
                          shape: OvalBorder(),
                        ),
                        child: IconButton(
                            onPressed: () async {
                              User? user =
                                  await _auth.registerWithEmailAndPassword(
                                      eemailController.text,
                                      paswordController.text,
                                      context);

                              if (user != null) {
                                try {
                                  // update data user pada firestore
                                  DatabaseService(uid: user.uid).updateUserData(
                                      nameController.value.text,
                                      eemailController.value.text,
                                      paswordController.value.text,
                                      imageUrl);
                                } catch (e) {
                                  print(e);
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => User_Profiling()),
                                );
                              }

                              // if (user != null) {
                              //   DatabaseService(uid: user.uid).updateUserData(
                              //     nameController.value.text,
                              //     eemailController.value.text,
                              //     paswordController.value.text,
                              //   );
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => User_Profiling()),
                              //   );
                              // }
                            },
                            icon: Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                            )))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
