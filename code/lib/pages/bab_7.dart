
// // Menggunakan http Package untuk Permintaan HTTP
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http; // Import package http
// import 'dart:convert'; // Untuk menggunakan jsonDecode

// // Model class untuk merepresentasikan data Todo dari API
// // Ini adalah cara yang baik untuk mengelola data JSON yang kompleks
// class Todo {
//   final int userId;
//   final int id;
//   final String title;
//   final bool completed;

//   const Todo({
//     required this.userId,
//     required this.id,
//     required this.title,
//     required this.completed,
//   });

//   // Factory constructor untuk membuat instance Todo dari map/JSON
//   factory Todo.fromJson(Map<String, dynamic> json) {
//     return Todo(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//       completed: json['completed'],
//     );
//   }
// }


// void main() {
//   runApp(const MaterialApp(
//     home: Bab7(), // Menggunakan widget Bab7 sesuai kode Anda
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class Bab7 extends StatefulWidget {
//   const Bab7({super.key});

//   @override
//   State<Bab7> createState() => _Bab7State();
// }

// class _Bab7State extends State<Bab7> {
//   // State untuk menyimpan data Todo yang sudah di-parse
//   Todo? _todo; 
//   // State untuk menandakan proses loading
//   bool _isLoading = false; 
//   // State untuk menyimpan pesan error jika terjadi
//   String? _errorMessage; 

//   // Fungsi asinkron untuk mengambil dan mem-parsing data
//   Future<void> fetchData() async {
//     // Mulai loading dan bersihkan data/error sebelumnya
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//       _todo = null;
//     });

//     try {
//       // PERBAIKAN FINAL: URL yang salah sudah dibetulkan di sini
//       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

//       if (response.statusCode == 200) { // Jika permintaan berhasil
//         // Update state dengan data baru yang sudah di-parse dari JSON
//         setState(() {
//           _todo = Todo.fromJson(jsonDecode(response.body));
//           _isLoading = false;
//         });
//       } else { // Jika server mengembalikan error
//         setState(() {
//           _errorMessage = 'Gagal memuat data: ${response.statusCode}';
//           _isLoading = false;
//         });
//       }
//     } catch (e) { // Tangani error jaringan atau lainnya
//       setState(() {
//         _errorMessage = 'Terjadi kesalahan: $e';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mengambil & Parsing Data API'),
//         backgroundColor: Colors.teal,
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   textStyle: const TextStyle(fontSize: 16),
//                 ),
//                 onPressed: _isLoading ? null : fetchData, // Nonaktifkan tombol saat loading
//                 child: const Text('Ambil Data dari API'),
//               ),
//               const SizedBox(height: 30),
              
//               // Tampilkan widget berdasarkan state saat ini
//               _buildDataDisplay(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget helper untuk menampilkan data, loading, atau error
//   Widget _buildDataDisplay() {
//     if (_isLoading) {
//       // Tampilkan indikator loading
//       return const CircularProgressIndicator();
//     } else if (_errorMessage != null) {
//       // Tampilkan pesan error
//       return Text(
//         _errorMessage!,
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 16, color: Colors.red),
//       );
//     } else if (_todo != null) {
//       // Tampilkan data jika berhasil diambil
//       return Card(
//         elevation: 4,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Judul: ${_todo!.title}',
//                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 'Status: ${_todo!.completed ? "Selesai" : "Belum Selesai"}',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: _todo!.completed ? Colors.green : Colors.orange,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 'ID Pengguna: ${_todo!.userId}',
//                 style: const TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       // Tampilan awal sebelum tombol ditekan
//       return const Text(
//         'Tekan tombol di atas untuk mengambil data.',
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: 16, color: Colors.grey),
//       );
//     }
//   }
// }


// // Parsing JSON Data
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert'; // Penting: import dart:convert untuk parsing JSON

// void main() {
//   runApp(const MaterialApp(
//     home: Bab7(), // Diubah
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class Bab7 extends StatefulWidget { // Diubah
//   const Bab7({super.key}); // Diubah
  
//   @override
//   State<Bab7> createState() => _Bab7State(); // Diubah
// }

// class _Bab7State extends State<Bab7> { // Diubah
//   String _title = 'Belum ada judul.';
//   bool _completed = false;
//   bool _isLoading = false; // State untuk indikator loading

//   Future<void> fetchTodo() async {
//     setState(() {
//       _isLoading = true; // Set loading true saat memulai fetch
//       _title = 'Memuat data...';
//       _completed = false;
//     });

//     try {
//       final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

//       if (response.statusCode == 200) {
//         // Parsing JSON: mengubah string JSON menjadi Map Dart
//         final Map<String, dynamic> todo = jsonDecode(response.body);
        
//         setState(() {
//           _title = todo['title']; // Akses nilai menggunakan key
//           _completed = todo['completed'];
//           _isLoading = false; // Set loading false setelah data diterima
//         });
//       } else {
//         setState(() {
//           _title = 'Gagal memuat data: ${response.statusCode}';
//           _completed = false;
//           _isLoading = false;
//         });
//         print('Gagal memuat data: ${response.statusCode}');
//       }
//     } catch (e) {
//       setState(() {
//         _title = 'Terjadi kesalahan: $e';
//         _completed = false;
//         _isLoading = false;
//       });
//       print('Terjadi kesalahan: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Parsing JSON Data (Bab 7)'),
//         backgroundColor: Colors.purple,
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _isLoading
//                   ? const CircularProgressIndicator() // Tampilkan loading indicator
//                   : Column(
//                       children: [
//                         Text(
//                           'Judul Todo: $_title',
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           'Selesai: ${_completed ? "Ya" : "Tidak"}',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: _completed ? Colors.green : Colors.red,
//                           ),
//                         ),
//                       ],
//                     ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                   foregroundColor: Colors.white,
//                 ),
//                 onPressed: _isLoading ? null : fetchTodo, // Nonaktifkan tombol saat loading
//                 child: const Text('Ambil Todo Baru'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: Bab7(), // Diubah
    debugShowCheckedModeBanner: false,
  ));
}

// Model data untuk Post
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  // Factory constructor untuk membuat Post dari JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Bab7 extends StatefulWidget { // Diubah
  const Bab7({super.key}); // Diubah

  @override
  State<Bab7> createState() => _Bab7State(); // Diubah
}

class _Bab7State extends State<Bab7> { // Diubah
  // Deklarasikan Future di sini, agar tidak dipanggil berulang kali saat setState
  late Future<List<Post>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = fetchPosts(); // Inisialisasi Future saat widget pertama kali dibuat
  }

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      // Jika server mengembalikan respons 200 OK, parse JSON
      List jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      // Jika respons tidak 200 OK, lempar exception
      throw Exception('Gagal memuat posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Posts (Bab 7)'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Post>>( // FutureBuilder yang menunggu List<Post>
        future: _postsFuture, // Future yang akan dipantau
        builder: (context, snapshot) {
          // snapshot berisi status dan data dari Future
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Tampilkan loading indicator saat menunggu
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Tampilkan pesan error jika ada
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Jika data tersedia, tampilkan dalam ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple[100],
                      child: Text('${post.id}')
                    ),
                  ),
                );
              },
            );
          } else {
            // Kondisi default jika tidak ada data
            return const Center(child: Text('Tidak ada data tersedia.'));
          }
        },
      ),
    );
  }
}






