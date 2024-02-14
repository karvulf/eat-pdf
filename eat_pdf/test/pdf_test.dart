import 'package:eat_pdf/model/body/pdf_body.dart';
import 'package:eat_pdf/model/body/pdf_cross_reference_table_section.dart';
import 'package:eat_pdf/model/body/pdf_object.dart';
import 'package:eat_pdf/model/body/pdf_object_number.dart';
import 'package:eat_pdf/model/body/pdf_section.dart';
import 'package:eat_pdf/model/data_types/pdf_dictionary.dart';
import 'package:eat_pdf/model/pdf.dart';
import 'package:eat_pdf/model/pdf_header.dart';
import 'package:eat_pdf/model/pdf_trailer_section.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'GIVEN pdf string '
      'WHEN calling Pdf.parse '
      'THEN should return expected Pdf', () {
    // given
    const givenPdfString = """
%PDF-2.0
1 0 obj << >>
endobj
xref
0 2
0000000000 65535 f
0000000010 00000 n
    """;

    // when
    final actual = Pdf.parse(givenPdfString);

    // then
    const expectedPdf = Pdf(
      header: PdfHeader(version: 2.0),
      body: PdfBody(
        sections: [
          PdfSection(
            pdfObject: PdfObject(
              dataType: PdfDictionary(content: ' '),
              number: PdfObjectNumber(number: 1),
            ),
          ),
        ],
        crossReferenceTableSection: PdfCrossReferenceTableSection(
          firstObjectNumber: PdfObjectNumber(number: 0),
          objectCount: 2,
          entries: [],
        ),
      ),
      trailerSection: PdfTrailerSection(),
    );
    expect(actual, equals(expectedPdf));
  });
}
