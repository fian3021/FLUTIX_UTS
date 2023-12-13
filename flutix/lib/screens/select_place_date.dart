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
  int selectedPlace = 0;
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

  String getPlace(int placeIndex) {
    List<String> place = [
      "XXI Big Mall Samarinda",
      "XXI Samarinda Square",
      "CJ Cinemas CGV Samarinda",
      "CGV Plaza Mulia Samarinda"
    ];
    return place[(placeIndex - 1) % 5];
  }

  String getTime(int timeIndex) {
    List<String> time = ["13.50", "15.00", "17.20", "18.30", "20.10"];
    return time[(timeIndex - 1) % 6];
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(52, 50, 56, 1),
        appBar: AppBar(
          leading: Arrow_Back(),
          title: Padding(
            padding: EdgeInsets.only(left: 70),
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
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: lebar,
              height: 50,
              child: Center(
                child: Text(
                  "Select Place",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: lebar,
              height: 270,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPlace = index;
                      });
                    },
                    child: Container(
                      width: lebar,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      decoration: BoxDecoration(
                        color: selectedPlace == index
                            ? Color.fromRGBO(180, 212, 41, 1) // Selected color
                            : Color.fromRGBO(177, 177, 177, 1), // Default color
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          getPlace(index + 1),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(54, 53, 56, 1),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: lebar,
              height: 50,
              child: Center(
                child: Text(
                  "Select Time",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              width: lebar,
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTime = index;
                      });
                    },
                    child: Container(
                      width: 90,
                      height: 40,
                      margin: EdgeInsets.fromLTRB(
                        index == 0 ? 30 : 8,
                        10,
                        index == 4 ? 30 : 8,
                        0,
                      ),
                      decoration: BoxDecoration(
                        color: selectedTime == index
                            ? Color.fromRGBO(180, 212, 41, 1) // Selected color
                            : Color.fromRGBO(177, 177, 177, 1), // Default color
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              getTime(index + 1),
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
