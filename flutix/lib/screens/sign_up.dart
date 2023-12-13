import 'dart:io';

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

// deklarasi untuk menyimpan 
  String imageUrl = "";
  // String saldo = "";

  // var userCollection = FirebaseFirestore.instance.collection('user');
  // var user = FirebaseAuth.instance.currentUser;
  // var userID = FirebaseAuth.instance.currentUser!.uid;

  final ImagePicker _imagePicker = ImagePicker(); // untuk memilih gambar 
  final FirebaseStorage _storage = FirebaseStorage.instance; // firebase
  TextEditingController nameController = TextEditingController();
  TextEditingController eemailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  TextEditingController confirpwController = TextEditingController();

  File? _image;
// memilih gambar dan mengunggah ke firebase
  Future<void> _pickAndUploadImage() async {
    
    try {
      // untuk memilih gambar dari galeri
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) { // memeriksa gambar 
        setState(() { // memperbarui state widget gambar yang baru dipilih
          _image = File(pickedFile.path);
        });
// membuat file
        String fileName = DateTime.now().toString() + ".png";

        Reference storageReference =
            _storage.ref().child("images/user_profile").child(fileName);
// unggah gambar ke firebase
        UploadTask uploadTask = storageReference.putFile(_image!);

        await uploadTask.whenComplete(() => print("Image Uploaded"));


        imageUrl = await storageReference.getDownloadURL();

        print("_imageUrl: $imageUrl");

        print("Download URL: $imageUrl");
      }
      // menangani exception jika terjadi selama eksekusi blok try,
      //Jika terjadi kesalahan selama proses pemilihan atau pengunggahan gambar, pesan kesalahan dicetak ke konsol.
    } catch (e) {
      print("Error picking and uploading image: $e");
    }
  }

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
              GestureDetector( // mendeteksi ketekukan pada saat di klik
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'Create Your\n Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, // meregang sepanjang lebar kolom
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
                      alignment: Alignment.topCenter,// posisis atas tengah
                      child: Container(
                        width: 115,
                        height: 123,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(177, 177, 177, 1),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: _image != null // jika gambar tidak null akan menampilkan gambar jika null menampilkan ikon
                            ? ClipRRect( // widget untuk membatasi
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.file(
                                  _image!, // variabel image tidak boleh null
                                  width: 115,
                                  height: 123,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Icon(
                                Icons.person,
                                size: 50.0,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    Positioned(
                      left: 194,
                      top: 84,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: ShapeDecoration(
                          color: Color(0xFFB4D429),
                          shape: OvalBorder(
                              side: BorderSide(color: Colors.black, width: 3)),
                        ),
                        child: IconButton(
                          onPressed: _pickAndUploadImage,
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Color.fromARGB(255, 54, 53, 56),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // ElevatedButton(
                //   onPressed: _uploadImage,
                //   child: Text('Upload Image'),
                // ),
                SizedBox(height: 30),

                TextFormField(
                  validator: (value) { // jika nilai tidak valid mengembalikan pesan kesalahan, 
                                      //jika tidak mengembalikan null
                    if (value == null || value.isEmpty) {
                      return 'Nama Lengkap harus diisi';
                    }
                    return null;
                  },
                  controller: nameController, // mengontrol & mendapatkan input teks
                  decoration: InputDecoration(
                    labelText: 'Full Name',
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
                  // untuk sandi
                  obscureText: false,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 18),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    validator: (value) {// jika nilai tidak valid mengembalikan pesan kesalahan, 
                                      //jika tidak mengembalikan null
                      if (value == null || value.isEmpty) {
                        return 'Email harus diisi';
                      }
                      return null;
                    },
                    controller: eemailController, // mengontrol & mendapatkan input teks
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
                    // untuk sandi
                    obscureText: false,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {// jika nilai tidak valid mengembalikan pesan kesalahan, 
                                      //jika tidak mengembalikan null
                      return 'Password harus diisi';
                    }
                    return null;
                  },
                  controller: paswordController,  // mengontrol & mendapatkan input teks
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
                    // jika nilai tidak valid mengembalikan pesan kesalahan, 
                                      //jika tidak mengembalikan null
                    if (value == null || value.isEmpty) {
                      return 'Confirm password harus diisi';
                    }
                    if (value != paswordController.text) {
                      return 'Passwords tidak cocok';
                    }
                     // Jika melewati kedua pengecekan di atas, nilai dianggap valid
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Sign_In()),
                          );
                        },
                        child: Text(
                          "Continue to Sign Up",
                          style: TextStyle(
                            color: Color.fromRGBO(177, 177, 177, 1),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 58,
                        height: 58,
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(255, 180, 212, 41),
                          shape: OvalBorder(),
                        ),
                        child: IconButton(
                          //  fungsi yang akan dijalankan ketika tombol ditekan. Pada contoh ini, 
                          //dilakukan proses pendaftaran pengguna menggunakan fungsi _auth.registerWithEmailAndPassword() 
                          //yang mengembalikan objek User.
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
                                      imageUrl
                                      );
                                } catch (e) {
                                  print(e);
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => User_Profiling()),
                                );
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                              //  color: Colors.red,
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
