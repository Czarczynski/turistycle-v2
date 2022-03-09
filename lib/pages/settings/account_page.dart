import 'package:flutter/material.dart';
import 'package:turistycle/services/auth_service.dart';
import 'package:turistycle/theme/colors.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = AuthService().user;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [cTemptatiousTangerine, cCreamySweetCorn],
          begin: Alignment(1, 0),
          end: Alignment(0, 1.3),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Text(user?.displayName ?? 'anonymous'),
          ],
        ),
      ),
    );
  }
}
