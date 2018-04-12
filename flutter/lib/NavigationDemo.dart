import 'package:flutter/material.dart';

import 'navigation_icon_view.dart';

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);

    return new Container(
      margin: const EdgeInsets.all(4.0),
      width: iconTheme.size - 8.0,
      height: iconTheme.size - 8.0,
      decoration: new BoxDecoration(color: iconTheme.color),
    );
  }
}

class MenusDemo extends StatefulWidget {
  @override
  _MenusDemoState createState() => new _MenusDemoState();
}

class _MenusDemoState extends State<MenusDemo> with TickerProviderStateMixin {
  int _currentIndex = 2;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<NavigationIconView> _navigationViews;
  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.access_alarm),
        title: new Text('成就'),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new CustomIcon(),
        title: new Text('行动'),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.cloud),
        title: new Text('人物'),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.favorite),
        title: new Text('财产'),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.event_available),
        title: new Text('设置'),
        color: Colors.deepPurple[500],
        vsync: this,
      ),
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);
    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
  }

  void _rebuild() {
    setState(() {});
  }

  Widget _buildTransitionStack() {
    final List<FadeTransition> transitons = <FadeTransition>[];
    for (NavigationIconView view in _navigationViews)
      transitons.add(view.transition(_type, context));
    transitons.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.opacity;
      final Animation<double> bAnimation = b.opacity;
      double aValue = aAnimation.value;
      double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });
    return new Stack(children: transitons);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('底部导航演示'),
        actions: <Widget>[
          new PopupMenuButton<BottomNavigationBarType>(
              onSelected: (BottomNavigationBarType value) {
                setState(() {
                  _type = value;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<BottomNavigationBarType>>[
                    new PopupMenuItem<BottomNavigationBarType>(
                      value: BottomNavigationBarType.fixed,
                      child: new Text('fixed'),
                    ),
                    new PopupMenuItem<BottomNavigationBarType>(
                      value: BottomNavigationBarType.shifting,
                      child: new Text('shifting'),
                    )
                  ])
        ],
      ),
      body: new Center(
        child: _buildTransitionStack(),
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
