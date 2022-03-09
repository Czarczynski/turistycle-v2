import 'package:flutter/material.dart';
import 'package:turistycle/theme/colors.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final Widget? body;
  final double? height, width;

  const DashboardCard(
      {Key? key, required this.title, this.body, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (width ?? 0.3),
      height: MediaQuery.of(context).size.width * (height ?? 0.3),
      child: Card(
        color: cPeachCream,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(color: cCorfuShallows),
              ),
              body ??
                  const Placeholder(
                    fallbackHeight: 0,
                    fallbackWidth: 0,
                    color: Colors.transparent,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
