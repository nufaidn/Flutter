// bab_2.dart
import 'package:flutter/material.dart';

class Bab2 extends StatelessWidget {
  const Bab2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biodata Saya'),
        backgroundColor: Color.fromARGB(255, 28, 148, 208), 
      ),
      body: Center(
        child: Text(
          'Nufail \nKelas XI RPL',
          textAlign: TextAlign.center,
          style: 
          TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
