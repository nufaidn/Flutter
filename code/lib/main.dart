import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/bab_2.dart';
import 'pages/bab_3.dart';
import 'pages/bab_4.dart';
import 'pages/bab_5.dart';
import 'pages/bab_6.dart';
import 'pages/bab_7.dart';
import 'pages/bab_8.dart';
import 'pages/bab_9.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Learning App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/bab9',
      getPages: [
        GetPage(name: '/bab2', page: () => const Bab2()),
        GetPage(name: '/bab3', page: () => const Bab3()),
        GetPage(name: '/bab4', page: () => const Bab4()),
        GetPage(name: '/bab5', page: () => const Bab5()),
        GetPage(name: '/bab6', page: () => Bab6()),
        GetPage(name: '/bab7', page: () => const Bab7()),
        GetPage(name: '/bab8', page: () => const Bab8()),
        GetPage(name: '/bab9', page: () => const Bab9()),
      ],
    );
  }
}
