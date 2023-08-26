import 'package:ford/pages/cadastro_page.dart';
import 'package:ford/pages/home_page.dart';
import 'package:ford/pages/login_page.dart';
import 'package:ford/pages/veiculos_detalhes_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ford',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/veiculos-detalhes": (context) => const VeiculoDetalhesPage(),
        "/login": (context) => const LoginPage(),
        "/cadastro": (context) => CadastroPage(),
      },
      initialRoute: "/",
    );
  }
}
