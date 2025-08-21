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

// // ⁡⁣⁣⁢​‌‍‌𝗡𝗮𝗺𝗲𝗱 𝗥𝗼𝘂𝘁𝗲𝘀​⁡

// import 'package:flutter/material.dart';

// // Halaman Pertama
// class Bab5 extends StatelessWidget {
//   const Bab5({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Halaman Utama')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const SecondScreenNamed(),
//                   ),
//                 );
//               },
//               child: const Text('Pergi ke Halaman Kedua'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ThirdScreenNamed(),
//                   ),
//                 );
//               },
//               child: const Text('Pergi ke Halaman Ketiga'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Halaman Kedua
// class SecondScreenNamed extends StatelessWidget {
//   const SecondScreenNamed({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Halaman Kedua')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Kembali'),
//         ),
//       ),
//     );
//   }
// }

// // Halaman Ketiga
// class ThirdScreenNamed extends StatelessWidget {
//   const ThirdScreenNamed({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Halaman Ketiga')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Kembali'),
//         ),
//       ),
//     );
//   }
// }

// ⁡⁣⁣⁢​‌‍‌𝗣𝗮𝘀𝘀𝗶𝗻𝗴 𝗗𝗮𝘁𝗮 𝘃𝗶𝗮 𝗞𝗼𝗻𝘀𝘁𝗿𝘂𝗸𝘁𝗼𝗿​⁡

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Bab5(),
  ));
}

