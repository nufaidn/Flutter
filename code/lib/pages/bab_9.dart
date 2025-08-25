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




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// --- BAGIAN 1: MODEL ---
class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

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

// --- BAGIAN 2: CONTROLLER (OTAK) ---
class PhotoController extends GetxController {
  // Observable variables
  var photos = <Photo>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadPinterestPhotos();
  }

  void loadPinterestPhotos() {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      // Simulate loading delay
      Future.delayed(const Duration(milliseconds: 500), () {
        photos.value = [
          Photo(
            albumId: 1,
            id: 1,
            title: "Beautiful Sunset Landscape",
            url: "https://i.pinimg.com/736x/36/f0/21/36f021b0b0b0b0b0b0b0b0b0b0b0b0b0.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/36/f0/21/36f021b0b0b0b0b0b0b0b0b0b0b0b0b0.jpg",
          ),
          Photo(
            albumId: 1,
            id: 2,
            title: "Mountain Adventure",
            url: "https://i.pinimg.com/736x/8c/4a/7b/8c4a7b2c3d4e5f6a7b8c9d0e1f2a3b4c.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/8c/4a/7b/8c4a7b2c3d4e5f6a7b8c9d0e1f2a3b4c.jpg",
          ),
          Photo(
            albumId: 1,
            id: 3,
            title: "Ocean Waves",
            url: "https://i.pinimg.com/736x/2e/1e/3d/2e1e3d4c5b6a7f8e9d0c1b2a3f4e5d6c.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/2e/1e/3d/2e1e3d4c5b6a7f8e9d0c1b2a3f4e5d6c.jpg",
          ),
          Photo(
            albumId: 1,
            id: 4,
            title: "Forest Path",
            url: "https://i.pinimg.com/736x/7b/8b/9c/7b8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/7b/8b/9c/7b8b9c0d1e2f3a4b5c6d7e8f9a0b1c2d.jpg",
          ),
          Photo(
            albumId: 1,
            id: 5,
            title: "City Skyline",
            url: "https://i.pinimg.com/736x/3d/4f/5a/3d4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/3d/4f/5a/3d4f5a6b7c8d9e0f1a2b3c4d5e6f7a8b.jpg",
          ),
          Photo(
            albumId: 1,
            id: 6,
            title: "Flower Garden",
            url: "https://i.pinimg.com/736x/9b/0d/1e/9b0d1e2f3a4b5c6d7e8f9a0b1c2d3e4f.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/9b/0d/1e/9b0d1e2f3a4b5c6d7e8f9a0b1c2d3e4f.jpg",
          ),
          Photo(
            albumId: 2,
            id: 7,
            title: "Desert Dunes",
            url: "https://i.pinimg.com/736x/5a/6c/7d/5a6c7d8e9f0a1b2c3d4e5f6a7b8c9d0e.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/5a/6c/7d/5a6c7d8e9f0a1b2c3d4e5f6a7b8c9d0e.jpg",
          ),
          Photo(
            albumId: 2,
            id: 8,
            title: "Snowy Mountains",
            url: "https://i.pinimg.com/736x/1e/2a/3b/1e2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/1e/2a/3b/1e2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c.jpg",
          ),
          Photo(
            albumId: 2,
            id: 9,
            title: "Tropical Beach",
            url: "https://i.pinimg.com/736x/8f/9f/0a/8f9f0a1b2c3d4e5f6a7b8c9d0e1f2a3b.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/8f/9f/0a/8f9f0a1b2c3d4e5f6a7b8c9d0e1f2a3b.jpg",
          ),
          Photo(
            albumId: 2,
            id: 10,
            title: "Autumn Leaves",
            url: "https://i.pinimg.com/736x/4c/5e/6f/4c5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/4c/5e/6f/4c5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a.jpg",
          ),
          Photo(
            albumId: 3,
            id: 11,
            title: "Waterfall Paradise",
            url: "https://i.pinimg.com/736x/0a/1c/2d/0a1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/0a/1c/2d/0a1c2d3e4f5a6b7c8d9e0f1a2b3c4d5e.jpg",
          ),
          Photo(
            albumId: 3,
            id: 12,
            title: "Cherry Blossoms",
            url: "https://i.pinimg.com/736x/6e/7a/8b/6e7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/6e/7a/8b/6e7a8b9c0d1e2f3a4b5c6d7e8f9a0b1c.jpg",
          ),
          Photo(
            albumId: 3,
            id: 13,
            title: "Northern Lights",
            url: "https://i.pinimg.com/736x/2b/3d/4e/2b3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/2b/3d/4e/2b3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f.jpg",
          ),
          Photo(
            albumId: 3,
            id: 14,
            title: "Lavender Fields",
            url: "https://i.pinimg.com/736x/89/9b/0c/899b0c1d2e3f4a5b6c7d8e9f0a1b2c3d.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/89/9b/0c/899b0c1d2e3f4a5b6c7d8e9f0a1b2c3d.jpg",
          ),
          Photo(
            albumId: 4,
            id: 15,
            title: "Starry Night Sky",
            url: "https://i.pinimg.com/736x/4d/5f/6a/4d5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/4d/5f/6a/4d5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b.jpg",
          ),
          Photo(
            albumId: 4,
            id: 16,
            title: "Rainbow After Rain",
            url: "https://i.pinimg.com/736x/0c/1e/2f/0c1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/0c/1e/2f/0c1e2f3a4b5c6d7e8f9a0b1c2d3e4f5a.jpg",
          ),
          Photo(
            albumId: 4,
            id: 17,
            title: "Cozy Cabin",
            url: "https://i.pinimg.com/736x/6a/7c/8d/6a7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/6a/7c/8d/6a7c8d9e0f1a2b3c4d5e6f7a8b9c0d1e.jpg",
          ),
          Photo(
            albumId: 4,
            id: 18,
            title: "Butterfly Garden",
            url: "https://i.pinimg.com/736x/2e/3a/4b/2e3a4b5c6d7e8f9a0b1c2d3e4f5a6b7c.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/2e/3a/4b/2e3a4b5c6d7e8f9a0b1c2d3e4f5a6b7c.jpg",
          ),
          Photo(
            albumId: 5,
            id: 19,
            title: "Peaceful Lake",
            url: "https://i.pinimg.com/736x/8c/9e/0f/8c9e0f1a2b3c4d5e6f7a8b9c0d1e2f3a.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/8c/9e/0f/8c9e0f1a2b3c4d5e6f7a8b9c0d1e2f3a.jpg",
          ),
          Photo(
            albumId: 5,
            id: 20,
            title: "Golden Hour",
            url: "https://i.pinimg.com/736x/4a/5c/6d/4a5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e.jpg",
            thumbnailUrl: "https://i.pinimg.com/236x/4a/5c/6d/4a5c6d7e8f9a0b1c2d3e4f5a6b7c8d9e.jpg",
          ),
        ];
        isLoading.value = false;
      });
    } catch (e) {
      errorMessage.value = 'Error loading photos: $e';
      isLoading.value = false;
    }
  }

  void refreshPhotos() {
    loadPinterestPhotos();
  }
}

