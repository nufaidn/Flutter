// bab_4.dart
import 'package:flutter/material.dart';

class Bab3 extends StatelessWidget {
  const Bab3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Bab 3'),
      ),
      body: Center(  // cukup menggunakan center setelah const jika widget tidak lebih dari satu

      // ⁡⁣⁣⁢​‌‍‌𝗪𝗶𝗱𝗴𝗲𝘁 𝗣𝗼𝗽𝘂𝗹𝗲𝗿​⁡

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center, // posisikan di tengah, hanya ketika widget lebih dari satu
        //   children: [
        //    // ⁡⁢⁣⁣​‌‍‌𝗜𝗰𝗼𝗻​⁡
        //     Icon( 
        //       Icons.star, // Ikon bintang 
        //       color: Color.fromARGB(255, 0, 208, 240), // Warna ikon 
        //       size: 30, // Ukuran ikon 
        //         ) ,

        //     SizedBox(height: 20),

        //         ⁡⁢⁣⁣‍// 𝗜𝗺𝗮𝗴𝗲 𝗮𝘀𝘀𝗲𝘁⁡
        //     Image.asset('assets/images/flutter_logo.jpg',  width: 200, height: 200, ),

        //     SizedBox(height: 50),

        //     // ⁡⁢⁣⁣𝗧𝗲𝘅𝘁⁡
        //     Text( 
        //       'Halo Dunia Flutter!', 
        //         style: TextStyle( 
        //         fontSize: 24, 
        //         color: Colors.blue, 
        //         fontWeight: FontWeight.bold, 
        //       ), 
        //     ),

        //      SizedBox(height: 20),

        //     //  ⁡⁢⁣⁣𝗜𝗺𝗮𝗴𝗲 𝗻𝗲𝘁𝘄𝗼𝗿𝗸⁡
        //   Image.network('https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png', width: 100, height: 100),

        //   SizedBox(height: 20),

        //   //​‌‍‌⁡⁢⁣⁣ 𝗕𝘂𝘁𝘁𝗼𝗻 𝗘𝗹𝗲𝘃𝗮𝘁𝗲𝗱𝗕𝘂𝘁𝘁𝗼𝗻⁡​
        //     ElevatedButton(
        //       onPressed: () {
        //         print('Elevated Button Ditekan !');
        //       }, 
        //       child: Text('Tekan Saya !')
        //       ),

        //       SizedBox(height: 20,),

        //   //​‌‍‌ ⁡⁢⁣⁣𝗧𝗲𝘅𝘁𝗕𝘂𝘁𝘁𝗼𝗻⁡​
        //   TextButton( 
        //     onPressed: () { 
        //     print('Text Button Ditekan!'); 
        //       }, 
        //     child: const Text('Learn More'), 
        //     ), 

        //     SizedBox(height: 20,),

        //     // ⁡⁢⁣⁣​‌‍‌𝗢𝘂𝘁𝗹𝗶𝗻𝗲𝗕𝘂𝘁𝘁𝗼𝗻​⁡
        //     OutlinedButton( 
        //     onPressed: () { 
        //     print('Outlined Button Ditekan!'); 
        //     }, 
        //     child: const Text('Register'), 
        //     )

        //   ]
        // ),


        // ⁡⁣⁣⁢​‌‍‌𝗟𝗮𝘆𝗼𝘂𝘁 𝗪𝗶𝗱𝗴𝗲𝘁​⁡

    // ⁡⁢⁣⁣​‌‍‌‍‍𝗖𝗼𝗹𝘂𝗺𝗻​⁡

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center, //  Penataan secara Vertikal

      //   crossAxisAlignment: CrossAxisAlignment.center, //  Penataan secara Horizontal
       
      //  children: [
      //   Text('Baris 1'),
      //   Text('Baris 2'),
      //   Text('Baris 3'),
      //  ],
      //   ),

    
    // ⁡⁢⁣⁣​‌‍‌𝗥𝗼𝘄​⁡

      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround, // Penataan secara Horizontal

      //   crossAxisAlignment: CrossAxisAlignment.center, // Penataan secara Vertikal (aligment)

      //   children: [
      //     Icon(Icons.home),
      //     Icon(Icons.settings),
      //     Icon(Icons.person),

      //     Text('ini adalah icon di flutter'),

      //   ],
      // ),


      // ⁡⁢⁣⁣​‌‍‌𝗖𝗼𝗻𝘁𝗮𝗶𝗻𝗲𝗿​⁡

      // child: Container(
      //   padding: EdgeInsets.all(20), // Padding di semua sisi
      //   margin: EdgeInsets.symmetric(vertical: 10), // Margin Vertikal

      //   decoration: BoxDecoration( // Dekorasi container
      //     color: Colors.lightBlueAccent,
      //     borderRadius: BorderRadius.circular(10),  // Sudut membulat
      //     ),

      //     child: Text(
      //       'ini didalam container', 
      //       style: TextStyle(color: Colors.white),
      //       ),
      //      ),

      // ⁡⁢⁣⁣​‌‍‌𝗖𝗲𝗻𝘁𝗲𝗿​⁡

      child: Center(
        child: Image.asset('assets/images/flutter_logo.jpg'),
      ),

      ),
    );
  }
}
