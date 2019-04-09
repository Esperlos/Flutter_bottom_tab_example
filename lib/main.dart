import 'package:flutter/material.dart';
import 'package:flutter_app_tabs_exercise/bottom_tab_navigation.dart';
import 'package:flutter_app_tabs_exercise/home_page.dart';
import 'package:flutter_app_tabs_exercise/stateless_widget.dart';

void main() => runApp(TabBarDemo());

class TabBarDemo extends StatefulWidget {
  TabBarDemo({Key key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomTabComponent(
        icons: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
        pages: [
          MyHomePage(title: 'Flutter Demo Home2 Page'),
          TabTwo(),
          Icon(Icons.directions_bike),
        ],
        initial: 0,
      ),
    );
  }
}