// // ⁡⁣⁣⁢​‌‍‌𝗕𝗮𝘀𝗶𝗰 𝗥𝗼𝘂𝘁𝗶𝗻𝗴 (𝗠𝗮𝘁𝗲𝗿𝗶𝗮𝗹𝗣𝗮𝗴𝗲𝗥𝗼𝘂𝘁𝗲) ​⁡

// // lib/main.dart
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: Bab5(), // Halaman awal aplikasi
//     ),
//   );
// }

// @override
// // Halaman Pertama (HomeScreen) - Stateless Widget
// class Bab5 extends StatelessWidget {
//   const Bab5({super.key});
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Halaman Utama'),

//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Pergi ke Halaman Kedua'),
//           onPressed: () {
//             // Menggunakan Navigator.push untuk berpindah halaman
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const SecondScreen(),
//               ), // Definisi rute ke SecondScreen
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// // Halaman Kedua (SecondScreen) - Stateless Widget
// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Halaman Kedua'),
//         backgroundColor: Colors.greenAccent,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Kembali ke Halaman Utama'),
//           onPressed: () {
//             // Menggunakan Navigator.pop untuk kembali ke halaman sebelumnya

//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }

// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const Bab5(), // Halaman awal aplikasi
      routes: {
        // Mendefinisikan named routes
        '/second': (context) => const SecondScreenNamed(),
        '/third': (context) => const ThirdScreenNamed(), // Contoh rute lain
      },
    ),
  );
}

// Halaman Pertama (HomeScreen)
class Bab5 extends StatelessWidget {
  const Bab5({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama (Named Routes)'),

        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Pergi ke Halaman Kedua'),
              onPressed: () {
                // Berpindah menggunakan named route
                Navigator.pushNamed(context, '/second');
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Pergi ke Halaman Ketiga'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Kedua (SecondScreenNamed)
class SecondScreenNamed extends StatelessWidget {
  const SecondScreenNamed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kedua (Named)'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

// Halaman Ketiga (ThirdScreenNamed)
class ThirdScreenNamed extends StatelessWidget {
  const ThirdScreenNamed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Ketiga (Named)'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
