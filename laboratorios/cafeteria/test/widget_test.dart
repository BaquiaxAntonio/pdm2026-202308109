import 'package:cafeteria/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Finder botonAgregar(int indice) =>
    find.widgetWithIcon(IconButton, Icons.add).at(indice);

Finder botonQuitar(int indice) =>
    find.widgetWithIcon(IconButton, Icons.remove).at(indice);

void main() {
  group('MiPedidoScreen', () {
    testWidgets('muestra los tres productos, precios y total inicial', (
      tester,
    ) async {
      await tester.pumpWidget(const CafeteriaApp());

      expect(find.text('Café'), findsOneWidget);
      expect(find.text('Sándwich'), findsOneWidget);
      expect(find.text('Jugo'), findsOneWidget);

      expect(find.text('Precio: Q10.00'), findsOneWidget);
      expect(find.text('Precio: Q25.00'), findsOneWidget);
      expect(find.text('Precio: Q12.00'), findsOneWidget);

      expect(find.text('0'), findsNWidgets(3));
      expect(find.text('Q0.00'), findsOneWidget);
    });

    testWidgets('muestra la imagen de cada producto', (tester) async {
      await tester.pumpWidget(const CafeteriaApp());

      expect(find.byType(Image), findsNWidgets(3));
      expect(
        tester.widget<Image>(find.byType(Image).first).image,
        isA<AssetImage>().having(
          (imagen) => imagen.assetName,
          'assetName',
          'assets/img/Coffe.jpg',
        ),
      );
    });

    testWidgets('agregar café actualiza cantidad y total', (tester) async {
      await tester.pumpWidget(const CafeteriaApp());

      await tester.tap(botonAgregar(0));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('Q10.00'), findsOneWidget);
    });

    testWidgets('agregar dos sándwiches suma Q50.00 al total', (tester) async {
      await tester.pumpWidget(const CafeteriaApp());

      await tester.tap(botonAgregar(1));
      await tester.pump();
      await tester.tap(botonAgregar(1));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
      expect(find.text('Q50.00'), findsOneWidget);
    });

    testWidgets('el botón de quitar está deshabilitado con cantidad 0', (
      tester,
    ) async {
      await tester.pumpWidget(const CafeteriaApp());

      final IconButton boton = tester.widget(botonQuitar(0));
      expect(boton.onPressed, isNull);
    });

    testWidgets('no se puede decrementar por debajo de cero', (tester) async {
      await tester.pumpWidget(const CafeteriaApp());

      await tester.tap(botonAgregar(2));
      await tester.pump();
      await tester.tap(botonQuitar(2));
      await tester.pump();

      expect(find.text('0'), findsNWidgets(3));
      expect(find.text('Q0.00'), findsOneWidget);
      expect(find.text('Jugo'), findsOneWidget);
    });

    testWidgets('vaciar pedido restablece cantidades y total', (tester) async {
      await tester.pumpWidget(const CafeteriaApp());

      await tester.tap(botonAgregar(0));
      await tester.pump();
      await tester.tap(botonAgregar(1));
      await tester.pump();
      await tester.tap(botonAgregar(2));
      await tester.pump();

      expect(find.text('Q47.00'), findsOneWidget);

      await tester.tap(find.text('Vaciar pedido'));
      await tester.pump();

      expect(find.text('0'), findsNWidgets(3));
      expect(find.text('Q0.00'), findsOneWidget);
    });
  });
}
