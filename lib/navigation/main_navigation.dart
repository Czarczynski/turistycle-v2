import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turistycle/navigation/bottom_tab_navigation.dart';
import 'package:turistycle/pages/auth/login_page.dart';
import 'package:turistycle/services/auth_service.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('error'),
          );
        } else if (snapshot.hasData) {
          return const BottomTabNavigation();
        }else{
          return const LoginPage();
        }
      }
    );
  }
}
