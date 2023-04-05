// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shoplift/pages/register_page.dart';

import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shop Lift',
        routes: {
          '/login': (BuildContext context) => const LoginPage(),
          '/register': (BuildContext context) => const RegisterPage()
        },
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Color.fromARGB(255, 66, 184, 214),
            accentColor: Colors.deepOrange[200],
            // ignore: prefer_const_constructors
            textTheme: TextTheme(
                headline1: const TextStyle(
                    fontSize: 50.0, fontWeight: FontWeight.bold),
                subtitle1: const TextStyle(
                    fontSize: 16.0, fontStyle: FontStyle.normal),
                bodyText1: const TextStyle(fontSize: 15.0))),
        home: const RegisterPage());
  }
}
