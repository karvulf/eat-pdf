import 'package:equatable/equatable.dart';

class PdfHeader extends Equatable {
  static final _regex = RegExp(r'%PDF-(\d+(\.\d+)?)');

  final double version;

  const PdfHeader({required this.version});

  factory PdfHeader.parse(String inputString) {
    final match = _regex.firstMatch(inputString);
    final version = match?.group(1);

    return PdfHeader(
      version: version != null ? double.parse(version) : -1.0,
    );
  }

  @override
  List<Object?> get props => [version];
}
