import 'package:code/pages/bab_7.dart';
import 'package:code/pages/bab_8.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
        '/bab6': (context) => Bab6(),
        '/bab7': (context) => const Bab7(),
        '/bab8': (context) => const Bab8(),
        // '/detailWithArgs': (context) => const DetailScreenWithArgs(), // ✅ tambahkan ini, hanya untuk via argument (names route)
      },
    );
  }
}
