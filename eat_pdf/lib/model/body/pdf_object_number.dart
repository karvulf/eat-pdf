import 'package:equatable/equatable.dart';

class PdfObjectNumber extends Equatable {
  static final _regex = RegExp(r'(\d)');

  final int number;

  const PdfObjectNumber({
    required this.number,
  });

  factory PdfObjectNumber.parse(String input) {
    final match = _regex.firstMatch(input);
    final version = match?.group(1);

    if (version == null) {
      throw Exception('[$PdfObjectNumber]: No version found for $input');
    }

    return PdfObjectNumber(
      number: int.parse(version),
    );
  }

  @override
  List<Object?> get props => [number];
}
