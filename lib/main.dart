import 'package:flutter/material.dart';
import 'package:ejercicio/login_page.dart'; // 👈 ajusta según tu paquete
import 'package:ejercicio/screens/home_page.dart'; // 👈 tu pantalla principal

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App con Login',
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Inicia en el login
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
