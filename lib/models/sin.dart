import 'package:meta/meta.dart';

@immutable
class Sin {
  final List<int> brokenCommandments;
  final String severity;
  final bool isMortal;
  final String description;

  Sin(
    this.brokenCommandments,
    this.severity,
    {
      this.isMortal = true,
      this.description = ''
    }
  );

  Sin copyWith({
    final List<int> brokenCommandments,
    final bool isMortal,
    final String severity,
    final String description,
  }) {
    return Sin(
      brokenCommandments   ?? this.brokenCommandments,
      severity ?? this.severity,
      isMortal: isMortal ?? this.isMortal,
      description: description ?? this.description
    );
  }

  @override
  int get hashCode =>
    brokenCommandments.hashCode
    ^severity.hashCode
    ^isMortal.hashCode
    ^description.hashCode
  ;

  @override
  bool operator ==(Object other) =>
  identical(this, other) ||
  other is Sin &&
    runtimeType            == other.runtimeType
    && brokenCommandments  == other.brokenCommandments
    && severity            == other.severity
    && isMortal            == other.isMortal
    && description         == other.description
  ;

  // static Sin fromJson(Map<String, dynamic> json) {
  //   return Sin(
  //     json['brok'],
  //     json['date'],
  //     json['date'],
  //     json['date'],
  //   );
  // }

  // dynamic toJson() => {
  //   'date' : date,
  // };
}