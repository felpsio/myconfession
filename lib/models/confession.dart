import 'package:meta/meta.dart';

@immutable
class Confession {
  final DateTime date;
  //TODO: notes to help next confession

  Confession(
    this.date,
  );

  Confession copyWith({
    final DateTime date,
  }) {
    return Confession(
      date   ?? this.date,
    );
  }

  @override
  int get hashCode =>
    date.hashCode;

  @override
  bool operator ==(Object other) =>
  identical(this, other) ||
  other is Confession &&
    runtimeType == other.runtimeType &&
    date        == other.date;

  static Confession fromJson(Map<String, dynamic> json) {
    return Confession(
      json['date'],
    );
  }

  dynamic toJson() => {
    'date' : date,
  };
}