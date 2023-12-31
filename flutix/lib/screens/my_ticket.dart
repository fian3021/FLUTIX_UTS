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
            if (isUsedButtonSelected)
              Positioned(
                top: 50,
                child: Container(
                  width: lebar,
                  height: MediaQuery.of(context).size.height - 80,
                  child: movies(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  ListView movies() {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _MovieList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final movie = _MovieList[index];
          return Container(
            // width: lebar,
            height: 96,
            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: ShapeDecoration(
              color: Color.fromARGB(255, 54, 53, 56),
              shape: RoundedRectangleBorder(
                // side: BorderSide(width: 1, color: Color(0xFFF0E1D4)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //==================Untuk Desain List Tugas============
                Row(
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      margin: EdgeInsets.fromLTRB(15, 0, 12, 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        image: DecorationImage(
                          image: AssetImage("assets/${movie.picture}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // child: Image.asset('assets/${menu.gambar}')
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${movie.title}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "${movie.time}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "${movie.cinema}",
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}

List<Movie_List> _MovieList = [
  Movie_List(
      title: 'The NUN II',
      time: 'Sep 1, 18:00',
      cinema: 'XXI Big Mall Samarinda',
      picture: 'poster.png'),
  Movie_List(
      title: 'Avengers',
      time: 'Aug 30, 20:15',
      cinema: 'XXI Big Mall Samarinda',
      picture: 'poster2.jpg'),
  Movie_List(
      title: 'Maleficent',
      time: 'Jun 2, 20:15',
      cinema: 'XXI Big Mall Samarinda',
      picture: 'poster1.jpg')
];

class Movie_List {
  final String title;
  final String time;
  final String cinema;
  final String picture;

  Movie_List({
    required this.title,
    required this.time,
    required this.cinema,
    required this.picture,
  });
}