// Halaman Pertama (HomeScreen)
class Bab5 extends StatelessWidget {
  const Bab5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama (Kirim Data)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pergi ke Halaman Detail Buku'),
          onPressed: () {
            String bookTitle = "The Hobbit";
            String authorName = "J.R.R. Tolkien";

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  title: bookTitle,
                  author: authorName,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Halaman Kedua (DetailScreen)
class DetailScreen extends StatelessWidget {
  final String title;
  final String author;

  const DetailScreen({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Judul: $title',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Penulis: $author',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// // ⁡⁣⁣⁢​‌‍‌𝗣𝗮𝘀𝘀𝗶𝗻𝗴 𝗗𝗮𝘁𝗮 𝘃𝗶𝗮 𝗔𝗿𝗴𝘂𝗺𝗲𝗻𝘁𝘀 (𝗡𝗮𝗺𝗲𝗱 𝗥𝗼𝘂𝘁𝗲𝘀)​⁡

// import 'package:flutter/material.dart';

// class Bab5 extends StatelessWidget {
//   const Bab5({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // ✅ Definisikan semua route
//       onGenerateRoute: (settings) {
//         if (settings.name == '/detailWithArgs') {
//           final args = settings.arguments as Map<String, dynamic>?;
//           return MaterialPageRoute(
//             builder: (context) => DetailScreenWithArgs(args: args),
//           );
//         } else if (settings.name == '/checkout') {
//           final args = settings.arguments as Map<String, dynamic>?;
//           return MaterialPageRoute(
//             builder: (context) => CheckoutScreen(args: args),
//           );
//         }
//         return null;
//       },
//       home: const HomeScreen(),
//     );
//   }
// }

// // ✅ Halaman Utama (Home)
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home (Named Data)'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // 🔥 Tambah gambar produk
//             Image.asset(
//               'assets/images/asus_gaming.jpg',
//               width: 250,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Lihat Detail Produk'),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/detailWithArgs',
//                   arguments: {
//                     'productId': 123,
//                     'productName': 'Laptop Gaming',
//                     'price': 1500.00,
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ✅ Halaman Kedua (Detail)
// class DetailScreenWithArgs extends StatelessWidget {
//   final Map<String, dynamic>? args;
//   const DetailScreenWithArgs({super.key, this.args});

//   @override
//   Widget build(BuildContext context) {
//     final int? productId = args?['productId'];
//     final String? productName = args?['productName'];
//     final double? price = args?['price'];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Produk'),
//         backgroundColor: Colors.purpleAccent,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/asus_gaming.jpg',
//               width: 250,
//               height: 200,
//               fit: BoxFit.cover,
//             ),
//             Text('ID Produk: $productId', style: const TextStyle(fontSize: 20)),
//             Text(
//               'Nama: $productName',
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text('Harga: \$$price', style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               child: const Text('Checkout Sekarang'),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/checkout',
//                   arguments: {
//                     'productId': productId,
//                     'productName': productName,
//                     'price': price,
//                   },
//                 );
//               },
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Kembali ke Home'),
//               onPressed: () {
//                 Navigator.popUntil(context, ModalRoute.withName('/'));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ✅ Halaman Ketiga (Checkout)
// class CheckoutScreen extends StatelessWidget {
//   final Map<String, dynamic>? args;
//   const CheckoutScreen({super.key, this.args});

//   @override
//   Widget build(BuildContext context) {
//     final String? productName = args?['productName'];
//     final double? price = args?['price'];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Checkout'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Kamu akan membeli $productName',
//               style: const TextStyle(fontSize: 20),
//             ),
//             Text('Total: \$$price', style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Kembali ke Home'),
//               onPressed: () {
//                 Navigator.popUntil(context, ModalRoute.withName('/'));
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Lihat Detail Produk'),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/detailWithArgs',
//                   arguments: {
//                     'productId': 123,
//                     'productName': 'Laptop Gaming',
//                     'price': 1500.00,
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ⁡⁣⁣⁢​‌‍‌𝗠𝗲𝗻𝗴𝗲𝗺𝗯𝗮𝗹𝗶𝗸𝗮𝗻 𝗗𝗮𝘁𝗮 𝗱𝗮𝗿𝗶 𝗛𝗮𝗹𝗮𝗺𝗮𝗻 𝗞𝗲𝗱𝘂𝗮​⁡

// import 'package:flutter/material.dart';

// class Bab5 extends StatelessWidget {
//   const Bab5({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home (Named Data)'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // ✅ Tambahkan gambar produk
//             Image.asset(
//               'assets/images/asus_gaming.jpg', // pastikan ada di folder assets
//               height: 200,
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Laptop Gaming',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               '\$1500.00',
//               style: TextStyle(fontSize: 20, color: Colors.grey),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               child: const Text('Lihat Detail Produk'),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   '/detailWithArgs',
//                   arguments: {
//                     'productId': 123,
//                     'productName': 'Laptop Gaming',
//                     'price': 1500.00,
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ✅ Halaman Kedua
// class DetailScreenWithArgs extends StatelessWidget {
//   final Map<String, dynamic>? args;
//   const DetailScreenWithArgs({super.key, this.args});

//   @override
//   Widget build(BuildContext context) {
//     final int? productId = args?['productId'];
//     final String? productName = args?['productName'];
//     final double? price = args?['price'];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Produk'),
//         backgroundColor: Colors.purpleAccent,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('ID Produk: ${productId ?? "123"}',
//                 style: const TextStyle(fontSize: 20)),
//             Text('Nama: ${productName ?? "Laptop Asus Gaming"}',
//                 style: const TextStyle(
//                     fontSize: 24, fontWeight: FontWeight.bold)),
//             Text('Harga: \$${price?.toStringAsFixed(2) ?? "50.000.000"}',
//                 style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               child: const Text('Bayar Produk'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PaymentScreen(
//                       productName: productName ?? "Produk",
//                       price: price ?? 0,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ✅ Halaman Ketiga (Pembayaran)
// class PaymentScreen extends StatelessWidget {
//   final String productName;
//   final double price;

//   const PaymentScreen({
//     super.key,
//     required this.productName,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pembayaran'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Anda akan membayar $productName',
//                 style:
//                     const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//             Text('Total: \$${price.toStringAsFixed(2)}',
//                 style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               child: const Text('Konfirmasi Bayar'),
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Pembayaran Berhasil ✅')),
//                 );
//                 Navigator.pop(context); // kembali ke detail
//               },
//             ),
//             SizedBox(height: 30,),
//             Text('Total: \$$price', style: const TextStyle(fontSize: 18)),
            
            

//             // const SizedBox(height: 20),
//             // ElevatedButton(
//             //   child: const Text('Kembali ke Home'),
//             //   onPressed: () {
//             //     Navigator.popUntil(context, ModalRoute.withName('/'));
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
