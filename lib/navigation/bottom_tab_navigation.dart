import 'package:flutter/material.dart';
import 'package:turistycle/models/tab_details_object.dart';
import 'package:turistycle/navigation/settings_navigator.dart';
import 'package:turistycle/pages/dashboard/dashboard_page.dart';
import 'package:turistycle/pages/social/social_page.dart';
import 'package:turistycle/theme/colors.dart';

class BottomTabNavigation extends StatefulWidget {
  const BottomTabNavigation({Key? key}) : super(key: key);

  @override
  _BottomTabNavigationStateState createState() =>
      _BottomTabNavigationStateState();
}

class _BottomTabNavigationStateState extends State<BottomTabNavigation> {
  TabDetailsObject _tabDetails = _tabPages[0];

  static final List<TabDetailsObject> _tabPages = <TabDetailsObject>[
    TabDetailsObject(
      index: 0,
      widget: const DashboardPage(),
      title: "Dashboard",
      leftButton: IconButton(
        icon: const Icon(Icons.account_circle, size: 30),
        onPressed: () => {},
      ),
    ),
    TabDetailsObject(
      index: 1,
      widget: const Text("Search"),
    ),
    TabDetailsObject(index: 2, widget: const Text("Map")),
    TabDetailsObject(
        index: 3, widget: SocialPage(), title: "Community"),
    TabDetailsObject(
        index: 4, widget: const SettingsNavigator(), title: "Settings"),
  ];

  _onTabChanged(int index) {
    setState(() => {_tabDetails = _tabPages[index]});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [cTemptatiousTangerine, cCreamySweetCorn],
          begin: Alignment(1,0),//.topLeft,
          end: Alignment(0,1),//.bottomLeft,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _tabDetails.showAppBar
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _tabDetails.getLeftButton,
                    Text(_tabDetails.title ?? "", textScaleFactor: 1.4),
                    _tabDetails.index == 0
                        ? IconButton(
                            icon: const Icon(Icons.mode_comment),
                            onPressed: () {
                              Navigator.pushNamed(context, '/chat');
                            },
                          )
                        : _tabDetails.getRightButton,
                  ],
                ),
              )
            : null,
        body: _tabDetails.widget,
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          elevation: 0,
          currentIndex: _tabDetails.index,
          backgroundColor: Colors.transparent,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          onTap: _onTabChanged,
        ),
      ),
    );
  }
}
