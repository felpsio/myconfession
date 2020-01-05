import '../models/models.dart';

DateTime lastConfessionSelecor(AppState state) => state.confessions.isNotEmpty ?
  state.confessions.last.date
  : null
 ;

bool isGraceStateSelector(AppState state) => !state.sins.any((item) => item.isMortal == true);