import 'package:MyConfession/containers/app_drawer_container.dart';
import 'package:flutter/material.dart';

import '../../models/models.dart';

class HomePage extends StatelessWidget {
  final DateTime lastConfession;
  final bool isGraceState;
  final Function() openConfessionPage;
  final Function() openAddSinPage;

  HomePage(
    this.lastConfession,
    this.isGraceState,
    this.openConfessionPage,
    this.openAddSinPage
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Confession"),
        ),
        drawer: AppDrawerContainer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            lastConfession != null
              ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
                ),
                child: Text(
                  "Last confession: ${lastConfession.day}/${lastConfession.month}",
                  textAlign: TextAlign.center,
                ),
              )
              : Padding(padding: EdgeInsets.only(),),
            lastConfession != null
              ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
                ),
                child: Text("${DateTime.now().difference(lastConfession).inDays}"),
              )
              : Padding(padding: EdgeInsets.only(),),
            Visibility(
              visible: lastConfession == null,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10
                ),
                child: Text(
                  "You didn't confess yet",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            isGraceState
              ? Padding(padding: EdgeInsets.symmetric(),)
              : Padding(
                padding: EdgeInsets.symmetric(),
                child: Text(
                  "You are in state of mortal sin\nYou should confess as soon as possible"
                )
              ),
            Padding(
              padding: EdgeInsets.symmetric(),
              child: Text("Learn how to do a good confession"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(),
              child: MaterialButton(
                child: Text("Confess"),
                color: Colors.black,
                textColor: Colors.white,
                onPressed: () => openConfessionPage(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(

          child: Icon(Icons.add),
          onPressed: () => openAddSinPage(),
        )
      ),
    );
  }
}