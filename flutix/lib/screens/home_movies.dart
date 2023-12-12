import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutix/model/movie_cooming_list.dart';
import 'package:flutix/model/movie_list_play.dart';
import 'package:flutix/screens/movie_detail.dart';
// import 'package:flutix/model/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutix/widgets/app_nav.dart';
// import 'package:provider/provider.dart';

class Home_Movies extends StatefulWidget {
  const Home_Movies({super.key});

  @override
  State<Home_Movies> createState() => _Home_MoviesState();
}

class _Home_MoviesState extends State<Home_Movies> {
  Movie_Cooming_List_Provider movieProvider = Movie_Cooming_List_Provider();
  Movie_Data_Play_Provider movie_Play_Provider = Movie_Data_Play_Provider();

  int _selectedTabIndex = 0;

  String namaLengkap = '';
  String saldo = '';
  String imageUrl = '';

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      // Mendapatkan instance user saat ini dari Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      // Memeriksa apakah user telah login
      if (user != null) {
        // Mendapatkan referensi koleksi pengguna di Firestore
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        // Mendapatkan dokumen pengguna berdasarkan ID pengguna saat ini
        DocumentSnapshot userDocument = await users.doc(user.uid).get();

        // Mengekstrak data dari dokumen
        if (userDocument.exists) {
          Map<String, dynamic> userData =
              userDocument.data() as Map<String, dynamic>;

          // Mengakses data pengguna
          String fetchednamaLengkap = userData['namaLengkap'];
          String fetchedsaldo = userData['saldo'];
          String fetchedeimage = userData['profile'];

          // Mengupdate state untuk memperbarui tampilan
          setState(() {
            namaLengkap = fetchednamaLengkap;
            saldo = fetchedsaldo;
            imageUrl = fetchedeimage;
          });
        } else {
          print('Dokumen pengguna tidak ditemukan di Firestore.');
        }
      } else {
        // Jika pengguna belum login, tetapkan nilai default "Anonymous"
        setState(() {
          namaLengkap = 'Anonymous';
          // username = 'Anonymous';
          // email = 'No Email';
        });
      }
    } catch (e) {
      print('Error saat mengambil data pengguna: $e');
    }
  }

  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    // final _listPage = <Widget>[const Text("Beranda"), Profile(), Wallet()];

    // final _bottomNavBarItems = <BottomNavigationBarItem>[
    //   const BottomNavigationBarItem(
    //     icon: Icon(Icons.home),
    //     label: 'Beranda',
    //   ),
    //   const BottomNavigationBarItem(
    //     icon: Icon(Icons.abc_sharp),
    //     label: 'idk',
    //   ),
    //   const BottomNavigationBarItem(
    //     icon: Icon(Icons.movie),
    //     label: 'movie',
    //   ),

    // ];

    // final _bottomNavBar = BottomNavigationBar(
    //   type: BottomNavigationBarType.fixed,
    //   backgroundColor: Colors.amberAccent,
    //   items : _bottomNavBarItems,
    //   currentIndex: _selectedTabIndex,
    //   unselectedItemColor: Colors.white,
    //   selectedItemColor: Colors.amber,
    //   onTap: _onNavBarTapped,
    // );

    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 50, 56, 1),
      // bottomNavigationBar: App_Nav(),
      appBar: AppBar(
        backgroundColor: Color(0xFFB4D429),
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
              padding: EdgeInsets.only(left: 30, bottom: 20),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        child: Container(
                          width: 54,
                          height: 54,
                          decoration: ShapeDecoration(
                            image: DecorationImage(image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/flutix-9d582.appspot.com/o/images%2Fuser_profile%2F4.png?alt=media&token=c6683eef-5b77-4d50-bed9-078b7d5df281'),
                            fit: BoxFit.cover),
                            color: Colors.amber,
                            // image: DecorationImage(
                            //   image: NetworkImage(
                            //       "https://via.placeholder.com/54x54"),
                            //   fit: BoxFit.fill,
                            // ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFB4D429)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      )
                      //  Container(

                      //   child: Icon(Icons.person_outline_rounded),
                      // ),
                      // Container(
                      //   height: 30,
                      //   width: 30,
                      //   decoration: const BoxDecoration(
                      //       color: Colors.amber,
                      //       borderRadius: BorderRadius.all(Radius.circular(20))),
                      //   child: const Icon(
                      //     Icons.edit,
                      //     color: Colors.deepPurple,
                      //     size: 20,
                      //   ),
                      // )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          namaLengkap,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          'IDR $saldo',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(54, 53, 56, 1),
                          ),
                        ),
                        // Text(
                        //   '+1 1254 251 241',
                        //   style: TextStyle(
                        //     fontSize: 13,
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
      // AppBar(
      //   backgroundColor: Color(0xFFB4D429),
      // ),
      // bottomNavigationBar: App_Nav(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack(
            //   children: [
            //     Container(
            //       width: lebar,
            //       height: 100,
            //       decoration: ShapeDecoration(
            //         color: Color(0xFFB4D429),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 20),
              child: Text(
                'Now Playing',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: lebar,
              child: Play_Movie(play: movie_Play_Provider),
              // CarouselSlider.builder(
              //   itemCount: 10,
              //   options: CarouselOptions(
              //     height: 200,
              //     autoPlay: true,
              //     viewportFraction: 0.55,
              //     enlargeCenterPage: true,
              //     pageSnapping: true,
              //     autoPlayCurve: Curves.fastOutSlowIn,
              //     autoPlayAnimationDuration: const Duration(seconds: 1),
              //   ),
              //   itemBuilder: (context, index, PageView) {
              //     return ClipRRect(
              //       borderRadius: BorderRadius.circular(12),
              //       child: Container(
              //         height: 230,
              //         width: 230,
              //         color: Colors.black,
              //       ),
              //     );
              //   },
              // ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 20),
              child: Text(
                'Category',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
                height: 95,
                width: lebar,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                //action coe when button is pressed
                              },
                              icon: Icon(Icons.favorite_rounded,
                                  size: 35, color: Colors.black),
                            ),
                            Text(
                              'Romance',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 180, 212, 41),
                              ),
                            )
                          ],
                        ),
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(94, 93, 96, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                //action coe when button is pressed
                              },
                              icon: Icon(Icons.sports_baseball_rounded,
                                  size: 35, color: Colors.black),
                            ),
                            Text(
                              'Sport',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 180, 212, 41),
                              ),
                            )
                          ],
                        ),
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(94, 93, 96, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                //action coe when button is pressed
                              },
                              icon: Icon(Icons.castle_rounded,
                                  size: 35, color: Colors.black),
                            ),
                            Text(
                              'Fantasy',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 180, 212, 41),
                              ),
                            )
                          ],
                        ),
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(94, 93, 96, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                //action coe when button is pressed
                              },
                              icon: Icon(Icons.anchor_sharp,
                                  size: 35, color: Colors.black),
                            ),
                            Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 180, 212, 41),
                              ),
                            )
                          ],
                        ),
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(94, 93, 96, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                //action coe when button is pressed
                              },
                              icon: Icon(Icons.toys_rounded,
                                  size: 35, color: Colors.black),
                            ),
                            Text(
                              'Kids',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 180, 212, 41),
                              ),
                            )
                          ],
                        ),
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(94, 93, 96, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                // ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     physics: const BouncingScrollPhysics(),
                //     itemCount: 10,
                //     itemBuilder: (context, index) {
                //       return Padding(
                //         padding: EdgeInsets.all(8.0),
                //         child: Container(
                //           decoration: ShapeDecoration(
                //             color: Color.fromRGBO(94, 93, 96, 1),
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //           ),
                //           height: 60,
                //           width: 60,
                //         ),
                //       );
                //     }),
                ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
              child: Text(
                'Cooming Soon',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
                height: 140,
                width: lebar,
                child: Cooming_Soon_Movie(provider: movieProvider)),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
              child: Text(
                'Discount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: lebar,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Container(
                        width: 250,
                        height: 170,
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: lebar,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/promo1.png'),
                                    fit: BoxFit.cover),
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Container(
                                width: 186,
                                height: 106,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(-0.00, -1.00),
                                    end: Alignment(0, 1.5),
                                    colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black,
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 2),
                              child: SizedBox(
                                width: 90,
                                height: 25,
                                child: ElevatedButton(
                                  child: const Text('Get Now',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400)),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return Sign_Up();
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        Color.fromARGB(255, 54, 53, 56),
                                    backgroundColor:
                                        Color.fromARGB(255, 180, 212, 41),
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
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 250,
                        height: 170,
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: lebar,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/promo2.png'),
                                    fit: BoxFit.cover),
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Container(
                                width: 186,
                                height: 106,
                                decoration: ShapeDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(-0.00, -1.00),
                                    end: Alignment(0, 1.5),
                                    colors: [
                                      Colors.black.withOpacity(0),
                                      Colors.black,
                                    ],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 2),
                              child: SizedBox(
                                width: 90,
                                height: 25,
                                child: ElevatedButton(
                                  child: const Text('Get Now',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400)),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) {
                                    //       return Sign_Up();
                                    //     },
                                    //   ),
                                    // );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        Color.fromARGB(255, 54, 53, 56),
                                    backgroundColor:
                                        Color.fromARGB(255, 180, 212, 41),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Play_Movie extends StatelessWidget {
  final Movie_Data_Play_Provider play;

  Play_Movie({required this.play});

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    return CarouselSlider.builder(
      itemCount: play.movieListPlay.length,
      options: CarouselOptions(
        height: 260,
        autoPlay: true,
        viewportFraction: 0.60,
        enlargeCenterPage: true,
        pageSnapping: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 1),
      ),
      itemBuilder: (context, index, PageView) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Movie_Detail(movieDetail: play.movieListPlay[index]),
              ),
            );
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: tinggi,
                width: 380,
                decoration: ShapeDecoration(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 165,
                        width: 280,
                        decoration: ShapeDecoration(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/${play.movieListPlay[index].picture}"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Text(
                        "${play.movieListPlay[index].title}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}

class Cooming_Soon_Movie extends StatelessWidget {
  final Movie_Cooming_List_Provider provider;

  Cooming_Soon_Movie({required this.provider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: provider.movieComingList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: ShapeDecoration(
                  color: Color.fromRGBO(94, 93, 96, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  image: DecorationImage(
                      image: AssetImage(
                          "assets/${provider.movieComingList[index].picture}"),
                      fit: BoxFit.fill)),
              height: 200,
              width: 95,
            ),
          );
        });
    // ListView.builder(
    //   itemCount: provider.movieComingList.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text('Movie ${index + 1}'),
    //       leading: Image.network(
    //         provider.movieComingList[index].picture,
    //         width: 50.0,
    //         height: 50.0,
    //         fit: BoxFit.cover,
    //       ),
    //     );
    //   },
    // );
  }
}
