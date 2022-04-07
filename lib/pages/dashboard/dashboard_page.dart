import 'package:flutter/material.dart';
import 'package:turistycle/components/dashboard_card.dart';
import 'package:turistycle/components/switcher.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const <Widget>[
                  DashboardCard(
                    title: "Calories",
                  ),
                  DashboardCard(title: "Goal"),
                  DashboardCard(title: "Title"),
                  DashboardCard(title: "Title"),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: DashboardCard(title: "New users", width: 1, height:1),
          ),
          const ModeSwitcher()
        ],
      ),
    );
  }
}
