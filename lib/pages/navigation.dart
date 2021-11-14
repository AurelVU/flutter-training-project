import 'package:app/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/feed.dart';

class Navigation extends StatefulWidget {
  int selectedIndex;

  Navigation({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
{
  int selectedIndex = 0;
  PageController pageController = PageController(keepPage: false);
  
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Тест')),
      body: PageView(
        controller: pageController,
        children: const [
          Feed(),
          Profile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Новости',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Профиль',
        )
      ],
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
    ));
  }
}