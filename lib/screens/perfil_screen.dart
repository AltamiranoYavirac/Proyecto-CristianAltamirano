import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Usuario'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'lib/assets/images/alyarusa.jpg',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'GamingRoutesApp',
              style: TextStyle(
                fontFamily: 'Gamer',
                fontSize: 18,
                color: Colors.cyanAccent,
              ),
            ),
            const SizedBox(height: 30),
            _buildInfoTile(title: 'Nombre', value: 'Juan Pérez'),
            _buildInfoTile(title: 'Correo', value: 'juanperez@email.com'),
            _buildInfoTile(title: 'Ciudad', value: 'Quito'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({required String title, required String value}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF00FF90), width: 1.5),
      ),
      child: Text(
        '$title: $value',
        style: const TextStyle(
          fontFamily: 'Gamer',
          fontSize: 14,
          color: Colors.white,
          height: 1.6,
        ),
      ),
    );
  }
}
