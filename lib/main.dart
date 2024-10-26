import 'package:flutter/material.dart';
import 'package:project_id_camp/intro/pages/intro.dart';
import 'package:project_id_camp/models/data_product.dart';
import 'package:provider/provider.dart';

import 'dashboard/detail_items/quantity.dart';

/*
Hellooo, saya abdul rosyid dan saya sudah belajar dart dan flutter sejak kurang lebih 6 bulan ynag lalu,
dengan project ini saya harap bisa mendapatkan sertifikat agar memudahkan saya mendapatkan pekerjaan nantinya.
desain project ini saya ambil dari comunitas figma, 
berikut linknya:
https://www.figma.com/design/cTe9xPHiCaCw0dw0Ik8som/E-commerce-Clothing-App-(Community)?m=auto&t=9OlyGNVj3mqwhz9l-6
untuk aseets gambar saya ambil dari freepik.com
sama menggunakan sedikit state management, alasanya agar bisa menyimpan state boolean favorite dan menyimpan increment decrement jumlah barabg yang di tambahkan ke cart
project ini sudah di rancang untuk website dan mobile dengan menggunakan media query
*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProduct>(
          create: (context) => DataProduct(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuantityNotifier(),
        )
      ],
      child: Consumer<DataProduct>(
        builder: (context, dataProduct, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Intro(),
            theme: ThemeData(fontFamily: "Poppins"),
          );
        },
      ),
    );
  }
}
