import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GamingRoutesApp'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.description), text: 'Descripción'),
              Tab(icon: Icon(Icons.settings), text: 'Opciones'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeTab(),
            DescripcionTab(),
            OpcionesTab(),
          ],
        ),
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.videogame_asset, 'title': 'Juegos', 'color': Colors.blueAccent, 'route': '/juegos'},
      {'icon': Icons.leaderboard, 'title': 'Ranking', 'color': Colors.purpleAccent, 'route': '/ranking'},
      {'icon': Icons.storefront, 'title': 'Tienda', 'color': Colors.greenAccent, 'route': '/tienda'},
      {'icon': Icons.event, 'title': 'Eventos', 'color': Colors.deepOrangeAccent, 'route': '/eventos'},
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardHeight = (constraints.maxHeight - 60) / 2;
        final double cardWidth = (constraints.maxWidth - 32) / 2;

        return Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Bienvenido a GamingRoutesApp',
              style: TextStyle(
                fontFamily: 'Gamer',
                fontSize: 18,
                color: Colors.cyanAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: items
                      .map((item) => SizedBox(
                            width: cardWidth,
                            height: cardHeight,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.pushNamed(context, item['route'] as String);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A1C2C),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: const Color(0xFF00FF90), width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: (item['color'] as Color).withOpacity(0.3),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(item['icon'] as IconData, size: 80, color: item['color'] as Color),
                                        const SizedBox(height: 12),
                                        Text(
                                          item['title'] as String,
                                          style: const TextStyle(
                                            fontFamily: 'Gamer',
                                            fontSize: 14,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DescripcionTab extends StatelessWidget {
  const DescripcionTab({super.key});

  Widget buildBox(String title, String content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF00FF90), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Gamer',
              fontSize: 14,
              color: Colors.cyanAccent,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'Gamer',
              fontSize: 14,
              color: Colors.white,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
            buildBox('Nombre del Proyecto', 'GamingRoutesApp'),
          buildBox(
            'Objetivo General',
            'Brindar a los usuarios una experiencia retro interactiva que centralice juegos, ranking, tienda y eventos.',
          ),
          buildBox(
            'Objetivos Específicos',
            '• Permitir a los usuarios explorar juegos.\n'
            '• Mostrar rankings de jugadores.\n'
            '• Gestionar eventos de comunidad.\n'
            '• Ofrecer una tienda con contenido exclusivo.',
          ),
          buildBox(
            'Alcance',
            'Este proyecto se enfoca en la experiencia visual retro, la organización de contenidos gamer y navegación sencilla por secciones temáticas.',
          ),
        ],
      ),
    );
  }
}

class OpcionesTab extends StatelessWidget {
  const OpcionesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'lib/assets/images/asusrog.jpg',
              height: 160,
              width: 160,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'GamingRoutesApp',
            style: TextStyle(
              fontFamily: 'Gamer',
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _buildOptionButton(
                  icon: Icons.login,
                  label: 'Iniciar sesión',
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                ),
                _buildOptionButton(
                  icon: Icons.logout,
                  label: 'Cerrar sesión',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false),
                ),
                _buildOptionButton(
                  icon: Icons.person,
                  label: 'Ver perfil',
                  onPressed: () => Navigator.pushNamed(context, '/perfil'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 180,
      height: 50,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 20),
        label: Text(
          label,
          style: const TextStyle(fontSize: 14, fontFamily: 'Gamer'),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00E5FF),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
