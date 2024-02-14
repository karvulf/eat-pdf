library eat_pdf;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EatPdfView extends StatefulWidget {
  final String path;

  const EatPdfView({
    required this.path,
    super.key,
  });

  @override
  State<EatPdfView> createState() => _EatPdfViewState();
}

class _EatPdfViewState extends State<EatPdfView> {
  @override
  void initState() {
    super.initState();
    _readPdf();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> _readPdf() async {
    final content = await rootBundle.loadString(widget.path);
    print('hello');
  }
}
