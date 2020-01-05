import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';

import '../presentation/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return HomePage(
          vm.lastConfession,
          vm.isGraceState,
          vm.openConfessionPage,
          vm.openAddSinPage
        );
      }
    );
  }
}

class _ViewModel {
  final DateTime lastConfession;
  final bool isGraceState;
  final Function() openConfessionPage;
  final Function() openAddSinPage;

  _ViewModel({
    @required this.lastConfession,
    @required this.isGraceState,
    @required this.openAddSinPage,
    @required this.openConfessionPage,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      lastConfession: lastConfessionSelecor(store.state),
      isGraceState: isGraceStateSelector(store.state),
      openConfessionPage: () => store.dispatch(OpenConfessionPage()),
      openAddSinPage: () => store.dispatch(OpenAddSinPage()),
    );
  }
}