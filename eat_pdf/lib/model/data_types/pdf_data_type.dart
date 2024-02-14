import 'package:eat_pdf/model/data_types/pdf_dictionary.dart';
import 'package:equatable/equatable.dart';

abstract class PdfDataType extends Equatable {
  const PdfDataType();

  factory PdfDataType.parse(String input) {
    if (PdfDictionary.isDictionary(input: input)) {
      return PdfDictionary.parse(input);
    } else {
      throw Exception('No valid datatype found for $input');
    }
  }
}
