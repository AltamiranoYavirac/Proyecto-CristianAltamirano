import 'package:flutter/material.dart';

class TiendaScreen extends StatelessWidget {
  const TiendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda Gamer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.storefront, size: 80, color: Colors.cyanAccent),
            const SizedBox(height: 20),
            const Text(
              'Explora Productos Exclusivos',
              style: TextStyle(
                fontFamily: 'Gamer',
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Encuentra artículos retro, accesorios gamer, ropa temática y más en esta tienda pensada para la comunidad.',
              style: TextStyle(
                fontFamily: 'Gamer',
                fontSize: 14,
                color: Colors.white,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildProductCard(
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/3334/3334336.png',
              title: 'Camisa Retro Gamer',
              description: 'Estilo pixel con estampados de consola clásica. Tallas desde S hasta XL.',
            ),
            const SizedBox(height: 20),
            _buildProductCard(
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/4274/4274843.png',
              title: 'Mouse Neon RGB',
              description: 'Precisión para gaming con luces LED y diseño ergonómico.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
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
