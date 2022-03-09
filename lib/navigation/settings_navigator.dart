import 'package:flutter/material.dart';
import 'package:turistycle/pages/dashboard/dashboard_page.dart';
import 'package:turistycle/pages/settings/account_page.dart';
import 'package:turistycle/pages/settings/settings_page.dart';

class SettingsNavigator extends StatefulWidget {
  const SettingsNavigator({Key? key}) : super(key: key);

  @override
  _SettingsNavigatorState createState() => _SettingsNavigatorState();
}

class _SettingsNavigatorState extends State<SettingsNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case '/':
                return const SettingsPage();
              case '/account':
                return const AccountDetailsPage();
              default:
                return const SettingsPage();
            }
          },
        );
      },
    );
  }
}
