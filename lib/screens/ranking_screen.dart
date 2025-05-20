import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.leaderboard, size: 80, color: Colors.cyanAccent),
            const SizedBox(height: 20),
            const Text(
              'Tabla de Clasificación Gamer',
              style: TextStyle(
                fontFamily: 'Gamer',
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Conoce a los mejores jugadores y cómo se posicionan según sus logros, experiencia y puntuación.',
              style: TextStyle(
                fontFamily: 'Gamer',
                fontSize: 14,
                color: Colors.white,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildRankingCard(
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              name: 'ShadowX',
              score: '9820 Puntos',
              level: 'Nivel 25',
            ),
            const SizedBox(height: 20),
            _buildRankingCard(
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/3135/3135768.png',
              name: 'NovaBlast',
              score: '9340 Puntos',
              level: 'Nivel 23',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankingCard({
    required String imageUrl,
    required String name,
    required String score,
    required String level,
  }) {
    return Card(
      color: const Color(0xFF1A1C2C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: 'Gamer',
                      fontSize: 16,
                      color: Colors.cyanAccent,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    score,
                    style: const TextStyle(
                      fontFamily: 'Gamer',
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    level,
                    style: const TextStyle(
                      fontFamily: 'Gamer',
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
