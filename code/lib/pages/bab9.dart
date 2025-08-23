// // lib/main.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// //=================================================
// // BAGIAN 1: LOGIKA / OTAK (Class diubah menjadi Bab9Cubit)
// //=================================================
// class Bab9Cubit extends Cubit<int> {
//   /// Konstruktor const untuk class Bab9Cubit.
//   Bab9Cubit() : super(0);

//   /// Menambah state saat ini sebanyak 1 dan mengumumkannya ke UI.
//   void increment() => emit(state + 1);

//   /// Mengurangi state saat ini sebanyak 1 dan mengumumkannya ke UI.
//   void decrement() => emit(state - 1);
// }

// //=================================================
// // BAGIAN 2: TITIK AWAL APLIKASI
// //=================================================
// void main() {
//   runApp(const Bab9()); // Menggunakan class Bab9App
// }

// // Class MyApp diubah menjadi Bab9
// class Bab9 extends StatelessWidget {
//   const Bab9({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => Bab9Cubit(), // Menyediakan Bab9Cubit
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Cubit Counter Bab 9',
//         home: Bab9Screen(), // Halaman utama adalah Bab9Screen
//       ),
//     );
//   }
// }

// //=================================================
// // BAGIAN 3: TAMPILAN / UI (Class diubah menjadi Bab9Screen)
// //=================================================
// class Bab9Screen extends StatelessWidget {
//   const Bab9Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter App Bab 9'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Nilai Counter Saat Ini:',
//               style: TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 16),
//             // Mendengarkan perubahan dari Bab9Cubit
//             BlocBuilder<Bab9Cubit, int>(
//               builder: (context, count) {
//                 return Text(
//                   '$count',
//                   style: const TextStyle(
//                     fontSize: 60,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () {
//               // Memanggil fungsi increment dari Bab9Cubit
//               context.read<Bab9Cubit>().increment();
//             },
//             tooltip: 'Tambah',
//             child: const Icon(Icons.add),
//           ),
//           const SizedBox(height: 16),
//           FloatingActionButton(
//             onPressed: () {
//               // Memanggil fungsi decrement dari Bab9Cubit
//               context.read<Bab9Cubit>().decrement();
//             },
//             tooltip: 'Kurang',
//             child: const Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }









// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// --- BAGIAN 1: CONTROLLER (OTAK) ---
// Controller tetap menggunakan nama Bab9Controller
class Bab9Controller extends GetxController {
  var count = 0.obs;

  void increment() => count.value++;
  void decrement() => count.value--;
}

// --- BAGIAN 2: APLIKASI UTAMA ---
void main() {
  // Langsung jalankan class Bab9
  runApp(const Bab9());
}

// --- BAGIAN 3: CLASS UTAMA DAN TAMPILAN (UI) ---
// Class utama sekarang hanya bernama Bab9
class Bab9 extends StatelessWidget {
  const Bab9({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftarkan Bab9Controller menggunakan Get.put()
    // Ini bisa dilakukan di sini karena widget ini adalah root
    final Bab9Controller bab9controller = Get.put(Bab9Controller());

    // GetMaterialApp sekarang menjadi bagian dari class ini
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App Bab 9'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nilai Counter:',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              // Obx memantau perubahan dari bab9controller
              Obx(
                () => Text(
                  '${bab9controller.count.value}',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => bab9controller.increment(),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () => bab9controller.decrement(),
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}