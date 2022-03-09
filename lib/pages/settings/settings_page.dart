import 'package:flutter/material.dart';
import 'package:turistycle/components/long_button.dart';
import 'package:turistycle/pages/dashboard/dashboard_page.dart';
import 'package:turistycle/services/auth_service.dart';
import 'package:turistycle/theme/colors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static List<Widget> buttons = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const Icon(Icons.account_circle, size: 200, color: cPeachCream),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: LongButton(
                          icon: Icons.arrow_forward_ios,
                          title: "Account Details",
                          onPressed: () => Navigator.pushNamed(context, '/account'),
                        ),
                      );
                    case 1:
                      return LongButton(
                        icon: Icons.arrow_forward_ios,
                        title: "Terms & Conditions",
                        onPressed: () => {},
                      );
                    case 2:
                      return LongButton(
                        icon: Icons.arrow_forward_ios,
                        title: "Found bug?",
                        onPressed: () => {},
                      );
                    case 3:
                      return Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: LongButton(
                          icon: Icons.logout,
                          title: "Logout",
                          onPressed: () async => await AuthService().signOut(),
                        ),
                      );
                    default:
                      return const Placeholder();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
