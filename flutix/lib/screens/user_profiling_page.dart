import 'package:flutix/screens/confir_account_page.dart';
import 'package:flutix/screens/sign_up.dart';
import 'package:flutix/widgets/back.dart';
import 'package:flutter/material.dart';

class User_Profiling extends StatefulWidget {
  const User_Profiling({super.key});

  @override
  State<User_Profiling> createState() => _User_ProfilingState();
}

class _User_ProfilingState extends State<User_Profiling> {
  // variabel guna menyimpan index genre dan bahasa
  int selectedGenre = 0;
  int selectedLanguage = 0;

  String getGenre(int genreIndex) {
    List<String> genre = ["Horor", "Music", "Action", "Drama", "War", "Crime"];
    return genre[(genreIndex - 1) % 7];
  }

  String getLanguage(int languageIndex) {
    List<String> language = ["Bahasa", "English", "Japanese", "Korean"];
    return language[(languageIndex - 1) % 5];
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(54, 53, 56, 1),
      appBar: AppBar(
        leading: Arrow_Back(),
        title: Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text('Select Your\nFavourit Genre',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        backgroundColor: Color.fromRGBO(54, 53, 56, 1),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: lebar,
            height: 340,
            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
            padding: EdgeInsets.only(left: 15),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Jumlah kolom
                crossAxisSpacing: 20, // Jarak antar kolom
                mainAxisSpacing: 40, // Jarak antar baris
                mainAxisExtent: lebar / 3,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 6, // Jumlah item (3 kolom x 2 baris = 6 item)
              itemBuilder: (context, index) {
                return GestureDetector( //pada saat di klik terjadi efek
                  onTap: () {
                    setState(() {
                      selectedGenre = index; // mengatur latar belakang jika genre dipilih atau gk
                    });
                  },
                  child: Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: selectedGenre == index
                          ? Color.fromRGBO(180, 212, 41, 1) // Selected color
                          : Color.fromRGBO(177, 177, 177, 1), // Default color
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      getGenre(index + 1), // menampilkn teks
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(54, 53, 56, 1),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(
            width: lebar,
            height: 50,
            child: Center(
              child: Text(
                "Which Movie Language\nYou Prefer?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: lebar,
            height: 200,
            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
            padding: EdgeInsets.only(left: 15),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom
                crossAxisSpacing: 20, // Jarak antar kolom
                mainAxisSpacing: 40, // Jarak antar baris
                mainAxisExtent: lebar / 3,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 4, // Jumlah item (2 kolom x 2 baris = 4 item)
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedLanguage = index;
                    });
                  },
                  child: Container(
                    width: 175,
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      color: selectedLanguage == index
                          ? Color.fromRGBO(180, 212, 41, 1) // Selected color
                          : Color.fromRGBO(177, 177, 177, 1), // Default color
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      getLanguage(index + 1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(54, 53, 56, 1),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 30),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sign_Up()),
                    );
                  },
                  child: Text(
                    "Continue to Sign Up",
                    style: TextStyle(
                      color: Color.fromRGBO(177, 177, 177, 1),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 40),
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
                              builder: (context) => ConfirAccount()),
                        );
                      },
                      icon: Icon(
                        Icons.keyboard_double_arrow_right_outlined,
                      )))
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
