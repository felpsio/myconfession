import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';

import '../presentation/pages/add_sin_page.dart';

class ConfessionContainer extends StatelessWidget {
  ConfessionContainer({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return AddSinPage(
          vm.onAddConfession,
        );
      }
    );
  }
}

class _ViewModel {
  final Function onAddConfession;

  _ViewModel({
    @required this.onAddConfession,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onAddConfession: () {}
    );
  }
}