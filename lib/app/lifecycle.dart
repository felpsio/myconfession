import 'package:flutter/material.dart';

/// Handle app lifecycle changes
class LifecycleEventHandler extends WidgetsBindingObserver {
  final Function inactiveCallBack;
  final Function pausedCallBack;
  final Function detachedCallback;
  final Function resumedCallBack;

  LifecycleEventHandler({
    this.inactiveCallBack,
    this.pausedCallBack,
    this.detachedCallback,
    this.resumedCallBack,
  });


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        inactiveCallBack ?? await inactiveCallBack();
        break;
      case AppLifecycleState.paused:
        pausedCallBack ?? await pausedCallBack();
        break;
      case AppLifecycleState.detached:
        detachedCallback ?? await detachedCallback();
        break;
      case AppLifecycleState.resumed:
        resumedCallBack ?? await resumedCallBack();
        break;
    }
  }
}