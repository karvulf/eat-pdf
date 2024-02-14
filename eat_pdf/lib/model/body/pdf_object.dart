import 'package:eat_pdf/model/body/pdf_object_number.dart';
import 'package:eat_pdf/model/data_types/pdf_data_type.dart';
import 'package:equatable/equatable.dart';

class PdfObject extends Equatable {
  static final _numberRegex = RegExp(r'(\d+)');
  static final _dataTypeRegex = RegExp(r'(\d) \d (obj[\s\S]*endobj)');

  final PdfObjectNumber number;
  final PdfDataType dataType;

  const PdfObject({
    required this.number,
    required this.dataType,
  });

  factory PdfObject.parse(String input) {
    // datatype
    final dataTypeMatch = _dataTypeRegex.firstMatch(input);
    final dataTypeInput = dataTypeMatch?.group(2);

    if (dataTypeInput == null) {
      throw Exception('[$PdfObject]: No dataType input found!');
    }

    // number
    final match = _numberRegex.firstMatch(input);
    final versionInput = match?.group(1);

    if (versionInput == null) {
      throw Exception('[$PdfObject]: No version found for $input');
    }

    return PdfObject(
      number: PdfObjectNumber.parse(versionInput),
      dataType: PdfDataType.parse(dataTypeInput),
    );
  }

  @override
  List<Object?> get props => [number, dataType];
}
