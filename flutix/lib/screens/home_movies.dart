import 'package:flutix/model/movie_cooming_list.dart';
import 'package:flutix/model/movie_list_play.dart';
// import 'package:flutix/model/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutix/widgets/app_nav.dart';
import 'package:provider/provider.dart';

class Home_Movies extends StatefulWidget {
  const Home_Movies({super.key});

  @override
  State<Home_Movies> createState() => _Home_MoviesState();
}

class _Home_MoviesState extends State<Home_Movies> {
  Movie_Cooming_List_Provider movieProvider = Movie_Cooming_List_Provider();
  Movie_Data_Play_Provider movie_Play_Provider = Movie_Data_Play_Provider();

  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
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
      appBar: customAppBar(),
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
              height: 70,
              width: lebar,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        decoration: ShapeDecoration(
                          color: Color.fromRGBO(94, 93, 96, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        height: 60,
                        width: 60,
                      ),
                    );
                  }),
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

AppBar customAppBar() {
  return AppBar(
    backgroundColor: Color(0xFFB4D429),
    // centerTitle: true,
    // title: const Text(
    //   'Dashboard',
    //   style: TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
    // ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
    // leading: InkWell(
    //   onTap: () {},
    //   child: const Icon(
    //     Icons.subject,
    //     color: Colors.white,
    //   ),
    // ),
    // actions: [
    //   InkWell(
    //     onTap: () {},
    //     child: const Padding(
    //       padding: EdgeInsets.all(8.0),
    //       child: Icon(
    //         Icons.notifications,
    //         size: 20,
    //       ),
    //     ),
    //   ),
    // ],
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          padding: const EdgeInsets.only(left: 30, bottom: 20),
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
                            side:
                                BorderSide(width: 1, color: Color(0xFFB4D429)),
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
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Angga Risky',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      'IDR 280.000',
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
  );
}

class Play_Movie extends StatelessWidget {
  final Movie_Data_Play_Provider play;

  Play_Movie({required this.play});

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    return CarouselSlider.builder(
      itemCount: play.MovieListPlay.length,
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
        return ClipRRect(
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
                                  "assets/${play.MovieListPlay[index].picture}"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      "${play.MovieListPlay[index].title}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ));
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
