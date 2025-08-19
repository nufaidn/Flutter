// ⁡⁣⁣⁢​‌‍‌𝗠𝗲𝗻𝗮𝗻𝗴𝗮𝗻𝗶 𝗘𝘃𝗲𝗻𝘁​⁡
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Bab4());
// }

// class Bab4 extends StatelessWidget {
//   const Bab4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Contoh Event Handling'),
//           backgroundColor: Colors.teal,
//         ),
//         body: const EventDemo(),
//       ),
//     );
//   }
// }

// class EventDemo extends StatefulWidget {
//   const EventDemo({super.key});

//   @override
//   State<EventDemo> createState() => _EventDemoState();
// }

// class _EventDemoState extends State<EventDemo> {
//   String typedText = '';
//   String gestureMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // 1️⃣ onPressed
//           ElevatedButton(
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('Tombol ditekan!')),
//               );
//             },
//             child: const Text('Tekan Saya'),
//           ),

//           const SizedBox(height: 20),

//           // 2️⃣ onChanged
//           TextField(
//             onChanged: (value) {
//               setState(() {
//                 typedText = value;
//               });
//             },
//             decoration: const InputDecoration(
//               labelText: 'Ketik sesuatu...',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text('Yang kamu ketik: $typedText'),

//           const SizedBox(height: 30),

//           // 3️⃣ GestureDetector
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 gestureMessage = 'Gambar di-tap!';
//               });
//             },
//             onDoubleTap: () {
//               setState(() {
//                 gestureMessage = 'Gambar di-double tap!';
//               });
//             },
//             onLongPress: () {
//               setState(() {
//                 gestureMessage = 'Gambar di-long press!';
//               });
//             },
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 'assets/images/profile.jpg',
//                 width: 150,
//                 height: 150,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Text(gestureMessage),
//         ],
//       ),
//     );
//   }
// }

// // // ⁡⁢⁣⁣𝗚𝗘𝗦𝗧𝗨𝗥𝗘 𝗗𝗘𝗧𝗘𝗖𝗧𝗢𝗥⁡

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Bab4());
// }

// class Bab4 extends StatelessWidget {
//   const Bab4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Contoh Child & GestureDetector'),
//           backgroundColor: Colors.teal,
//         ),
//         body: const Center(
//           child: ImageSwitcher(),
//         ),
//       ),
//     );
//   }
// }

// class ImageSwitcher extends StatefulWidget {
//   const ImageSwitcher({super.key});

//   @override
//   State<ImageSwitcher> createState() => _ImageSwitcherState();
// }

// class _ImageSwitcherState extends State<ImageSwitcher> {
//   bool isFirstImage = true;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isFirstImage = !isFirstImage; // ganti gambar
//         });
//       },
//       child: Image.asset(
//         isFirstImage
//             ? 'assets/images/flutter_logo.jpg'
//             : 'assets/images/profile.jpg',
//         width: 200,
//         height: 200,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

// // ⁡⁣⁣⁢​‌‍‌𝗜𝗡𝗣𝗨𝗧 𝗗𝗔𝗥𝗜 𝗣𝗘𝗡𝗚𝗚𝗨𝗡𝗔​⁡

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Bab4());
// }

// class Bab4 extends StatelessWidget {
//   const Bab4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Kotak Saran'),
//           backgroundColor: Colors.teal,
//         ),
//         body: const SuggestionBox(),
//       ),
//     );
//   }
// }

// class SuggestionBox extends StatefulWidget {
//   const SuggestionBox({super.key});

//   @override
//   State<SuggestionBox> createState() => _SuggestionBoxState();
// }

// class _SuggestionBoxState extends State<SuggestionBox> {
//   String userInput = '';

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           // Kotak input saran
//           TextField(
//             decoration: const InputDecoration(
//               labelText: 'Tulis saran Anda di sini...',
//               border: OutlineInputBorder(),
//             ),
//             onChanged: (value) {
//               setState(() {
//                 userInput = value; // simpan teks yang diketik
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//           // Menampilkan teks yang sedang diketik
//           Text(
//             'Saran Anda: $userInput',
//             style: const TextStyle(fontSize: 18),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ⁡⁣⁣⁢​‌‍‌𝗠𝗲𝗻𝗴𝗲𝗹𝗼𝗹𝗮 𝗦𝘁𝗮𝘁𝗲 𝗟𝗼𝗸𝗮𝗹​⁡

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const Bab4());
// }

// class Bab4 extends StatefulWidget {
//   const Bab4({super.key});

//   @override
//   State<Bab4> createState() => _CounterAppState();
// }

// class _CounterAppState extends State<Bab4> {
//   int _counter = 0; // State lokal

