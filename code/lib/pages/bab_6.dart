// bab_6.dart
import 'package:flutter/material.dart';

class Bab6 extends StatelessWidget {
  const Bab6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Bab 6'),
      ),
      body: const Center(
        child: Text(
          'Ini adalah isi dari Bab 6',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
