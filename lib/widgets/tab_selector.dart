import 'package:app/blocs/tab/tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    required this.activeTab,
    required this.onTabSelected,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: Icon(
            tab == AppTab.feed ? Icons.home : Icons.account_circle,
          ),
          label: tab == AppTab.feed
              ? 'Feed'
              : 'Profile',
        );
      }).toList(),
    );
  }
}