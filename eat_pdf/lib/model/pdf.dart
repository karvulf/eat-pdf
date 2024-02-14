import 'package:eat_pdf/model/body/pdf_body.dart';
import 'package:eat_pdf/model/pdf_header.dart';
import 'package:eat_pdf/model/pdf_trailer_section.dart';
import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  final PdfHeader header;
  final PdfBody body;
  final PdfTrailerSection trailerSection;

  const Pdf({
    required this.header,
    required this.body,
    required this.trailerSection,
  });

  factory Pdf.parse(String input) {
    // header
    final header = PdfHeader.parse(input);

    // body
    final body = PdfBody.parse(input);

    // trailer
    final trailerSection = PdfTrailerSection.parse(input);

    return Pdf(
      header: header,
      body: body,
      trailerSection: trailerSection,
    );
  }

  @override
  List<Object?> get props => [header, body];
}
