import 'package:flutter/material.dart';
import 'package:flutix/widgets/app_nav.dart';

class Edit_Profile extends StatefulWidget {
  @override
  _Edit_ProfileState createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController eemailController = TextEditingController();
  TextEditingController paswordController = TextEditingController();
  TextEditingController confirpwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    // var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 53, 56, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(54, 53, 56, 1),
        leading: GestureDetector(
          child: Icon(
            Icons.keyboard_double_arrow_left_outlined,
            size: 30,
            color: Color.fromARGB(255, 180, 212, 41),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 75),
          child: Text('Edit Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              )),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 22),
          Column(
            children: [
              // Container(
              //   child: Center(
              //     child: Text('Edit Profile',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 21,
              //             fontFamily: 'Poppins')),
              //   ),
              // ),
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
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 60, 60, 5),
                  child: SizedBox(
                    width: lebar,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text('Update Now',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return App_Nav();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 54, 53, 56),
                        backgroundColor: Color.fromARGB(255, 180, 212, 41),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
