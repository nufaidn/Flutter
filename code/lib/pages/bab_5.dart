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

import 'package:flutter/material.dart';

// Halaman Pertama
class Bab5 extends StatelessWidget {
  const Bab5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreenNamed()),
                );
              },
              child: const Text('Pergi ke Halaman Kedua'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThirdScreenNamed()),
                );
              },
              child: const Text('Pergi ke Halaman Ketiga'),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Kedua
class SecondScreenNamed extends StatelessWidget {
  const SecondScreenNamed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kedua'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Kembali'),
        ),
      ),
    );
  }
}

// Halaman Ketiga
class ThirdScreenNamed extends StatelessWidget {
  const ThirdScreenNamed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Ketiga'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Kembali'),
        ),
      ),
    );
  }
}
