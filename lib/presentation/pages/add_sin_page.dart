import 'package:MyConfession/containers/app_drawer_container.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class AddSinPage extends StatelessWidget {
  final Function() onAddSin;

  AddSinPage(
    this.onAddSin,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Sin"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Add sin page")
            
          ],
        ),
      ),
    );
  }
}