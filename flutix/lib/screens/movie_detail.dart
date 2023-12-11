import 'package:flutix/model/movie_list_play.dart';
import 'package:flutix/screens/select_place_date.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Movie_Detail extends StatelessWidget {
  final Movie_Data_Play movieDetail;

  const Movie_Detail({required this.movieDetail});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color.fromRGBO(52, 50, 56, 1),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Stack(children: [
              Container(
                width: lebar,
                height: 340,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(movieDetail.picture),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  child: Icon(
                    Icons.keyboard_double_arrow_left_outlined,
                    color: Color.fromARGB(255, 180, 212, 41),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ]),
            SizedBox(height: 17),
            Container(
              width: lebar,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                movieDetail.title,
                textWidthBasis: TextWidthBasis.parent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: lebar,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                movieDetail.genre + " - " + movieDetail.country,
                textWidthBasis: TextWidthBasis.parent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: lebar,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                "⭐⭐⭐⭐⭐ 6/10",
                textWidthBasis: TextWidthBasis.parent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(180, 212, 41, 1),
                ),
              ),
            ),
            SizedBox(height: 17),
            Container(
              width: lebar,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 5),
              child: Text(
                "Storyline",
                textWidthBasis: TextWidthBasis.parent,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: lebar,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text(
                movieDetail.story,
                textWidthBasis: TextWidthBasis.parent,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 17),
            Container(
              width: lebar,
              margin: EdgeInsets.fromLTRB(30, 0, 30, 5),
              child: Text(
                "Cast",
                textWidthBasis: TextWidthBasis.parent,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromRGBO(180, 212, 41, 1), // Warna border
                          width: 2, // Lebar border
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/TaissaFarmiga.jpg"),
                          fit: BoxFit
                              .cover, // Anda bisa menggunakan BoxFit.fill sesuai kebutuhan
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      // margin: EdgeInsets.only(left: 30, right: 15),
                      child: Text(
                        "Taissa Farmiga",
                        textWidthBasis: TextWidthBasis.parent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromRGBO(180, 212, 41, 1), // Warna border
                          width: 2, // Lebar border
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/StormReid.jpg"),
                          fit: BoxFit
                              .cover, // Anda bisa menggunakan BoxFit.fill sesuai kebutuhan
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      // margin: EdgeInsets.only(right: 15),
                      child: Text(
                        "Storm Reid",
                        textWidthBasis: TextWidthBasis.parent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromRGBO(180, 212, 41, 1), // Warna border
                          width: 2, // Lebar border
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/BonnieAarons.jpg"),
                          fit: BoxFit
                              .cover, // Anda bisa menggunakan BoxFit.fill sesuai kebutuhan
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      // margin: EdgeInsets.only(right: 15),
                      child: Text(
                        "Bonnie Aarons",
                        textWidthBasis: TextWidthBasis.parent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromRGBO(180, 212, 41, 1), // Warna border
                          width: 2, // Lebar border
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/AnnaPopplewell.jpg"),
                          fit: BoxFit
                              .cover, // Anda bisa menggunakan BoxFit.fill sesuai kebutuhan
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      // margin: EdgeInsets.only(right: 15),
                      child: Text(
                        "Anna Popplewell",
                        textWidthBasis: TextWidthBasis.parent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      margin: EdgeInsets.only(bottom: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromRGBO(180, 212, 41, 1), // Warna border
                          width: 2, // Lebar border
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/JonasBloquet.jpg"),
                          fit: BoxFit
                              .cover, // Anda bisa menggunakan BoxFit.fill sesuai kebutuhan
                        ),
                      ),
                    ),
                    Container(
                      width: 55,
                      // margin: EdgeInsets.only(right: 15),
                      child: Text(
                        "Jonas Bloquet",
                        textWidthBasis: TextWidthBasis.parent,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(60, 34, 60, 35),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Select_Place_Date(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    primary: Color.fromRGBO(180, 212, 41, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    minimumSize: Size(240, 40), // Ukuran button
                  ),
                  child: Text(
                    "Continue to Book",
                    textWidthBasis: TextWidthBasis.parent,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(54, 53, 56, 1),
                    ),
                  )),
            )
          ],
        ));
  }
}

