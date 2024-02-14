import 'package:eat_pdf/model/body/pdf_cross_reference_table_section_entry_ending.dart';
import 'package:equatable/equatable.dart';

class PdfCrossReferenceTableSectionEntry extends Equatable {
  final String firstBloc;
  final String secondBloc;
  final PdfCrossReferenceTableSectionEntryEnding ending;

  const PdfCrossReferenceTableSectionEntry({
    required this.firstBloc,
    required this.secondBloc,
    required this.ending,
  });

  @override
  List<Object?> get props => [firstBloc, secondBloc, ending];
}
