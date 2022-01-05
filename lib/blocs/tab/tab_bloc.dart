import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_event.dart';

part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(FeedTab());

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is TabUpdated) {
      if (event.tab == AppTab.feed) {
        yield FeedTab();
      } else if (event.tab == AppTab.profile) {
        yield ProfileTab();
      }
    } else if (event is ToRegistrationEvent) {
      yield RegistrationTab();
    } else if (event is ToAuthorizationEvent) {
      yield AuthTab();
    }
  }
}
