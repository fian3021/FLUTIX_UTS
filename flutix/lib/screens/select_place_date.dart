import 'package:flutix/screens/select_seat.dart';
import 'package:flutter/material.dart';

import '../widgets/back.dart';

class Select_Place_Date extends StatefulWidget {
  const Select_Place_Date({super.key});

  @override
  State<Select_Place_Date> createState() => _Select_Place_DateState();
}

class _Select_Place_DateState extends State<Select_Place_Date> {
  int selectedDate = 0;
  int selectedTime = 0;

  String getDayOfWeek(int dayIndex) {
    List<String> daysOfWeek = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    return daysOfWeek[(dayIndex - 1) % 8];
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(52, 50, 56, 1),
        appBar: AppBar(
          leading: Arrow_Back(),
          title: Center(
            child: Text('Choose Date',
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          backgroundColor: Color.fromRGBO(54, 53, 56, 1),
        ),
        body: Column(
          children: [
            SizedBox(
              width: lebar,
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(7, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = index;
                      });
                    },
                    child: Container(
                      width: 75,
                      height: 80,
                      margin: EdgeInsets.fromLTRB(
                        index == 0 ? 30 : 10,
                        0,
                        10,
                        0,
                      ),
                      decoration: BoxDecoration(
                        color: selectedDate == index
                            ? Color.fromRGBO(180, 212, 41, 1) // Selected color
                            : Color.fromRGBO(177, 177, 177, 1), // Default color
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Sep ${index + 3}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(54, 53, 56, 1),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              getDayOfWeek(index + 1),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(54, 53, 56, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            // SizedBox(
            //   width: lebar,
            //   height: 60,
            //   child: ListView(
            //     children: [],
            //   ),
            // ),
            SizedBox(
              width: lebar,
              height: 60,
              child: Center(
                child: Text(
                  "XXI Big Mall Samarinda",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: lebar,
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(30, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "10.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "12.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "18.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(180, 212, 41, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "20.15",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "20.45",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: lebar,
              height: 60,
              child: Center(
                child: Text(
                  "XXI Samarinda Square",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: lebar,
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(30, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "10.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "12.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "16.15",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "19.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "21.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: lebar,
              height: 60,
              child: Center(
                child: Text(
                  "CJ Cinemas CGV Samarinda",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: lebar,
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(30, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "09.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "11.20",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "14.40",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "17.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "20.10",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: lebar,
              height: 60,
              child: Center(
                child: Text(
                  "CGV Plaza Mulia Samarinda",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: lebar,
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(30, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "10.30",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "12.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "15.30",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "17.00",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                  Container(
                    width: 90,
                    height: 35,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(177, 177, 177, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "19.45",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(54, 53, 56, 1)),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Select Your Seat",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Container(
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
                                    builder: (context) => Select_Seat()),
                              );
                            },
                            icon: Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                            )))
                  ]),
            )
          ],
        ));
  }
}
