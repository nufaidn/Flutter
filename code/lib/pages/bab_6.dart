// lib/bab_6.dart
import 'package:flutter/material.dart';

class Bab6 extends StatelessWidget {
  Bab6({super.key});

  // Data foto dengan URL dan judul (sudah diperbaiki Gurun Pasir)
  final List<Map<String, String>> photos = [
    {
      'title': 'Pegunungan',
      'url': 'https://images.unsplash.com/photo-1501785888041-af3ef285b470?w=800'
    },
    {
      'title': 'Kota Malam',
      'url': 'https://images.unsplash.com/photo-1505761671935-60b3a7427bad?w=800'
    },
    {
      'title': 'Hutan Kabut',
      'url': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800'
    },
    {
      'title': 'Pantai Tropis',
      'url': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800'
    },
    {
      'title': 'Air Terjun Indah',
      'url': 'https://images.unsplash.com/photo-1508672019048-805c876b67e2?w=800'
    },
    {
      'title': 'Padang Bunga',
      'url': 'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?w=800'
    },
    {
      'title': 'Danau Tenang',
      'url': 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?w=800'
    },
    {
      'title': 'Gurun Pasir',
      'url': 'https://images.unsplash.com/photo-1501785888041-78fa6f0f4d5b?w=800'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Foto'),
        backgroundColor: Colors.teal,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: photos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom per baris
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final photo = photos[index];
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoDetailScreen(
                      title: photo['title']!,
                      url: photo['url']!,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.network(
                          photo['url']!,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.broken_image,
                                  size: 40, color: Colors.red),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        photo['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Halaman detail foto
class PhotoDetailScreen extends StatelessWidget {
  final String title;
  final String url;

  const PhotoDetailScreen({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image,
                        size: 60, color: Colors.red);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Kembali"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
