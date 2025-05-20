import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController userController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    const inputDecoration = InputDecoration(
      labelStyle: TextStyle(color: Colors.white),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Imagen local
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'lib/assets/images/asusrog.jpg',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'GamingRoutesApp',
              style: TextStyle(
                fontFamily: 'Gamer',
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextField(
              controller: userController,
              decoration: inputDecoration.copyWith(labelText: 'Usuario'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: inputDecoration.copyWith(labelText: 'Contraseña'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Ingresar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('¿No tienes cuenta? Regístrate'),
            ),
          ],
        ),
      ),
    );
  }
}
