import 'package:eat_pdf/model/data_types/pdf_data_type.dart';

class PdfDictionary extends PdfDataType {
  static final _contentRegex = RegExp(r'<<(.*?)>>');

  final String content;

  const PdfDictionary({
    required this.content,
  });

  factory PdfDictionary.parse(String input) {
    final contentMatch = _contentRegex.firstMatch(input);
    final content = contentMatch?.group(1);

    if (content == null) {
      throw Exception('[$PdfDictionary]: No match found for $input');
    }

    return PdfDictionary(
      content: content,
    );
  }

  static bool isDictionary({required String input}) {
    return _contentRegex.hasMatch(input);
  }

  @override
  List<Object?> get props => [content];
}
