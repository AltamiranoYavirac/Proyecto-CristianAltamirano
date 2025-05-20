import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/perfil_screen.dart';
import 'screens/juegos_screen.dart';
import 'screens/ranking_screen.dart';
import 'screens/tienda_screen.dart';
import 'screens/eventos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GamingRoutesApp',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0E21), // Fondo azul oscuro
        fontFamily: 'Gamer',
        primaryColor: const Color.fromARGB(255, 117, 43, 163), // Morado eléctrico
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF00E5FF), // Cyan brillante
          secondary: const Color(0xFFFF4081), // Rosa neón
          background: const Color(0xFF0A0E21),
          surface: const Color(0xFF1A1C2C), // Cards
          error: const Color(0xFFFF1744),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6A1B9A), // AppBar morado
          foregroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Color(0xFF00E5FF),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 14, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 12, color: Colors.white),
          labelLarge: TextStyle(fontSize: 12, color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xFF00E5FF)), 
            foregroundColor: MaterialStatePropertyAll(Colors.black),
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: 12, fontFamily: 'Gamer'),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/perfil': (context) => const PerfilScreen(),
        '/juegos': (context) => const JuegosScreen(),
        '/ranking': (context) => const RankingScreen(),
        '/tienda': (context) => const TiendaScreen(),
        '/eventos': (context) => const EventosScreen(),
      },
    );
  }
}
