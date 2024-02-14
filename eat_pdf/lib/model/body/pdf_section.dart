import 'package:eat_pdf/model/body/pdf_object.dart';
import 'package:equatable/equatable.dart';

class PdfSection extends Equatable {
  final PdfObject pdfObject;

  const PdfSection({
    required this.pdfObject,
  });

  factory PdfSection.parse(String inputString) {
    return PdfSection(
      pdfObject: PdfObject.parse(inputString),
    );
  }

  @override
  List<Object?> get props => [pdfObject];
}
