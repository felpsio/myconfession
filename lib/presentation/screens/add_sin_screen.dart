import 'package:flutter/material.dart';

import '../../containers/add_sin_container.dart';

class AddSinScreen extends StatelessWidget {
  static String route = '/addSin';

  AddSinScreen();

  @override
  Widget build(BuildContext context) {
    return AddSinContainer();
  }
}