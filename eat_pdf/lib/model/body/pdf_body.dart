import 'package:eat_pdf/model/body/pdf_cross_reference_table_section.dart';
import 'package:eat_pdf/model/body/pdf_section.dart';
import 'package:equatable/equatable.dart';

class PdfBody extends Equatable {
  static final _regex = RegExp(r'(\d \d obj[\s\S]*endobj)');

  final List<PdfSection> sections;
  final PdfCrossReferenceTableSection crossReferenceTableSection;

  const PdfBody({
    required this.sections,
    required this.crossReferenceTableSection,
  });

  factory PdfBody.parse(String input) {
    // objects
    final matches = _regex.allMatches(input);
    final objects = matches.map((match) => match.group(1)!.trim()).toList();

    final sections = <PdfSection>[];

    for (final object in objects) {
      sections.add(PdfSection.parse(object));
    }

    // cross reference table
    final crossReferenceTable = PdfCrossReferenceTableSection.parse(input);

    return PdfBody(
      sections: sections,
      crossReferenceTableSection: crossReferenceTable,
    );
  }

  @override
  List<Object?> get props => [sections];
}
