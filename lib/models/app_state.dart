import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'models.dart';

@immutable
class AppState {
  final List<Confession> confessions;
  final List<Sin> sins;
  final String language;

  AppState({
    this.confessions = const <Confession>[],
    this.sins        = const <Sin>[],
    this.language    = 'en'
  });

  AppState copyWith({
    final List<Confession> confessions,
    final List<Sin> sins,
    final String language,
  }) {
    return AppState(
      confessions : confessions ?? this.confessions,
      sins        : sins        ?? this.sins,
      language    : language    ?? this.language
    );
  }

  @override
  int get hashCode =>
    confessions.hashCode
    ^sins.hashCode
    ^language.hashCode
  ;


  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is AppState
      && runtimeType == other.runtimeType
      && confessions == other.confessions
      && sins        == other.sins
      && language    == other.language
  ;

  static AppState fromJson(dynamic json) {
    try {
      if (json == null) return AppState();

      List<Confession> confessions = <Confession>[];
      List<Sin> sins = <Sin>[];

      json['confessions'].forEach( (item) => confessions.add(Confession.fromJson(item)));
      // json['sins'].forEach( (item) => sins.add(Sin.fromJson(item)));

      return AppState(
        confessions : confessions,
        sins        : sins,
        language    : json['language'] ?? null,
      );

    } catch (error) {
      print(error.toString());
      return AppState();
    }
  }

  Map toJson() =>
  {
    'confessions' : confessions,
    'sins'        : sins,
    'language'    : language,
  };
}