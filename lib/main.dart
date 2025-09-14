import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:way_data_technical_challenge/bindings/app_binding.dart';
import 'package:way_data_technical_challenge/presentation/pages/character_details_page.dart';
import 'package:way_data_technical_challenge/presentation/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

// Optei por utilizar o inglês para a linguagem da aplicação por conta da diversidade de localidades e espécies retornadas pela api, e todas elas vem com nome em inglês.
// Portanto, pra manter a aplicação coerente, decidi optar pelo inglês.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      initialBinding: AppBinding(),
      home: const LandingPage(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const LandingPage(),
        ),
        GetPage(
          name: '/character_details_page',
          page: () => const CharacterDetailsPage(),
        ),
      ],
    );
  }
}