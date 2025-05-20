import 'package:flutter/material.dart';

class JuegosScreen extends StatelessWidget {
  const JuegosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.videogame_asset, size: 80, color: Colors.cyanAccent),
                const SizedBox(height: 20),
                const Text(
                  'Sección de Juegos',
                  style: TextStyle(
                    fontFamily: 'Gamer',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Aquí se mostrará contenido informativo sobre los juegos disponibles, estilos, géneros y más.',
                  style: TextStyle(
                    fontFamily: 'Gamer',
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildGameCard(
                  imageUrl: 'https://cdn-icons-png.flaticon.com/512/8832/8832119.png',
                  title: 'Aventura Épica',
                  description: 'Explora mundos mágicos y enfrenta desafíos únicos en este juego de aventura retro.',
                ),
                const SizedBox(height: 20),
                _buildGameCard(
                  imageUrl: 'https://cdn-icons-png.flaticon.com/512/3500/3500833.png',
                  title: 'Batalla Espacial',
                  description: 'Enfréntate en el espacio con gráficos pixel y una banda sonora al estilo arcade.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameCard({
    required String imageUrl,
    required String title,
    required String description,
  }) {
    return Card(
      color: const Color(0xFF1A1C2C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Gamer',
                fontSize: 16,
                color: Colors.cyanAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                fontFamily: 'Gamer',
                fontSize: 13,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
