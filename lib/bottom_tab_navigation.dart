import 'package:flutter/material.dart';

class BottomTabComponent extends StatefulWidget {
  BottomTabComponent({Key key,this.icons,this.pages,this.initial}) : super(key: key);

  final List<BottomNavigationBarItem> icons;
  final List<Widget> pages;
  final int initial;

  @override
  State<StatefulWidget> createState() {
    return _BottomTabComponentState(
      icons: icons,
      pages: pages,
      initial:initial
    );
  }
}

class _BottomTabComponentState extends State<BottomTabComponent>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<BottomNavigationBarItem> icons;
  List<Widget> pages;
  int initial;

  _BottomTabComponentState({
    this.icons,
    this.pages,
    this.initial
  });

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: this.pages.length);
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
      home: DefaultTabController(
        length: this.pages.length,
        initialIndex: this.initial,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              items: this.icons,
              currentIndex: _tabController.index,
              onTap: (int index) => {_tabController.animateTo(index)}),
          body: TabBarView(
            controller: _tabController,
            children: this.pages,
          ),
        ),
      ),
    );
  }
}
