import 'dart:async';

import 'package:flutter/material.dart';



class AppDrawer extends StatelessWidget {
  final Function(String donationId, {Completer completer}) onDonate;
  final Function(String url) openURL;
  final Function() openFeatureSuggest;
  final Function() openBugReport;
  final Function() openPrivacyPolicy;
  
  AppDrawer({
    @required this.onDonate,
    @required this.openURL,
    @required this.openFeatureSuggest,
    @required this.openBugReport,
    @required this.openPrivacyPolicy,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Settings'),
                        )

                      ],
                    ),
                    onPressed: () {
                    } 
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.help),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('FAQ'),
                        )

                      ],
                    ),
                    onPressed: () {
                    } 
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Donate'),
                        )

                      ],
                    ),
                    onPressed: () {
                    } 
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.favorite),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Share this App'),
                        )
                      ],
                    ),
                    onPressed: () {
                    }
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.cake),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Suggest a Feature'),
                        )
                      ],
                    ),
                    onPressed: () => openFeatureSuggest()
                  ),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 15),
                  child: MaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.bug_report),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Report a Bug'),
                        )
                      ],
                    ),
                    onPressed: () => openBugReport()
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 0, bottom: 5),
            child: Column(
              children: <Widget>[
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Made with ❤️'),
                  ],
                )

              ],
            )
          )
        ],
      ),
    );
  }
}