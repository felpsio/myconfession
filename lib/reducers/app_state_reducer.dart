// import 'package:redux_persist/redux_persist.dart';

// import '../actions/actions.dart';

import '../models/models.dart';
// import '../reducers/qr_contacts_reducer.dart';
// import '../reducers/selected_item_reducer.dart';
// import '../reducers/experience_state_reducer.dart';



AppState appReducer(AppState state, action) {
  
    return AppState(
      // qrContacts:          qRContactsReducer(state.qrContacts, action),
      // selectedItem:        selectedItemReducer(state.selectedItem, action),
      // experienceState:     experienceStateReducer(state.experienceState, action),
    );
}