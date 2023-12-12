import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/firebase_options.dart';
import 'package:flutix/model/movie_cooming_list.dart';
import 'package:flutix/model/movie_list_.dart';
import 'package:flutix/model/movie_list_play.dart';
import 'package:flutix/model/wallet.dart';
import 'package:flutix/screens/splash_screen.dart';
import 'package:flutix/widgets/app_nav.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutix/widgets/app_nav.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => Movie_Cooming_List_Provider()),
        ChangeNotifierProvider(create: (context) => Movie_Data_Provider()),
        ChangeNotifierProvider(create: (context) => Movie_Data_Play_Provider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 180, 212, 41),
            ),
            useMaterial3: true,
          ),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return App_Nav();
              } else {
                return Splash_Screen();
              }
            },
          ),
          // home: const Splash_Screen(),
        );
      }),
    );
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 180, 212, 41),),
  //       useMaterial3: true,
  //     ),
  //     home: const Splash_Screen(),
  //   );
  // }
}
