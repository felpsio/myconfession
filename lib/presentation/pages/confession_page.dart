import 'package:MyConfession/containers/app_drawer_container.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class ConfessionPage extends StatelessWidget {
  final Function() onAddConfession;

  ConfessionPage(
    this.onAddConfession,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Confession"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Confession")
            
          ],
        ),
      ),
    );
  }
}