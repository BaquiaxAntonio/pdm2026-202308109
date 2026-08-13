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
      title: 'Add Money',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const AddMoneyPage(),
    );
  }
}

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // BARRA SUPERIOR
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 20,
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        'Add money',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  // Espacio para mantener el título centrado
                  const SizedBox(width: 32),
                ],
              ),
            ),

            // SELECT CARD
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 10,
                bottom: 10,
              ),
              child: Text(
                'Select card',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // CARRUSEL DE TARJETAS
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                children: [

                  _buildCard(
                    color: const Color(0xFFB8E94E),
                    title: 'DEBIT CARD',
                    number: '•••• 0924',
                    selected: true,
                  ),

                  _buildCard(
                    color: const Color(0xFF303030),
                    title: 'Credit card',
                    number: '•••• 2488',
                    selected: false,
                  ),

                  _buildCard(
                    color: const Color(0xFF5A5A5A),
                    title: 'Bank card',
                    number: '•••• 9521',
                    selected: false,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // TITULO
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Text(
                'Add money to Neobank',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // OPCIONES
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [

                  _buildOption(
                    Icons.monetization_on,
                    'Move your direct deposit',
                  ),

                  const SizedBox(height: 7),

                  _buildOption(
                    Icons.swap_horiz,
                    'Transfer from other banks',
                  ),

                  const SizedBox(height: 7),

                  _buildOption(
                    Icons.apple,
                    'Apple Pay',
                  ),

                  const SizedBox(height: 7),

                  _buildOption(
                    Icons.credit_card_outlined,
                    'Debit / Credit Card',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
  required Color color,
  required String title,
  required String number,
  required bool selected,
}) {
  return Container(
    width: 145,
    height: 100,
    margin: const EdgeInsets.only(
      right: 10,
    ),
    padding: const EdgeInsets.all(10),

    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(14),
      border: selected
          ? Border.all(
              color: Colors.black,
              width: 1,
            )
          : null,
    ),

    child: Stack(
      children: [

        // Círculo superior izquierdo
        CircleAvatar(
          radius: 8.5,
          backgroundColor: Colors.white,
        ),

        // VISA
        if (title == 'Credit card')
          const Positioned(
            top: 4,
            right: 4,
            child: Text(
              'VISA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        // Información de la tarjeta
        Positioned(
          left: 2,
          bottom: 10,
          child: Text(
            '$title\n$number',
            style: TextStyle(
              color: color == const Color(0xFFB8E94E)
                  ? Colors.black
                  : Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Check de tarjeta seleccionada
        if (selected)
          Positioned(
            right: 2,
            bottom: 3,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
      ],
    ),
  );
}

  // OPCIONES DE AGREGAR DINERO
  Widget _buildOption(
    IconData icon,
    String title,
  ) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(icon,size: 19,color: Colors.black87,
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Text(title,style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,),),
          ),
          const Icon(Icons.chevron_right,size: 20,color: Colors.grey,),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}