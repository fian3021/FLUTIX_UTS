import 'package:flutix/screens/sign_in.dart';
import 'package:flutix/screens/user_profiling_page.dart';
import 'package:flutter/material.dart';

class Sign_Up extends StatefulWidget {
  @override
  _Sign_UpState createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
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
                TextField(
                  controller: nameController,
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
                  obscureText: false,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 18),
                TextField(
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
                SizedBox(height: 18),
                TextField(
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
                TextField(
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
                      padding: EdgeInsets.only(left: 20),
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
                      margin: EdgeInsets.only(right: 56),
                        width: 58,
                        height: 58,
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(255, 180, 212, 41),
                          shape: OvalBorder(),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => User_Profiling()),
                              );
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
