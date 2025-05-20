import 'package:flutter/material.dart';

class EventosScreen extends StatelessWidget {
  const EventosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos Gamer'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.event, size: 80, color: Colors.cyanAccent),
                const SizedBox(height: 20),
                const Text(
                  'Próximos Torneos y Reuniones',
                  style: TextStyle(
                    fontFamily: 'Gamer',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Infórmate sobre las fechas, lugares y temáticas de los próximos eventos gamer en tu comunidad.',
                  style: TextStyle(
                    fontFamily: 'Gamer',
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                _buildEventCard(
                  imageUrl: 'https://cdn-icons-png.flaticon.com/512/2885/2885333.png',
                  title: 'Torneo Retro Clash',
                  description: 'Sábado 10 de agosto - Batallas 1v1 con juegos de los 80s. ¡Premios y diversión garantizada!',
                ),
                const SizedBox(height: 20),
                _buildEventCard(
                  imageUrl: 'https://cdn-icons-png.flaticon.com/512/3845/3845829.png',
                  title: 'Convención Gamer Andina',
                  description: 'Domingo 24 de agosto - Reunión de comunidades con cosplay, demos y torneos abiertos.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard({
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