// --- BAGIAN 3: TAMPILAN (UI) ---
class PhotoListScreen extends StatelessWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PhotoController controller = Get.put(PhotoController());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Photo Gallery - GetX',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => controller.refreshPhotos(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
                SizedBox(height: 16),
                Text(
                  'Loading photos...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }

        if (controller.errorMessage.value.isNotEmpty) {
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
                  controller.errorMessage.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.refreshPhotos(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        }

        if (controller.photos.isEmpty) {
          return const Center(
            child: Text(
              'No photos available',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemCount: controller.photos.length,
          itemBuilder: (context, index) {
            final photo = controller.photos[index];
            return GestureDetector(
              onTap: () => Get.to(() => PhotoDetailScreen(photo: photo)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.network(
                            photo.thumbnailUrl,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            photo.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ID: ${photo.id}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

// --- BAGIAN 4: DETAIL SCREEN ---
class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Photo Detail',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  photo.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 300,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 300,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.grey,
                          size: 60,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Photo Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('ID', photo.id.toString()),
                  _buildInfoRow('Album ID', photo.albumId.toString()),
                  _buildInfoRow('Title', photo.title),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- BAGIAN 5: CLASS UTAMA ---
class Bab9 extends StatelessWidget {
  const Bab9({super.key});

  @override
  Widget build(BuildContext context) {
    return const PhotoListScreen();
  }
}