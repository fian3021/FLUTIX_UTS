import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/model/AUTH.dart';
import 'package:flutix/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutix/widgets/app_nav.dart';

class Sign_In extends StatefulWidget {
  @override
  _Sign_InState createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final AuthService _auth = AuthService(); // mengelola autentifikasi pengguna

  TextEditingController emailController = TextEditingController(); // mendapat nilai inputan dari email
  TextEditingController passwordController = TextEditingController(); // mendapat nilai inputan dari pasword
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); // untuk memvalidasi formulir

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 53, 56, 1),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Form( // membuat formulir di flutter
              key: formKey, // mengidentifikasi formulir dan memberikan akses untuk berbagai metode formulir
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 11),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 104,
                          height: 125,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/LOGOOO.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 140),
                          Center(
                            child: Text('Welcome Back,\n Explorer!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontFamily: 'Poppins')),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 71),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.grey),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: emailController.text.isNotEmpty
                              ? Colors.white
                              : Color.fromRGBO(180, 212, 41,
                                  1), // Warna hijau ketika dalam fokus
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    obscureText: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                    ),
                    validator: (value) {// jika nilai tidak valid mengembalikan pesan kesalahan, 
                                      //jika tidak mengembalikan null
                      if (value!.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 11),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                    ),
                    validator: (value) {// jika nilai tidak valid mengembalikan pesan kesalahan, 
                                      //jika tidak mengembalikan null
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 54),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'Countinue to Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 52,
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 58,
                          height: 58,
                          decoration: ShapeDecoration(
                            color: Color.fromARGB(255, 180, 212, 41),
                            shape: OvalBorder(),
                          ),
                          //  fungsi yang akan dijalankan ketika tombol ditekan. Pada contoh ini, 
                          //dilakukan proses pendaftaran pengguna menggunakan fungsi _auth.signInWithEmailAndPassword() 
                          //yang mengembalikan objek User.
                          child: IconButton(
                              onPressed: () async {
                                User? user =
                                    await _auth.signInWithEmailAndPassword(
                                        emailController.text,
                                        passwordController.text,
                                        context);

                                if (user != null) {
                                  // Navigasi ke halaman home setelah login berhasil
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => App_Nav(),
                                    ),
                                  );
                                }
                              },
                              icon: Icon(
                                Icons.keyboard_double_arrow_right_outlined,
                              )))
                    ],
                  ),
                  SizedBox(height: 150),
                  Center(
                    child: Container(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sign_Up()),
                            );
                          },
                          child: Text("Create New Account",
                              style: TextStyle(
                                color: Color.fromRGBO(177, 177, 177, 1),
                                fontSize: 15,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
