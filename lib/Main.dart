import 'package:flutter/material.dart';
import 'PaginaInicial.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importe esta linha

void main() {
  initializeDateFormatting('pt_BR', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Comentario

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LifEvents',
      home: MyHomePage(title: 'Loading Page'),
    );
  }
}
