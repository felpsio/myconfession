import 'package:flutter/material.dart';

import '../../containers/confession_container.dart';

class ConfessionScreen extends StatelessWidget {
  static String route = '/confession';

  ConfessionScreen();

  @override
  Widget build(BuildContext context) {
    return ConfessionContainer();
  }
}