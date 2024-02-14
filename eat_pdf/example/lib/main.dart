import 'package:eat_pdf/eat_pdf.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const _pdfPath = 'assets/helloworld.pdf';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const EatPdfView(
          path: _pdfPath,
        ),
      ),
    );
  }
}
