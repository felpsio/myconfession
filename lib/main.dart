import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';



import './app/app.dart';
import './middleware/store_middleware.dart';
import './models/models.dart';
import './actions/actions.dart';

import './presentation/screens/home_screen.dart';
import './presentation/screens/add_sin_screen.dart';
import './presentation/screens/confession_screen.dart';

import './reducers/app_state_reducer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Persistor<AppState> persistor;
  Store<AppState> store;

  persistor = Persistor<AppState>(
    storage: FlutterStorage(location: FlutterSaveLocation.sharedPreferences),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  AppState initialState = AppState();
  // DateTime now = DateTime.now();
  // AppState initialState = AppState(
  //   experienceState: ExperienceState(
  //     // firstUse: now,
  //     // lastUse: now,
  //   )
  // );

  try {
    initialState = await persistor.load();
  } catch(error) {
    //
  }


  store = Store<AppState>(
    appReducer,
    initialState: initialState,
    middleware  : createStoreMiddleware(
      navigatorKey,
    )
    ..add(persistor.createMiddleware()),
  );

  runApp(MainApp(store, navigatorKey));
}

class MainApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Store<AppState> store;

  MainApp(this.store, this.navigatorKey);

  @override
  MainAppState createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  MainAppState();

  Store<AppState> store;

  void initState() {
    super.initState();

    store = widget.store;
  }

  @override
  Widget build(BuildContext context) {
    
    return StoreProvider(
      store: store,
      child: MaterialApp(
  //       localizationsDelegates: [
  //  // ... app-specific localization delegate[s] here
  //         GlobalMaterialLocalizations.delegate,
  //         GlobalWidgetsLocalizations.delegate,
  //         prefix0.GlobalCupertinoLocalizations.delegate
  //         // GlobalCupertinoLocalizations.delegate
  //         // GlobalCupertinoLocalizations.delegate,
  //       ],
        locale: Locale('en'),
        // supportedLocales: [
        //   const Locale('en'), // English
        //   const Locale('pt'), // Portuguese
        //   const Locale('es'), // Spanish
        // ],
        debugShowCheckedModeBanner: false,
        title: 'MyConfession',  
        theme: AppTheme.theme,
        navigatorKey: widget.navigatorKey,
        initialRoute: HomeScreen.route,
        routes: <String, WidgetBuilder> {
          HomeScreen.route  : (context) {
            return StoreBuilder<AppState>(
              builder: (context, store) => HomeScreen(),
            );
          },
          ConfessionScreen.route  : (context) {
            return StoreBuilder<AppState>(
              builder: (context, store) => ConfessionScreen(),
            );
          },
          AddSinScreen.route  : (context) {
            return StoreBuilder<AppState>(
              builder: (context, store) => AddSinScreen(),
            );
          },
        },
      )
    );
  }
}