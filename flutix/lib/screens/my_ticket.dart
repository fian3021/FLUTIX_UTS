import 'package:flutter/material.dart';

class MyTickets extends StatefulWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  State<MyTickets> createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {
  bool isNewButtonSelected = true;
  bool isUsedButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 53, 56),
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
          child: Text('My Tickets',
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
              )),
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              left: 30,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNewButtonSelected = true;
                    isUsedButtonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isNewButtonSelected
                      ? Color.fromARGB(255, 180, 212, 41)
                      : Color.fromRGBO(125, 125, 126, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size((lebar - 30) / 2, 34),
                ),
                child: Text(
                  'New',
                  style: TextStyle(
                    color: Color.fromARGB(255, 54, 53, 56),
                  ),
                ),
              ),
            ),
            Positioned(
              left: (lebar - 30) / 2,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNewButtonSelected = false;
                    isUsedButtonSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isUsedButtonSelected
                      ? Color.fromARGB(255, 180, 212, 41)
                      : Color.fromRGBO(125, 125, 126, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size((lebar - 30) / 2, 34),
                ),
                child: Text(
                  'Used',
                  style: TextStyle(
                    color: Color.fromARGB(255, 54, 53, 56),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
