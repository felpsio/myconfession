import 'dart:async';
// // import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../actions/actions.dart';
// // import 'package:qrcontact_mobile/main.dart';
import 'package:redux/redux.dart';
// import 'package:uuid/uuid.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// // import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// // import 'package:firebase_analytics/firebase_analytics.dart';

import '../presentation/screens/home_screen.dart';
import '../presentation/screens/add_sin_screen.dart';
import '../presentation/screens/confession_screen.dart';

import '../actions/actions.dart';
import '../models/models.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

List<Middleware<AppState>> createStoreMiddleware(GlobalKey<NavigatorState> key)  {
  final GlobalKey<NavigatorState> navigatorKey = key;

  final updatePage           = _updatePage(navigatorKey);
  final pushPage             = _pushPage(navigatorKey);
  final popPage              = _popPage(navigatorKey);

  final openConfessionPage   = _openConfessionPage();
  final openAddSinPage       = _openAddSinPage();

  return [
    TypedMiddleware<AppState, UpdatePage>(updatePage),
    TypedMiddleware<AppState, PushPage>(pushPage),
    TypedMiddleware<AppState, PopPage>(popPage),

    TypedMiddleware<AppState, OpenConfessionPage>(openConfessionPage),
    TypedMiddleware<AppState, OpenAddSinPage>(openAddSinPage),
  ];
}

Middleware<AppState> _updatePage(GlobalKey<NavigatorState> navigatorKey) {
  return (Store<AppState> store, action, NextDispatcher next) {
    navigatorKey.currentState.pushNamedAndRemoveUntil(action.name, (_) => false);

    next(action);
  };
}

Middleware<AppState> _pushPage(GlobalKey<NavigatorState> navigatorKey) {
  return (Store<AppState> store, action, NextDispatcher next) {
    navigatorKey.currentState.pushNamed(action.name);

    next(action);
  };
}

Middleware<AppState> _popPage(GlobalKey<NavigatorState> navigatorKey) {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }

    next(action);
  };
}

Middleware<AppState> _openConfessionPage() {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(PushPage(ConfessionScreen.route));
    next(action);
  };
}

Middleware<AppState> _openAddSinPage() {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(PushPage(AddSinScreen.route));
    next(action);
  };
}