import 'package:flutter/material.dart';
import 'pages/bab_2.dart';
import 'pages/bab_3.dart';
import 'pages/bab_4.dart';
import 'pages/bab_5.dart';
import 'pages/bab_6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning App',
      initialRoute: '/bab2',
      routes: {
        '/bab2': (context) => const Bab2(),
        '/bab3': (context) => const Bab3(),
        '/bab4': (context) => const Bab4(),
        '/bab5': (context) => const Bab5(),
<<<<<<< HEAD
        '/bab6': (context) => Bab6(),
=======
        '/bab6': (context) => const Bab6(),
        // '/detailWithArgs': (context) => const DetailScreenWithArgs(), // ✅ tambahkan ini, hanya untuk via argument (names route)
>>>>>>> 7a54a72c0811edaa727c673bdf8845cd6e08035d
      },
    );
  }
}
