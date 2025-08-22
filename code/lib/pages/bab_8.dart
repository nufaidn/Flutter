// lib/main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: Bab8(), // Diubah dari SettingsScreen
  ));
}

// Nama class diubah menjadi Bab8
class Bab8 extends StatefulWidget {
  // Constructor juga diubah menjadi Bab8
  const Bab8({super.key});

  @override
  State<Bab8> createState() => _Bab8State(); // Mengarah ke State yang baru
}

// Nama class State juga disesuaikan
class _Bab8State extends State<Bab8> {
  bool _isDarkMode = false;
  String _userName = 'Guest';
  int _fontSize = 16;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  // Fungsi untuk memuat pengaturan dari SharedPreferences
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _userName = prefs.getString('userName') ?? 'Guest';
      _fontSize = prefs.getInt('fontSize') ?? 16;
    });
  }

  // Fungsi untuk menyimpan pengaturan tema gelap
  Future<void> _toggleDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = value;
    });
    await prefs.setBool('isDarkMode', value);
  }

  // Fungsi untuk menyimpan nama pengguna
  Future<void> _saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = name;
    });
    await prefs.setString('userName', name);
  }

  // Fungsi untuk menyimpan ukuran font
  Future<void> _saveFontSize(int size) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = size;
    });
    await prefs.setInt('fontSize', size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Aplikasi (Bab 8)'),
        backgroundColor: _isDarkMode ? Colors.black87 : Colors.blueAccent,
      ),
      body: Container(
        color: _isDarkMode ? Colors.grey[800] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, $_userName!',
                style: TextStyle(
                  fontSize: _fontSize.toDouble(),
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                title: Text(
                  'Mode Gelap',
                  style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
                ),
                value: _isDarkMode,
                onChanged: _toggleDarkMode,
              ),
              ListTile(
                title: Text(
                  'Nama Pengguna',
                  style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
                ),
                subtitle: Text(
                  _userName,
                  style: TextStyle(color: _isDarkMode ? Colors.white70 : Colors.black54),
                ),
                onTap: () async {
                  String? newName = await _showNameInputDialog(context);
                  if (newName != null && newName.isNotEmpty) {
                    _saveUserName(newName);
                  }
                },
              ),
              ListTile(
                title: Text(
                  'Ukuran Font',
                  style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
                ),
                subtitle: Text(
                  '$_fontSize pt',
                  style: TextStyle(color: _isDarkMode ? Colors.white70 : Colors.black54),
                ),
                onTap: () async {
                  int? newSize = await _showFontSizeDialog(context, _fontSize);
                  if (newSize != null) {
                    _saveFontSize(newSize);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function untuk input dialog nama (tidak perlu diubah)
  Future<String?> _showNameInputDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController(text: _userName);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ubah Nama Pengguna'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'Masukkan nama baru'),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, nameController.text),
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  // Helper function untuk input dialog ukuran font (tidak perlu diubah)
  Future<int?> _showFontSizeDialog(BuildContext context, int currentSize) async {
    return showDialog<int>(
      context: context,
      builder: (context) {
        // Menggunakan StatefulWidget agar pilihan radio bisa diperbarui di dalam dialog
        return StatefulBuilder(
          builder: (context, setState) {
            int? selectedSize = currentSize;
            return AlertDialog(
              title: const Text('Pilih Ukuran Font'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RadioListTile<int>(
                    title: const Text('Kecil (14pt)'),
                    value: 14,
                    groupValue: selectedSize,
                    onChanged: (int? value) => Navigator.pop(context, value),
                  ),
                  RadioListTile<int>(
                    title: const Text('Normal (16pt)'),
                    value: 16,
                    groupValue: selectedSize,
                    onChanged: (int? value) => Navigator.pop(context, value),
                  ),
                  RadioListTile<int>(
                    title: const Text('Besar (18pt)'),
                    value: 18,
                    groupValue: selectedSize,
                    onChanged: (int? value) => Navigator.pop(context, value),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}