//   void _incrementCounter() {
//     setState(() {
//       _counter++; // Mengubah state
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Contoh setState()'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Counter: $_counter', // UI diperbarui saat _counter berubah
//                 style: const TextStyle(fontSize: 24),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _incrementCounter,
//                 child: const Text('Tambah'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// ⁡⁣⁣⁢​‌‍‌𝗞𝗲𝘀𝗶𝗺𝗽𝘂𝗹𝗮𝗻 ​⁡

import 'package:flutter/material.dart';

class Bab4 extends StatelessWidget {
  const Bab4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bab 4 - Interaksi & State")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "1. TextField + ElevatedButton",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFieldExample(),
            Divider(),

            Text(
              "2. GestureDetector",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GestureExample(),
            Divider(),

            Text(
              "3. Switch, Checkbox, Radio",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SwitchCheckboxRadioExample(),
            Divider(),

            Text(
              "4. ListView + ListTile",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(height: 200, child: ListViewExample()),
            Divider(),

            Text(
              "5. Counter (setState)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CounterExample(),
          ],
        ),
      ),
    );
  }
}

/// 1. TextField + ElevatedButton
class TextFieldExample extends StatefulWidget {
  const TextFieldExample({super.key});

  @override
  State<TextFieldExample> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  final TextEditingController _controller = TextEditingController();
  String _output = "Belum ada output";

  void _showOutput() {
    setState(() {
      _output = "Halo, ${_controller.text}!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: "Masukkan Nama",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: _showOutput, child: const Text("Tampilkan")),
        const SizedBox(height: 10),
        Text(_output, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}

/// 2. GestureDetector
class GestureExample extends StatefulWidget {
  const GestureExample({super.key});

  @override
  State<GestureExample> createState() => GestureExampleState();
}

class GestureExampleState extends State<GestureExample> {
  String _gestureStatus = "Belum ada interaksi";

  void _updateStatus(String newStatus) {
    setState(() {
      _gestureStatus = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _updateStatus("Single Tap"),
          onDoubleTap: () => _updateStatus("Double Tap"),
          onLongPress: () => _updateStatus("Long Press"),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              "Coba Sentuh",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          _gestureStatus,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

/// 3. Switch, Checkbox, Radio
class SwitchCheckboxRadioExample extends StatefulWidget {
  const SwitchCheckboxRadioExample({super.key});

  @override
  State<SwitchCheckboxRadioExample> createState() =>
      _SwitchCheckboxRadioExampleState();
}

class _SwitchCheckboxRadioExampleState
    extends State<SwitchCheckboxRadioExample> {
  bool _isOn = false;
  String _gender = "Laki-laki";

  // List untuk menyimpan status beberapa checkbox
  List<bool> _isCheckedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text("Switch"),
          value: _isOn,
          onChanged: (val) => setState(() => _isOn = val),
        ),

        // Checkbox 1
        CheckboxListTile(
          title: const Text("Checkbox 1"),
          value: _isCheckedList[0],
          onChanged: (val) => setState(() => _isCheckedList[0] = val!),
        ),

        // Checkbox 2
        CheckboxListTile(
          title: const Text("Checkbox 2"),
          value: _isCheckedList[1],
          onChanged: (val) => setState(() => _isCheckedList[1] = val!),
        ),

        // Checkbox 3
        CheckboxListTile(
          title: const Text("Checkbox 3"),
          value: _isCheckedList[2],
          onChanged: (val) => setState(() => _isCheckedList[2] = val!),
        ),

        RadioListTile(
          title: const Text("Laki-laki"),
          value: "Laki-laki",
          groupValue: _gender,
          onChanged: (val) => setState(() => _gender = val!),
        ),
        RadioListTile(
          title: const Text("Perempuan"),
          value: "Perempuan",
          groupValue: _gender,
          onChanged: (val) => setState(() => _gender = val!),
        ),
        Text("Gender: $_gender"),

        // Debug tampilin hasil checkbox
        Text(
          "Checkbox Yang Dipilih: " +
              List.generate(_isCheckedList.length, (i) {
                if (_isCheckedList[i]) {
                  return "Checkbox ${i + 1}";
                }
                return "";
              }).where((e) => e.isNotEmpty).join(", "),
        ),
      ],
    );
  }
}

/// 4. ListView + ListTile
class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10, (i) => "Item ${i + 1}");

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Kamu pilih: ${items[index]}")),
            );
          },
        );
      },
    );
  }
}

/// 5. Counter
class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int _counter = 0;

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Counter: $_counter", style: const TextStyle(fontSize: 24)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _decrement, child: const Text("-")),
            const SizedBox(width: 20),
            ElevatedButton(onPressed: _increment, child: const Text("+")),
          ],
        ),
      ],
    );
  }
}
