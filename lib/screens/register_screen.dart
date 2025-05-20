import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController idController = TextEditingController();

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

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido';
    }
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+\$');
    if (!emailRegex.hasMatch(value)) {
      return 'Correo inválido';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido';
    }
    if (!RegExp(r'^[0-9]{7,10}\$').hasMatch(value)) {
      return 'Teléfono inválido';
    }
    return null;
  }

  String? _validateId(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo requerido';
    }
    if (!RegExp(r'^[0-9]{10}\$').hasMatch(value)) {
      return 'Cédula inválida';
    }
    return null;
  }

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
        title: const Text('Registro'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.cyanAccent.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.cyanAccent, width: 1.5),
              ),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: userController,
                      decoration: inputDecoration.copyWith(labelText: 'Usuario'),
                      style: const TextStyle(color: Colors.white),
                      validator: _validateNotEmpty,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: emailController,
                      decoration: inputDecoration.copyWith(labelText: 'Correo'),
                      style: const TextStyle(color: Colors.white),
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passController,
                      obscureText: true,
                      decoration: inputDecoration.copyWith(labelText: 'Contraseña'),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Campo requerido';
                        if (value.length < 6) return 'Mínimo 6 caracteres';
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: phoneController,
                      decoration: inputDecoration.copyWith(labelText: 'Teléfono'),
                      style: const TextStyle(color: Colors.white),
                      validator: _validatePhone,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: cityController,
                      decoration: inputDecoration.copyWith(labelText: 'Ciudad'),
                      style: const TextStyle(color: Colors.white),
                      validator: _validateNotEmpty,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: idController,
                      decoration: inputDecoration.copyWith(labelText: 'Cédula'),
                      style: const TextStyle(color: Colors.white),
                      validator: _validateId,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        }
                      },
                      child: const Text('Registrarse'),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text('¿Ya tienes cuenta? Inicia sesión'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
