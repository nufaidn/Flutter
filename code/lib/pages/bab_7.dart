
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
    home: PhotoListScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// Model class untuk Photo dari JSONPlaceholder API
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // Factory constructor untuk membuat Photo dari JSON
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'],
      id: json['id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

// Service class untuk API calls
class PhotoService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<Photo>> fetchPhotos() async {
    final response = await http.get(Uri.parse('$baseUrl/photos'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Photo.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat foto: ${response.statusCode}');
    }
  }
}

// Main screen untuk menampilkan daftar foto
class PhotoListScreen extends StatefulWidget {
  const PhotoListScreen({super.key});

  @override
  State<PhotoListScreen> createState() => _PhotoListScreenState();
}

class _PhotoListScreenState extends State<PhotoListScreen> {
  late Future<List<Photo>> _photosFuture;

  @override
  void initState() {
    super.initState();
    _photosFuture = PhotoService.fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: FutureBuilder<List<Photo>>(
        future: _photosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Tampilkan loading indicator
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Memuat foto...', style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            // Tampilkan pesan error
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _photosFuture = PhotoService.fetchPhotos();
                      });
                    },
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            // Tampilkan GridView dengan foto-foto
            final photos = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.8, // Rasio lebar:tinggi
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailScreen(photo: photo),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              photo.thumbnailUrl,
                              fit: BoxFit.cover,
                              headers: const {
                                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                              },
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: 150,
                                  child: const Center(
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                print('Error loading image: $error');
                                return Container(
                                  height: 150,
                                  color: Colors.grey[200],
                                  child: const Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'No Image',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  photo.title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'ID: ${photo.id}',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            // Kondisi default jika tidak ada data
            return const Center(
              child: Text(
                'Tidak ada foto tersedia.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}

// Screen untuk menampilkan detail foto
class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo ${photo.id}'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar ukuran penuh
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  photo.url,
                  fit: BoxFit.cover,
                  headers: const {
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 300,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading full image: $error');
                    return Container(
                      height: 300,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              size: 64,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Gambar tidak tersedia',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Detail informasi
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detail Foto',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDetailRow('ID', '${photo.id}'),
                    _buildDetailRow('Album ID', '${photo.albumId}'),
                    _buildDetailRow('Judul', photo.title),
                    const SizedBox(height: 16),
                    const Text(
                      'URL Gambar:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        photo.url,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// Alias untuk kompatibilitas dengan main.dart
class Bab7 extends StatelessWidget {
  const Bab7({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhotoListScreen();
  }
}






