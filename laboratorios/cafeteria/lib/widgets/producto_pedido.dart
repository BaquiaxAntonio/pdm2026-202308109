import 'package:flutter/material.dart';

import '../models/producto.dart';

class ProductoPedido extends StatelessWidget {
  final Producto producto;
  final VoidCallback onIncrementar;
  final VoidCallback onDecrementar;

  const ProductoPedido({
    super.key,
    required this.producto,
    required this.onIncrementar,
    required this.onDecrementar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                producto.imagen,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 56,
                  height: 56,
                  alignment: Alignment.center,
                  child: const Icon(Icons.fastfood),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.nombre,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Precio: Q${producto.precio.toStringAsFixed(2)}'),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Quitar uno',
              icon: const Icon(Icons.remove),
              onPressed: producto.cantidad == 0 ? null : onDecrementar,
            ),
            Container(
              width: 44,
              alignment: Alignment.center,
              child: Text(
                '${producto.cantidad}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            IconButton(
              tooltip: 'Agregar uno',
              icon: const Icon(Icons.add),
              onPressed: onIncrementar,
            ),
          ],
        ),
      ),
    );
  }
}
