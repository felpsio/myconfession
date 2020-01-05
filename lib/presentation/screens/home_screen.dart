import 'package:flutter/material.dart';

import '../../containers/home_container.dart';

class HomeScreen extends StatelessWidget {
  static String route = '/';

  HomeScreen();

  @override
  Widget build(BuildContext context) {
    return HomeContainer();
  }
}