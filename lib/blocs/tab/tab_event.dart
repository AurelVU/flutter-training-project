part of 'tab_bloc.dart';

@immutable
abstract class TabEvent {}

class TabUpdated extends TabEvent {
  final AppTab tab;

  TabUpdated(this.tab);

  List<Object> get props => [tab];

  @override
  String toString() => 'TabUpdated { tab: $tab }';
}

class ToRegistrationEvent extends TabEvent {}

class ToAuthorizationEvent extends TabEvent {}
