import 'package:flutter/material.dart';

void main() {
  runApp(const TorneoApp());
}

class TorneoApp extends StatelessWidget {
  const TorneoApp({super.key});

  static const String titulo = 'Torneo Apertura';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titulo,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 4,
        ),
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int puntosA = 0;
  int puntosB = 0;

  void cambiarPuntos(bool equipoA, int cantidad) {
    setState(() {
      if (equipoA) {
        puntosA = (puntosA + cantidad).clamp(0, double.infinity).toInt();
      } else {
        puntosB = (puntosB + cantidad).clamp(0, double.infinity).toInt();
      }
    });
  }

  void reiniciarMarcador() {
    setState(() {
      puntosA = 0;
      puntosB = 0;
    });
  }

  bool get equipoAGana => puntosA > puntosB;

  bool get equipoBGana => puntosB > puntosA;

  String get mensajeEstado {
    if (equipoAGana) {
      return 'Va ganando Equipo A';
    }

    if (equipoBGana) {
      return 'Va ganando Equipo B';
    }

    return 'Empate';
  }

  Color get colorEstado {
    if (equipoAGana || equipoBGana) {
      return Colors.green;
    }

    return Colors.black87;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Torneo Apertura',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 1,
              ),
            ),
            Text(
              'Marcador en vivo',
              style: TextStyle(
                fontSize: 11,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                mensajeEstado,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: colorEstado,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EquipoPanel(
                    nombre: 'Equipo A',
                    puntos: puntosA,
                    esGanador: equipoAGana,
                    icono: Icons.shield,
                    onCambiarPuntos: (cantidad) =>
                        cambiarPuntos(true, cantidad),
                  ),
                  const SizedBox(width: 24),
                  EquipoPanel(
                    nombre: 'Equipo B',
                    puntos: puntosB,
                    esGanador: equipoBGana,
                    icono: Icons.sports_soccer,
                    onCambiarPuntos: (cantidad) =>
                        cambiarPuntos(false, cantidad),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: reiniciarMarcador,
                icon: const Icon(Icons.refresh),
                label: const Text('Reiniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EquipoPanel extends StatelessWidget {
  const EquipoPanel({
    super.key,
    required this.nombre,
    required this.puntos,
    required this.esGanador,
    required this.icono,
    required this.onCambiarPuntos,
  });

  final String nombre;
  final int puntos;
  final bool esGanador;
  final IconData icono;
  final ValueChanged<int> onCambiarPuntos;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          elevation: esGanador ? 8 : 2,
          color: esGanador ? Colors.green[50] : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: esGanador ? Colors.green : Colors.transparent,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.indigo,
                  child: Icon(
                    icono,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  nombre,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  '$puntos',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: esGanador ? Colors.green : null,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BotonPuntuacion(
              icono: Icons.remove,
              tooltip: 'Restar punto',
              onPressed: () => onCambiarPuntos(-1),
            ),
            const SizedBox(width: 12),
            BotonPuntuacion(
              icono: Icons.add,
              tooltip: 'Sumar punto',
              onPressed: () => onCambiarPuntos(1),
            ),
          ],
        ),
      ],
    );
  }
}

class BotonPuntuacion extends StatelessWidget {
  const BotonPuntuacion({
    super.key,
    required this.icono,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icono;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(44, 44),
          padding: const EdgeInsets.all(8),
        ),
        child: Icon(icono, size: 24),
      ),
    );
  }
}