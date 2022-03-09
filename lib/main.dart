import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turistycle/navigation/main_navigation.dart';
import 'package:turistycle/pages/chat/chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Turistycle',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => const MainNavigation(),
                '/chat': (context) => const ChatPage(),
              },
              theme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.blue,
              ),
            );
          }

          return const PersistorPage();
        });
  }
}

class PersistorPage extends StatelessWidget {
  const PersistorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(
          child: Text('Loading',
              style: TextStyle(color: Colors.red, fontSize: 40))),
    );
  }
}
