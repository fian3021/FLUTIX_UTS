import 'package:flutix/model/wallet.dart';
import 'package:flutix/screens/wallet_topup.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:provider/provider.dart';

// import 'camera_preview.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    // var tinggi = MediaQuery.of(context).size.height;
    return DraggableHome(
      // leading: GestureDetector(
      //     child: Icon( Icons.arrow_back_ios, color: Colors.black,  ),
      //     onTap: () {
      //       Navigator.pop(context);
      //     } ,
      //   ) ,
      leading: GestureDetector(
        child: Icon(
          Icons.keyboard_double_arrow_left_outlined,
          color: Color.fromARGB(255, 180, 212, 41),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Recent Transactions',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      // actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      // ],
      alwaysShowLeadingAndAction: true,
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
              child: Text(
                "Recent Transactions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            movies(),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 20, 60, 10),
              child: SizedBox(
                width: lebar,
                height: 50,
                child: ElevatedButton(
                  child: const Text('Top Up Wallet',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  onPressed: () {
                    // Navigasi ke halaman Wallet saat tombol diklik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Wallet_Topup(),
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
      ],
      fullyStretchable: false,
      backgroundColor: Color.fromARGB(255, 54, 53, 56),
      appBarColor: Color.fromARGB(255, 54, 53, 56),
    );
  }

  Row headerBottomBarWidget() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon(
        //   Icons.settings,
        //   color: Colors.white,
        // ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/saldo.png"), fit: BoxFit.cover)),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.00, -1.00),
            end: Alignment(0, 4),
            colors: [
              Color.fromARGB(255, 54, 53, 56),
              Colors.white.withOpacity(0)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 35,
            ),
            Text(
              'My Wallet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Consumer<WalletProvider>(
                builder: (context, walletProvider, child) {
                  return Text(
                    // "IDR ${walletProvider.walletModel.saldo.toString()}",
                    'Rp.${walletProvider.saldo.toString()}',
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 212, 41),
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                },
              ),
            ),
            Text(
              "Available balance",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
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
