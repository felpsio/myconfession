import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
// import '../selectors/selectors.dart';

import '../presentation/UI/app_drawer.dart';

class AppDrawerContainer extends StatelessWidget {
  AppDrawerContainer({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return AppDrawer(
          onDonate           : vm.onDonate,
          openURL            : vm.openURL,
          openFeatureSuggest : vm.openFeatureSuggest,
          openBugReport      : vm.openBugReport,
          openPrivacyPolicy  : vm.openPrivacyPolicy,
          // openQRCodeScan     : vm.openQRCodeScan,
          // logEvent           : vm.logEvent,
        );
      }
    );
  }
}

class _ViewModel {
  final Function(String donationId, {Completer completer}) onDonate;
  final Function(String url) openURL;
  final Function() openFeatureSuggest;
  final Function() openBugReport;
  final Function() openPrivacyPolicy;


  _ViewModel({
    @required this.onDonate,
    @required this.openURL,
    @required this.openFeatureSuggest,
    @required this.openBugReport,
    @required this.openPrivacyPolicy,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onDonate: (donationId, {completer}) => {}, //store.dispatch(CreatePurchase(donationId, completer: completer)),
      openURL: (url) => {}, //store.dispatch(OpenURL(url)),
      openFeatureSuggest: () => {}, //store.dispatch(OpenFeatureSuggest()),
      openBugReport: () => {}, //store.dispatch(OpenBugReport()),
      openPrivacyPolicy: () => {}, //store.dispatch(OpenPrivacyPolicy()),
    );
  }
}