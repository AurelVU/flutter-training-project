part of 'tab_bloc.dart';

@immutable
abstract class TabState {
  String get title;
}

class FeedTab extends TabState {
  @override
  String get title => 'Feed';
}

class ProfileTab extends TabState {
  @override
  String get title => 'Profile';
}

enum AppTab { feed, profile }
