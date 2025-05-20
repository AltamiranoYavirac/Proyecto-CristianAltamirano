import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();

  @override
  void dispose() {
    _usuarioController.dispose();
    _correoController.dispose();
    _passwordController.dispose();
    _telefonoController.dispose();
    _ciudadController.dispose();
    _cedulaController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulario válido. Procesando registro...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
      labelStyle: TextStyle(color: Colors.white),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usuarioController,
                decoration: inputDecoration.copyWith(labelText: 'Usuario'),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El usuario es requerido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _correoController,
                decoration: inputDecoration.copyWith(labelText: 'Correo'),
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es requerido';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Correo inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: inputDecoration.copyWith(labelText: 'Contraseña'),
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'La contraseña debe tener al menos 6 caracteres';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: inputDecoration.copyWith(labelText: 'Teléfono'),
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.length < 7) {
                    return 'Teléfono inválido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ciudadController,
                decoration: inputDecoration.copyWith(labelText: 'Ciudad'),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La ciudad es requerida';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cedulaController,
                decoration: inputDecoration.copyWith(labelText: 'Cédula'),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'La cédula debe tener 10 dígitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
