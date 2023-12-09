import 'package:flutix/screens/edit_profile.dart';
import 'package:flutix/screens/wallet.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutix/widgets/app_nav.dart';
// import 'package:flutix/widgets/app_nav.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 53, 56),
      
      // bottomNavigationBar: App_Nav(),
      body: ListView(
        children: [
          Container(
            width: lebar,
            height: tinggi,
            color: Color.fromARGB(255, 54, 53, 56),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: lebar,
                  height: 350,
                  padding: const EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/saldo.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    width: lebar,
                    height: tinggi,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.00, -1.00),
                        end: Alignment(0, 1),
                        colors: [Color(0x7F373538), Color(0xFF363538)],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/theNun.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Angga Risky',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'anggavone@bwa.com',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            width: lebar,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Ticket History',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '8 Ticket',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 180, 212, 41),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  child: DottedLine(
                                    direction: Axis.vertical,
                                    lineLength: 59,
                                    lineThickness: 2.0,
                                    dashLength: 4.0,
                                    dashColor:
                                        Color.fromARGB(255, 180, 212, 41),
                                    dashRadius: 0.0,
                                    dashGapLength: 4.0,
                                    dashGapColor:
                                        Color.fromARGB(255, 180, 212, 41),
                                    dashGapRadius: 0.0,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'My Saldo',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'IDR 280.000',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 180, 212, 41),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: DottedLine(
                            direction: Axis.horizontal,
                            lineLength: lebar,
                            lineThickness: 2.0,
                            dashLength: 4.0,
                            dashColor: Color.fromARGB(255, 180, 212, 41),
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                            dashGapColor: Color.fromARGB(255, 180, 212, 41),
                            dashGapRadius: 0.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Edit_Profile()),
                        );
                      },
                      icon: Icon(
                        Icons.manage_accounts_rounded,
                        size: 30,
                        color: Color.fromARGB(255, 180, 212, 41),
                      ),
                      label: Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Wallet()),
                        );
                      },
                      icon: Icon(
                        Icons.wallet,
                        size: 30,
                        color: Color.fromARGB(255, 180, 212, 41),
                      ),
                      label: Text(
                        "My Wallet",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          // MaterialPageRoute(builder: (context) {
                          //   return Wallet();
                          // }),
                        );
                        //action coe when button is pressed
                      },
                      icon: Icon(
                        Icons.translate_rounded,
                        size: 30,
                        color: Color.fromARGB(255, 180, 212, 41),
                      ),
                      label: Text(
                        "Change Language",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        //action coe when button is pressed
                      },
                      icon: Icon(
                        Icons.help_center_rounded,
                        size: 30,
                        color: Color.fromARGB(255, 180, 212, 41),
                      ),
                      label: Text(
                        "Help Center",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        //action coe when button is pressed
                      },
                      icon: Icon(
                        Icons.star_border_purple500_rounded,
                        size: 30,
                        color: Color.fromARGB(255, 180, 212, 41),
                      ),
                      label: Text(
                        "Rate Flutix App",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
