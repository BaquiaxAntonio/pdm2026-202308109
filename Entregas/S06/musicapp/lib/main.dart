import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F9FF),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List canciones = const [
    'La canción',
    'Otra canción',
    'Una canción más',
    'Mi canción favorita',
    'Canción de verano',
    'Canción nocturna',
    'Última canción',
  ];

  final List artistas = const [
    'Ricardo Arjona',
    'Bad Bunny',
    'Melendi',
    'Malacates Trébol Shop',
    'Aitana',
    'Tambor de la Tribu',
    'Ricardo Andrade',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // REPRODUCTOR PRINCIPAL
          Container(
            height: 205,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1976D2),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: Column(
              children: [

                Row(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          'La canción',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 5),

                        Text(
                          'Bad Bunny',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 6,
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons.music_note,
                        size: 35,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.pause,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // CARRUSEL HORIZONTAL
          Container(
            height: 120,
            margin: const EdgeInsets.symmetric(
              vertical: 5,
            ),

            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),

              children: [

                Container(
                  width: 180,
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Center(
                    child: Text(
                      'Super Estrella',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 180,
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E88E5),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Center(
                    child: Text(
                      'Pop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Container(
                  width: 180,
                  margin: const EdgeInsets.only(
                    right: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF42A5F5),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: const Center(
                    child: Text(
                      'Rock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

          // TITULO
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            child: Align(
              alignment: Alignment.centerLeft,

              child: Text(
                'Recomendaciones',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0D47A1),
                ),
              ),
            ),
          ),

          // LISTA DE CANCIONES
          Expanded(
            child: ListView.builder(
              itemCount: canciones.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),

              itemBuilder: (context, index) {

                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 8,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.08),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),

                  child: ListTile(

                    leading: Container(
                      width: 45,
                      height: 45,

                      decoration: BoxDecoration(
                        color: const Color(0xFFE3F2FD),
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: const Icon(
                        Icons.music_note,
                        color: Color(0xFF1976D2),
                      ),
                    ),

                    title: Text(
                      canciones[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle: Text(
                      artistas[index],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    trailing: Container(
                      width: 38,
                      height: 38,

                      decoration: const BoxDecoration(
                        color: Color(0xFFE3F2FD),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.play_arrow,
                        color: Color(0xFF1976D2),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // BARRA INFERIOR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF1565C0),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Álbumes',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Agregar',
          ),

        ],
      ),
    );
  }
}

