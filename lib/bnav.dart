import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;

  List<Widget> _widgetOption = <Widget>[
    Text(
      'Index 1: Focus',
    ),
    Text(
      'Index 2: Social',
    ),
    Text(
      'Index 3: Uplifter',
    )
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_objects_outlined),
          label: 'Focus',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sentiment_satisfied_alt_rounded),
          label: 'Social',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insights_rounded),
          label: 'Uplifter',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
    );
  }
}