// class MovieListDetail extends StatelessWidget {
//   final Movie_Data_Play detail;
//   final int index;

//   MovieListDetail({required this.detail, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     var lebar = MediaQuery.of(context).size.width;

//     return Column(
//       children: [
//         Stack(children: [
//           Container(
//             width: lebar,
//             height: 340,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(detail.picture),
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 20,
//             left: 20,
//             child: GestureDetector(
//               child: Icon(
//                 Icons.keyboard_double_arrow_left_outlined,
//                 color: Color.fromARGB(255, 180, 212, 41),
//               ),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//         ]),
//         SizedBox(height: 17),
//         Container(
//           width: lebar,
//           margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//           child: Text(
//             detail.title,
//             textWidthBasis: TextWidthBasis.parent,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 21,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Container(
//           width: lebar,
//           margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//           child: Text(
//             detail.genre,
//             textWidthBasis: TextWidthBasis.parent,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Container(
//           width: lebar,
//           margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//           child: Text(
//             "⭐⭐⭐⭐⭐ 6/10",
//             textWidthBasis: TextWidthBasis.parent,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 12,
//               color: Color.fromRGBO(180, 212, 41, 1),
//             ),
//           ),
//         ),
//         SizedBox(height: 17),
//         Container(
//           width: lebar,
//           margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//           child: Text(
//             "Storyline",
//             textWidthBasis: TextWidthBasis.parent,
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Container(
//           width: lebar,
//           margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
//           child: Text(
//             detail.story,
//             textWidthBasis: TextWidthBasis.parent,
//             textAlign: TextAlign.justify,
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }



//         GridView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: 6, // Jumlah item, sesuaikan dengan kebutuhan Anda
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 1, // Hanya satu baris
//             ),
//             itemBuilder: (BuildContext context, int index) {
//               return Column(children: [
//                 Container(
//                   width: 60,
//                   height: 60,
//                   margin: EdgeInsets.fromLTRB(0, 0, 15, 3),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: Color.fromRGBO(180, 212, 41, 1),
//                       width: 2,
//                     ),
//                     image: DecorationImage(
//                       image: AssetImage(_getImagePath(index)),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 60,
//                   margin: EdgeInsets.only(right: 15),
//                   child: Text(
//                     _getActorName(index),
//                     textWidthBasis: TextWidthBasis.parent,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ]);
//             }),
//         Container(
//           margin: EdgeInsets.fromLTRB(60, 17, 60, 0),
//           child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.all(20),
//                 primary: Color.fromRGBO(180, 212, 41, 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 minimumSize: Size(240, 40), // Ukuran button
//               ),
//               child: Text(
//                 "Continue to Book",
//                 textWidthBasis: TextWidthBasis.parent,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Color.fromRGBO(54, 53, 56, 1),
//                 ),
//               )),
//         )
//       ],
//     ));
//   }

//   String _getImagePath(int index) {
//     // Fungsi ini mengembalikan path gambar sesuai dengan indeks
//     // Sesuaikan dengan path gambar yang Anda miliki
//     switch (index) {
//       case 0:
//         return "assets/TaissaFarmiga.jpg";
//       case 1:
//         return "assets/BonnieAarons.jpg";
//       case 2:
//         return "assets/StormReid.jpg";
//       case 3:
//         return "assets/AnnaPopplewell.jpg";
//       case 4:
//         return "assets/JonasBloquet.jpg";
//       case 5:
//         return "assets/StormReid.jpg";
//       default:
//         return "";
//     }
//   }

//   String _getActorName(int index) {
//     // Fungsi ini mengembalikan nama aktor sesuai dengan indeks
//     // Sesuaikan dengan nama aktor yang Anda miliki
//     switch (index) {
//       case 0:
//         return "Taissa Farmiga";
//       case 1:
//         return "Bonnie Aarons";
//       case 2:
//         return "Storm Reid";
//       case 3:
//         return "Anna Popplewell";
//       case 4:
//         return "Jonas Bloquet";
//       case 5:
//         return "Storm Reid";
//       default:
//         return "";
//     }
//   }
// }
