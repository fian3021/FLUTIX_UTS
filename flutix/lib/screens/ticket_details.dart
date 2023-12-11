import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class Ticket_Details extends StatelessWidget {
  const Ticket_Details({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    // var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 54, 53, 56),
        title: Center(
          child: Text(
            "Ticket",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: lebar,
            height: 705,
            color: Color.fromARGB(255, 54, 53, 56),
            child: Container(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          width: 300,
                          height: 590,
                          decoration: ShapeDecoration(
                            color: Color.fromARGB(255, 94, 93, 96),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 266,
                                height: 172,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/poster.png'),
                                      fit: BoxFit.fill),
                                  color: Color.fromARGB(255, 63, 54, 82),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Text(
                                'The NUN 2',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Horror - USA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              //TEMPAT BINTANG
                              Text(
                                'Horror - USA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                              ),
                              //TEMPAT BINTANG
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cinema',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'XXI Big Mall Samarinda',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date & Time',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Sep 3, 20:15',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Seat',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'C4, C5',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Container(
                                  child: DottedLine(
                                    direction: Axis.horizontal,
                                    lineLength: double.infinity,
                                    lineThickness: 5.0,
                                    dashLength: 15.0,
                                    dashColor: Color.fromARGB(255, 54, 53, 56),
                                    dashRadius: 0.0,
                                    dashGapLength: 15.0,
                                    dashGapColor: Colors.transparent,
                                    dashGapRadius: 0.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Angga Rizky',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Price',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        'Rp. 100.000',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'ID Order',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 110,
                                        height: 96,
                                        color:
                                            Color.fromARGB(255, 180, 212, 41),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        '2208199612389',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 360,
                          left: -30,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color.fromARGB(255, 54, 53, 56),
                              shape: OvalBorder(),
                            ),
                          )),
                      Positioned(
                          top: 360,
                          left: 280,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Color.fromARGB(255, 54, 53, 56),
                              shape: OvalBorder(),
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 30, 60, 0),
                    child: SizedBox(
                      width: lebar,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('Download Ticket',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400)),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       // return Sign_Up();
                          //     },
                          //   ),
                          // );
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
          )
        ],
      ),
    );
  }
}
