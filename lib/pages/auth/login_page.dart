import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:turistycle/services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          textScaleFactor: 1.4,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            LoginButton(
              icon: FontAwesomeIcons.userNinja,
              color: Colors.green,
              function: () async => await AuthService().logInAnonymous(),
              text: 'Continue as Guest',
            ),
            LoginButton(
              icon: FontAwesomeIcons.google,
              color: Colors.blue,
              function: () async => await AuthService().logInGoogle(),
              text: 'Continue with Google',
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function function;

  const LoginButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          size: 20,
        ),
        onPressed: () => function(),
        label: Text(text, style: const TextStyle(fontSize: 15)),
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
      ),
    );
  }
}
