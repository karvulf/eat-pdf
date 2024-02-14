import 'package:eat_pdf/model/body/pdf_cross_reference_table_section_entry.dart';
import 'package:eat_pdf/model/body/pdf_object_number.dart';
import 'package:equatable/equatable.dart';

class PdfCrossReferenceTableSection extends Equatable {
  static final _regex = RegExp(
    r'xref\s(\d) (\d)(\s\d{10} \d{5} [fn])+',
  );

  final PdfObjectNumber firstObjectNumber;
  final int objectCount;
  final List<PdfCrossReferenceTableSectionEntry> entries;

  const PdfCrossReferenceTableSection({
    required this.firstObjectNumber,
    required this.objectCount,
    required this.entries,
  });

  factory PdfCrossReferenceTableSection.parse(String input) {
    final match = _regex.firstMatch(input);

    // firstObject
    final firstObjectInput = match?.group(1);

    if (firstObjectInput == null) {
      throw Exception(
        '[$PdfCrossReferenceTableSection]: firstObject input is null!',
      );
    }

    // objectCount
    final objectCountInput = match?.group(2);

    if (objectCountInput == null) {
      throw Exception(
        '[$PdfCrossReferenceTableSection]: objectCount input is null!',
      );
    }

    // entries
    final entriesMatches = match?.group(2);

    return PdfCrossReferenceTableSection(
      firstObjectNumber: PdfObjectNumber.parse(firstObjectInput),
      objectCount: int.parse(objectCountInput),
      entries: [],
    );
  }

  @override
  List<Object?> get props => [firstObjectNumber, objectCount, entries];
}
