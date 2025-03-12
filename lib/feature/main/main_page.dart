import 'package:flutter/material.dart';
import 'package:netflix_clone/feature/home/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomNavigationBar(),
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        children: [HomeScreen(), HomeScreen(), HomeScreen()],
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({super.key});

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          activeIcon: Icon(Icons.home_filled),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.auto_awesome_motion_outlined),
          label: 'New & Hot',
          activeIcon: Icon(Icons.auto_awesome_motion_rounded),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          label: 'My Netflix',
          activeIcon: Icon(Icons.account_circle_rounded),
        ),
      ],
    );
  }
}
