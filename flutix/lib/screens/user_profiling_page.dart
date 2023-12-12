import 'package:flutix/screens/confir_account_page.dart';
import 'package:flutix/screens/sign_up.dart';
import 'package:flutter/material.dart';

class User_Profiling extends StatelessWidget {
  const User_Profiling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 53, 56, 1),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(height: 22),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    MaterialPageRoute(builder: (context) => Sign_Up()),
                  );
                },
              ),
              SizedBox(width: 72),
              Center(
                child: Text('Select Your\n Favourit Genre',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: 'Poppins')),
              )
            ],
          ),
          SizedBox(height: 19),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(180, 212, 41, 1),
                    ),
                    child: Text(
                      'Horror',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'Music',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'Action',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'Drama',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'War',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'Crime',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Text('Which Movie Language\n You Prefer ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Poppins')),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'Bahasa',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(180, 212, 41, 1),
                    ),
                    child: Text(
                      'English',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'Japanese',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Color.fromRGBO(177, 177, 177, 1),
                    ),
                    child: Text(
                      'Korean',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sign_Up()),
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
                              builder: (context) => ConfirAccount()),
                        );
                      },
                      icon: Icon(
                        Icons.keyboard_double_arrow_right_outlined,
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
