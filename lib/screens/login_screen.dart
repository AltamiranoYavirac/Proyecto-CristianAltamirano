import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  static const inputDecoration = InputDecoration(
    labelStyle: TextStyle(
      color: Colors.cyanAccent,
      fontFamily: 'Gamer',
      fontSize: 14,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.cyanAccent),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  String? _validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
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
                  TextFormField(
                    controller: userController,
                    decoration: inputDecoration.copyWith(labelText: 'Usuario'),
                    style: const TextStyle(color: Colors.white),
                    validator: _validateNotEmpty,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passController,
                    obscureText: true,
                    decoration: inputDecoration.copyWith(labelText: 'Contraseña'),
                    style: const TextStyle(color: Colors.white),
                    validator: _validateNotEmpty,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      }
                    },
                    child: const Text('Ingresar'),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text('¿No tienes cuenta? Regístrate'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
